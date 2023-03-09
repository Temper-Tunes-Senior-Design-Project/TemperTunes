import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mood_swing/Objects/FileTypes.dart';
import 'package:mood_swing/Utilities/DatabaseRouter.dart';
import 'package:mood_swing/Widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';
import 'package:mood_swing/Widgets/CloudFunctions.dart';
import 'dart:io';

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
      //  aspectRatio = newCameraController.value.aspectRatio;
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
    double screenRatio = MediaQuery.of(context).size.aspectRatio;
    // Ratio of camera or device screen if the camera isn't initialized
    var tempRatio = (aspectRatio != 0) ? aspectRatio : (screenRatio);
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        //background
        decoration: BoxDecoration(
          image: DecorationImage(
              image: (defaultTargetPlatform == TargetPlatform.iOS ||
                      defaultTargetPlatform == TargetPlatform.android)
                  ? AssetImage("assets/userPageSmall.png")
                  : AssetImage("assets/userPageLarge.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            //Camera Box
            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Center(
                child: SizedBox(
                  height: (height *
                      0.7 *
                      ((tempRatio < 1) ? ((1 / tempRatio / screenRatio)) : 1)),
                  width: (width * 0.7 * (tempRatio / screenRatio)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple,
                        border: Border.all(
                            color: MyPalette.darkBlue, width: height * 0.01)),
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
            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (videoFile != null || pictureFile != null) ...{
                    CameraButton(
                      context: context,
                      heroTag: "Back Button",
                      icon: Icons.arrow_back_ios_rounded,
                      onPressed: () async {
                        pictureFile = null;
                        videoFile = null;
                        onNewCameraSelected(toggle: false);
                        setState(() {});
                      },
                    ),
                    CameraButton(
                      context: context,
                      heroTag: "Confirm Button",
                      icon: Icons.check_circle_rounded,
                      onPressed: () async {
                        FileType type =
                            pictureFile != null ? FileType.JPEG : FileType.MP4;
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
                    CameraButton(
                      context: context,
                      heroTag: "Record Video",
                      icon: Icons.fiber_manual_record_rounded,
                      onPressed: () async {
                        await cameraController?.startVideoRecording();
                        recording = true;
                        setState(() {});
                      },
                    ),
                    CameraButton(
                      context: context,
                      heroTag: "Snap Picture",
                      icon: Icons.camera_rounded,
                      onPressed: () async {
                        pictureFile = await cameraController?.takePicture();
                        cameraController?.dispose();
                        initializedCamCtrl = false;
                        // runModel();
                        setState(() {});
                      },
                    ),
                    CameraButton(
                      context: context,
                      heroTag: "Toggle Camera",
                      icon: Icons.flip_camera_ios_rounded,
                      onPressed: () async {
                        onNewCameraSelected(toggle: true);
                        setState(() {});
                      },
                    ),
                  }
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Small Screen
class CameraExPage extends StatelessWidget {
  CameraExPage();

  static const Key PageKey = Key("Camera Page");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PageKey,
      appBar: AppBar(
        title: Text("Emotion Identification",
            style: TextStyle(
                fontFamily: 'Share Tech', fontWeight: FontWeight.bold)),
        backgroundColor: MyPalette.darkTurqoise,
      ),
      resizeToAvoidBottomInset: false,

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
  final void Function()? onPressed;
  final BuildContext context;
  final String heroTag;
  const CameraButton(
      {required this.context,
      required this.heroTag,
      required this.icon,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: width * 0.002, color: Colors.black),
        ),
        child: FloatingActionButton(
          hoverColor: Color.fromARGB(255, 81, 0, 95),
          hoverElevation: height * 0.035,
          heroTag: heroTag,
          shape: CircleBorder(),
          backgroundColor: MyPalette.brightMagenta,
          onPressed: onPressed,
          child: Icon(icon, size: height * 0.05),
        ),
      ),
    );
  }
}

// class CameraExPage extends StatefulWidget {
//   final List<CameraDescription> cameras;
//   const CameraExPage({
//     Key? key,
//     required this.cameras,
//   }) : super(key: key);
//
//   @override
//   _CameraExPageState createState() => _CameraExPageState();
// }
//
// class _CameraExPageState extends State<CameraExPage> {
//   @override
//   void initState() {
//     initializeCamera(selectedCamera); //Initially selectedCamera = 0
//     super.initState();
//   }
//
//   late CameraController _controller; //To control the camera
//   late Future<void>
//   _initializeControllerFuture; //Future to wait until camera initializes
//   int selectedCamera = 0;
//   List<File> capturedImages = [];
//
//   initializeCamera(int cameraIndex) async {
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.cameras[cameraIndex],
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );
//
//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           FutureBuilder<void>(
//             future: _initializeControllerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 // If the Future is complete, display the preview.
//                 return CameraPreview(_controller);
//               } else {
//                 // Otherwise, display a loading indicator.
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     if (widget.cameras.length > 1) {
//                       setState(() {
//                         selectedCamera = selectedCamera == 0 ? 1 : 0;
//                         initializeCamera(selectedCamera);
//                       });
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text('No secondary camera found'),
//                         duration: const Duration(seconds: 2),
//                       ));
//                     }
//                   },
//                   icon: Icon(Icons.switch_camera_rounded, color: Colors.white),
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     await _initializeControllerFuture;
//                     var xFile = await _controller.takePicture();
//                     setState(() {
//                       capturedImages.add(File(xFile.path));
//                     });
//                   },
//                   child: Container(
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (capturedImages.isEmpty) return;
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => GalleryScreen(
//                                 images: capturedImages.reversed.toList())));
//                   },
//                   child: Container(
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white),
//                       image: capturedImages.isNotEmpty
//                           ? DecorationImage(
//                           image: FileImage(capturedImages.last),
//                           fit: BoxFit.cover)
//                           : null,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
//
// class GalleryScreen extends StatelessWidget {
//   final List<File> images;
//   const GalleryScreen({Key? key, required this.images}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gallery'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 3,
//         mainAxisSpacing: 2,
//         crossAxisSpacing: 2,
//         children: images
//             .map((image) => Image.file(image, fit: BoxFit.cover))
//             .toList(),
//       ),
//     );
//   }
// }
