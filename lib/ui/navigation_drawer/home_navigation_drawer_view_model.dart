import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/utils/paths.dart';

@singleton
class HomeNavigationDrawerViewModel extends BaseViewModel{

  final NavigationService _navigationService = getIt<NavigationService>();
  final DialogService _dialogService = getIt<DialogService>();


  void navigateToWelcome(){
    _navigationService.navigateTo(Paths.welcome);
  }

  Future? logoutConfirm() {
    return _dialogService.showDialog(
        title: 'Logout',
        description: 'Are you sure you want to logout?'
    );
  }

}