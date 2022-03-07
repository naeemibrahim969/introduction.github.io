import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/services/authentication_service.dart';
import 'package:uipractice/utils/paths.dart';

@singleton
class RegisterViewModel extends BaseViewModel{

  final NavigationService _navigationService = getIt<NavigationService>();
  final DialogService _dialogService = getIt<DialogService>();
  final AuthenticationService _authenticationService = getIt<AuthenticationService>();

  Future signUp({required String email,required String password}) async{
    setBusy(true);
    var result = await _authenticationService.signUpWithEmail(email: email, password: password);
    setBusy(true);

    if(result is bool){
      if(result){
        _navigationService.navigateTo(Paths.homeView);
      }else{
        await _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'Firebase Sign Up Failed, Please try again later'
        );
      }
    }else{
      print(result.toString());
      await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: result.toString()
      );
    }
  }

  void navigateToLogin(){
    _navigationService.navigateTo(Paths.loginView);
  }

}