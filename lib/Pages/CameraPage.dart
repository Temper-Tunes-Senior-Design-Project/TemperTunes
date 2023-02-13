import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mood_swing/Widgets/widgets.dart';

import '../Widgets/ResponsiveWidget.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({required this.cameras, super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    ////COME BACK TO THIS
    if (widget.cameras == null || widget.cameras!.length == 0) {
      return;
    }
    cameraController =
        CameraController(widget.cameras![0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((error) {
      if (error is CameraException) {
        ///////Tell the user to allow the app to access their camera/audio
        return;
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (!cameraController.value.isInitialized) {
      return SizedBox(
        height: height * 0.5,
        width: width * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Emotion Identification",
            style: TextStyle(
                fontFamily: 'Share Tech', fontWeight: FontWeight.bold)),
        backgroundColor: MyPalette.darkTurqoise,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginPageLarge.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: Center(
                  child: SizedBox(
                    height: 400,
                    width: 400,
                    child: CameraPreview(cameraController),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: ElevatedButton(
                    onPressed: () async {
                      pictureFile = await cameraController.takePicture();
                      setState(() {});
                    },
                    child: Text("Capture Image")),
              ),
              if (pictureFile != null)
                Image.network(pictureFile!.path, height: 200)
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ResponsiveWidget(
  //     largeScreen: LargeScreen(),
  //     //smallScreen: SmallScreen(),
  //   );
  // }
}
