import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/utils/paths.dart';

@singleton
class WelcomeViewModel extends BaseViewModel{

  final NavigationService _navigationService = getIt<NavigationService>();

  void navigateToLogin(){
     _navigationService.navigateTo(Paths.loginView);
  }

  void navigateToSignUp(){
    _navigationService.navigateTo(Paths.signUpView);

  }
}