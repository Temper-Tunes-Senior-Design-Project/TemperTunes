import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mood_swing/Utilities/APIRouter.dart';
import '../Objects/GenerationArguments.dart';
import '../Widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import '../Objects/Mood.dart';
import 'package:form_builder_validators/form_builder_validators.dart'
    as validator;
import 'package:bouncing_widget/bouncing_widget.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

TextEditingController playlistDurationController = TextEditingController();
TextEditingController playlistNewSongPercentController =
    TextEditingController();

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final GenerationArguments args =
        ModalRoute.of(context)!.settings.arguments as GenerationArguments;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loginPageLarge.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackArrowBtn(),
            FadeInDown(
              child: Container(
                height: height * 0.7,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Title(55),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.03 * width,
                      ),
                      child: UserInputs(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GenerationArguments args =
        ModalRoute.of(context)!.settings.arguments as GenerationArguments;

    return SafeArea(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loginPageLarge.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackArrowBtn(),
            FadeInDown(
              child: Container(
                padding:
                    EdgeInsets.only(top: 0.01 * height, bottom: 0.01 * height),
                height: height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///Title
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 0.04 * height),
                        child: Text(
                          'Customization',
                          style: TextStyle(
                            fontSize: 55,
                            fontFamily: 'Maven Pro',
                            color: MyPalette.lightPurple,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.1 * width,
                      ),
                      child: UserInputs(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInputGeneration extends StatelessWidget {
  UserInputGeneration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Title extends StatelessWidget {
  final double fontSize;
  Title(this.fontSize);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 0.04 * height),
        child: Text(
          'Customization',
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Maven Pro',
            color: MyPalette.lightPurple,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String text;
  Subtitle(this.text);
  @override
  Widget build(BuildContext context) {
    return //Padding(
        Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Maven Pro',
        color: Colors.white60,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class UserInputs extends StatefulWidget {
  @override
  _UserInputsState createState() => _UserInputsState();
}

class _UserInputsState extends State<UserInputs> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final GenerationArguments args =
        ModalRoute.of(context)!.settings.arguments as GenerationArguments;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: height * 0.06),
          FormInput(
            label: "Playlist Duration",
            controller: playlistDurationController,
            context: context,
          ),
          SizedBox(
              height:
                  height * 0.06), // add a SizedBox to provide a finite height

          FormInput(
            label: "Percentage of New Songs",
            controller: playlistNewSongPercentController,
            context: context,
          ),

          SizedBox(height: height * 0.06),

          BouncingWidget(
            onPressed: () {},
            child: Container(
              child: TextButton(
                child: Container(
                  width: 0.27 * width,
                  height: 0.1 * height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        MyPalette.slateBlue,
                        MyPalette.brightMagenta,
                        MyPalette.turqoise,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: MyPalette.brightMagenta,
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Share Tech',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    args.numberOfSongs =
                        int.tryParse(playlistDurationController.text) ?? 50;
                    args.newSongPercentage =
                        double.tryParse(playlistDurationController.text) ?? 0.5;
                    Navigator.pushNamed(
                      context,
                      '/finalize',
                      arguments: args,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final BuildContext context;

  const FormInput(
      {required this.controller,
      required this.context,
      required this.label,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      //     padding: EdgeInsets.only(top: height * 0.005),
      child: TextFormField(
        controller: controller,
        validator: FormBuilderValidators.compose([
          validator.FormBuilderValidators.required(),
          FormBuilderValidators.integer(
            errorText: "must be an integer",
          ),
          FormBuilderValidators.min(
            1,
            errorText: "must be greater than 1",
          ),
        ]),
        textAlign: TextAlign.left,
        cursorColor: Colors.white,
        style: TextStyle(
          fontFamily: 'Maven Pro',
          fontWeight: FontWeight.w100,
          color: Colors.white,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white60),
          enabledBorder: inputborder(),
          focusedBorder: focusborder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: label,
          labelText: label,
          labelStyle: TextStyle(fontSize: 15, color: Colors.white54),
        ),
      ),
    );
  }
}

///Formatting form
OutlineInputBorder inputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
    //Outline border type for TextFeild
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 2,
    ),
  );
}

OutlineInputBorder focusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: MyPalette.turqoise,
        width: 3,
      ));
}
