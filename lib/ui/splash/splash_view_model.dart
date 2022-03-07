import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/utils/paths.dart';

@singleton
class SplashViewModel extends BaseViewModel{

  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToNextView() async{
    await Future.delayed(Duration(seconds: 2));
    await _navigationService.navigateTo(Paths.welcome);
  }
}