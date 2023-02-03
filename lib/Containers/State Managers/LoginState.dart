import 'package:flutter/material.dart';

//List of viable login pages
enum LoginPage { LandingPage, LoginInfoPage, RegisterPage, InfoPage }

//Register the properties of login pages
extension LoginPages on LoginPage {
  static Map<LoginPage, Widget> pages = {
    LoginPage.LandingPage: Container(),
    LoginPage.LoginInfoPage: Container(),
    LoginPage.RegisterPage: Container(),
    LoginPage.InfoPage: Container(),
  };

  //Unimplemented
  //This allows you to restrict navigation between pages based on requirements.
  // e.g: A user needs to have a valid password/account before continuing.
  static Map<LoginPage, bool Function()> assertions = {};

  //Route to the page if the assertion function passes and the page exists.
  Widget get page {
    return assertions[this]?.call() ?? true ? pages[this]! : Container();
  }
}

class LoginState extends ChangeNotifier {
  Widget activePage = LoginPage.LandingPage.page;

  void setPage(LoginPage routePage) {
    activePage = routePage.page;
    notifyListeners(); //setState();
  }
}
