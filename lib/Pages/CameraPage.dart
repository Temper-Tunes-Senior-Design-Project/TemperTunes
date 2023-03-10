import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mood_swing/Objects/FileTypes.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';
import 'package:mood_swing/Widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class Body extends StatelessWidget {
  final List<CameraDescription>? cameras;

  const Body({required this.cameras, super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(cameras: cameras),
    );
  }
}

class LargeScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const LargeScreen({required this.cameras, super.key});

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  CameraController? cameraController;
  VideoPlayerController? videoController;
  bool initializedCamCtrl = false;
  XFile? pictureFile;
  XFile? videoFile;
  bool recording = false;
  int currentCameraIndex = 0;
  double aspectRatio = 0;
  late int maxNumCameras;

  @override
  void initState() {
    super.initState();
    if (widget.cameras == null || widget.cameras!.length == 0) {
      //camera not found
      return;
    }
    maxNumCameras = (widget.cameras!.length >= 2) ? 2 : widget.cameras!.length;
    onNewCameraSelected(toggle: true);
    cameraController = CameraController(
        //get camera
        widget.cameras![currentCameraIndex],
        ResolutionPreset.max,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420);
    cameraController?.initialize().then((_) {
      if (!mounted) {
        return;
      }

      initializedCamCtrl = true;
      setState(() {});
    }).catchError(
      (error) {
        if (error is CameraException) {
          ///////Tell the user to allow the app to access their camera/audio
          return;
        }
      },
    );
  }

  //initialize new camera controller, needed to start camera screen
  void onNewCameraSelected({required bool toggle}) async {
    if (toggle) {
      currentCameraIndex = (currentCameraIndex + 1) % maxNumCameras;
    }

    final previousCameraController = cameraController;
    // Instantiating the camera controller
    final CameraController newCameraController = CameraController(
        widget.cameras![currentCameraIndex], ResolutionPreset.max,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.yuv420);

    // Dispose the previous controller if it exists
    initializedCamCtrl = false;
    setState(() {});
    await previousCameraController?.dispose();

    // Replace with the new controller that has diff properties when user flips cam
    if (mounted) {
      setState(() {
        cameraController = newCameraController;
      });
    }

    // Update UI if controller updated
    newCameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize Controller
    newCameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      initializedCamCtrl = true;
      aspectRatio = newCameraController.value.aspectRatio;
      setState(() {});
    }).catchError((error) {
      if (error is CameraException) {
        print('Error initializing camera: $error');
        return;
      }
    });
  }

  //Dispose of the controller when the widget is disposed
  @override
  void dispose() {
    cameraController?.dispose();
    videoController?.dispose();
    super.dispose();
  }

  Future<void> _startVideoPlayer() async {
    if (videoFile != null) {
      videoController = VideoPlayerController.network(videoFile!.path);
      await videoController!.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });

      await videoController!.setLooping(true);
      await videoController!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Ratio of device screen
    //  double screenRatio = MediaQuery.of(context).size.aspectRatio;
    // Ratio of camera or device screen if the camera isn't initialized
    //var tempRatio = (aspectRatio != 0) ? aspectRatio : (screenRatio);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        //background
        decoration: BoxDecoration(
          color: Colors.black,
          // image: DecorationImage(
          //     image: (defaultTargetPlatform == TargetPlatform.iOS ||
          //             defaultTargetPlatform == TargetPlatform.android)
          //         ? AssetImage("assets/userPageSmall.png")
          //         : AssetImage("assets/userPageLarge.png"),
          //     fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.only(left: 0.01 * width, top: 0.06 * height),
            // ),

            Stack(
              alignment: Alignment.center,
              children: [
                //Camera Box
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.06 * height,
                      left: 0.02 * width,
                      right: 0.02 * width),
                  child: Center(
                    child: SizedBox(
                      //          height: (height * 0.7 * ((tempRatio < 1) ? ((1 / tempRatio / screenRatio)) : 1)),
                      //          width: (width * 0.7 * (tempRatio / screenRatio)),

                      //      height: height * 0.75,
                      height: height * 0.93,
                      width: width,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black, //borders on photos
                          // border: Border.all(
                          //     color: MyPalette.darkBlue, width: height * 0.01)
                        ),
                        child: (pictureFile != null)
                            ?
                            //Display image to user
                            Image.network(
                                pictureFile!.path,
                              )
                            : (videoFile != null)
                                ?
                                //allow user to play video (video_player plugin)
                                (videoController != null &&
                                        videoController!.value.isInitialized)
                                    //display the video
                                    ? VideoPlayer(videoController!)
                                    //controller not ready means that video is loading
                                    : Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      )
                                //show camera preview if initialized
                                : (initializedCamCtrl)
                                    ? CameraPreview(cameraController!)
                                    //otherwise show black container
                                    : Material(
                                        color: Colors.black,
                                      ),
                      ),
                    ),
                  ),
                ),

                //Buttons
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.05,
                      // left: 0.02 * height,
                      // right: 0.02 * height,
                      //  bottom: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///CAMERA BUTTONS
                        if (videoFile != null || pictureFile != null) ...{
                          ///back button
                          CameraButtonConfirmOrBack(
                            context: context,
                            heroTag: "Back Button",
                            text: "Retake",
                            onPressed: () async {
                              pictureFile = null;
                              videoFile = null;
                              onNewCameraSelected(toggle: false);
                              setState(() {});
                            },
                          ),

                          ///confirm button
                          CameraButtonConfirmOrBack(
                            context: context,
                            heroTag: "Confirm Button",
                            text: "Confirm",
                            onPressed: () async {
                              FileType type = pictureFile != null
                                  ? FileType.JPEG
                                  : FileType.MP4;
                              await DatabaseRouter()
                                  .uploadFile(pictureFile ?? videoFile, type);
                              Navigator.pop(context);
                              //var res = await CloudFunctions().get_mood();
                              //print(res);
                              //NEXT PAGE TBD
                            },
                          )
                        } else if (recording) ...{
                          CameraButton(
                            context: context,
                            toolTipText: 'Stop Recording',
                            heroTag: "Stop Recording",
                            icon: Icons.stop_circle_rounded,
                            onPressed: () async {
                              videoFile =
                                  await cameraController?.stopVideoRecording();
                              cameraController?.dispose();
                              initializedCamCtrl = false;
                              recording = false;
                              setState(() {});
                              await _startVideoPlayer();
                            },
                          ),
                        } else ...{
                          ///Camera Navbar
                          Container(
                            height: 0.1 * height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 0.05 * width),

                                  ///return to app
                                  child: IconButton(
                                    icon: Icon(Icons.exit_to_app_rounded),
                                    tooltip: 'Return to homepage',
                                    color: Colors.grey,
                                    iconSize: 0.05 * height,
                                    hoverColor: Color.fromARGB(255, 75, 79, 95),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                                CameraButton(
                                  context: context,
                                  toolTipText: 'Record Video',
                                  heroTag: "Record Video",
                                  icon: Icons.videocam_rounded,
                                  onPressed: () async {
                                    await cameraController
                                        ?.startVideoRecording();
                                    recording = true;
                                    setState(() {});
                                  },
                                ),
                                CameraButton(
                                  context: context,
                                  toolTipText: 'Take Picture',
                                  heroTag: "Snap Picture",
                                  icon: Icons.camera_rounded,
                                  onPressed: () async {
                                    pictureFile =
                                        await cameraController?.takePicture();
                                    cameraController?.dispose();
                                    initializedCamCtrl = false;
                                    // runModel();
                                    setState(() {});
                                  },
                                ),
                                CameraButton(
                                  context: context,
                                  toolTipText: 'Change Camera',
                                  heroTag: "Toggle Camera",
                                  icon: Icons.flip_camera_ios_rounded,
                                  onPressed: () async {
                                    onNewCameraSelected(toggle: true);
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        }
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///"main function"
class CameraPage extends StatefulWidget {
  CameraPage();

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  static const Key PageKey = Key("Camera Page");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PageKey,
      resizeToAvoidBottomInset: false,
      //     appBar: AppBar(
      //     title: Text("Emotion Identification",
      //     style: TextStyle(
      //     fontFamily: 'Share Tech', fontWeight: FontWeight.bold)),
      // backgroundColor: MyPalette.darkTurqoise,
      //     ),

      ///camera preview
      body: FutureBuilder<List<CameraDescription>>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Body(cameras: snapshot.data ?? []);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

//CameraButton Widget

class CameraButton extends StatelessWidget {
  final IconData icon;
  final String toolTipText;
  final void Function()? onPressed;
  final BuildContext context;
  final String heroTag;
  const CameraButton(
      {required this.context,
      required this.heroTag,
      required this.icon,
      required this.onPressed,
      required this.toolTipText,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: Container(
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            //  border: Border.all(width: width * 0.002, color: Colors.black),
            ),
        child: FloatingActionButton(
          hoverColor: Color.fromARGB(255, 75, 79, 95),
          hoverElevation: height * 0.035,
          elevation: 0,
          heroTag: heroTag,
          tooltip: toolTipText,
          //           shape: CircleBorder(),
          backgroundColor: MyPalette.white,
          onPressed: onPressed,
          child: Icon(icon, size: height * 0.05, color: Colors.grey),
        ),
      ),
    );
  }
}

class CameraButtonConfirmOrBack extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final BuildContext context;
  final String heroTag;
  const CameraButtonConfirmOrBack(
      {required this.context,
      required this.heroTag,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05, right: width * 00.05, bottom: 0.05 * height),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)

            //   border: Border.all(width: width * 0.002, color: Colors.black),
            ),
        child: SizedBox(
          height: 0.07 * height,
          width: 0.3 * width,
          child: FloatingActionButton(
            hoverColor: Color.fromARGB(255, 75, 79, 95),
            hoverElevation: height * 0.035,
            heroTag: heroTag,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            //RectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.grey.withOpacity(0.7),
            onPressed: onPressed,
            child: FittedBox(
              child: Text(
                text,
                style: TextStyle(
                  color: MyPalette.white,
                  fontFamily: 'Share Tech',
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
