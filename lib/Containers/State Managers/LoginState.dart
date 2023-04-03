import 'package:flutter/material.dart';
import '../../Pages/LandingPage.dart';
import '../../Pages/LoginPage.dart';
import '../../Pages/SignupPage.dart';

//List of viable login pages
enum LoginPages { LandingPage, LoginPage, SignupPage, InfoPage }

//Register the properties of login pages
extension LoginPageExtension on LoginPages {
  static Map<LoginPages, Widget> pages = {
    LoginPages.LandingPage: LandingPage(),
    LoginPages.LoginPage: LoginPage(),
    LoginPages.SignupPage: SignupPage(),
    LoginPages.InfoPage: Container(),
  };

  //Unimplemented
  //This allows you to restrict navigation between pages based on requirements.
  // e.g: A user needs to have a valid password/account before continuing.
  static Map<LoginPages, bool Function()> assertions = {};

  //Route to the page if the assertion function passes and the page exists.
  Widget get page {
    return assertions[this]?.call() ?? true ? pages[this]! : Container();
  }
}

class LoginState extends ChangeNotifier {
  LoginPages active = LoginPages.LandingPage;
  Widget activePage = LoginPages.LandingPage.page;

  void setActive(LoginPages routePage) {
    active = routePage;
    activePage = routePage.page;
    notifyListeners();
  }

  void setPage(LoginPages routePage) {
    activePage = routePage.page;
    notifyListeners(); //setState();
  }
}
