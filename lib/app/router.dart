import 'package:flutter/material.dart';
import 'package:uipractice/ui/login/signin_view.dart';
import 'package:uipractice/ui/navigation_drawer/home_navigation_drawer_view.dart';
import 'package:uipractice/ui/register/register_view.dart';
import 'package:uipractice/ui/splash/splash_view.dart';
import 'package:uipractice/ui/welcome/welcome_view.dart';
import 'package:uipractice/utils/paths.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Paths.splash:
      return MaterialPageRoute(builder: (context) => SplashView());
    case Paths.welcome:
      return MaterialPageRoute(builder: (context) => WelcomeView());
     case Paths.loginView:
      return MaterialPageRoute(builder: (context) => SignInView());
    case Paths.signUpView:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case Paths.forgotView:
      // return MaterialPageRoute(builder: (context) => BottomNavigationView());
    case Paths.resetView:
      // return MaterialPageRoute(builder: (context) => MockStartupView());
     case Paths.changePassword:
      // return MaterialPageRoute(builder: (context) => MockStartupView());
     case Paths.homeView:
      return MaterialPageRoute(builder: (context) => HomeNavigationDrawerView());
     case Paths.dashBoardView:
      // return MaterialPageRoute(builder: (context) => MockStartupView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}