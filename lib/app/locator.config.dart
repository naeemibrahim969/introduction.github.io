// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i6;

import '../services/api_service.dart' as _i3;
import '../services/authentication_service.dart' as _i4;
import '../services/third_party_services.dart' as _i14;
import '../ui/bottom_navigation/bottom_navigation_viewmodel.dart' as _i5;
import '../ui/login/signin_view_model.dart' as _i10;
import '../ui/navigation_drawer/home_navigation_drawer_view_model.dart' as _i7;
import '../ui/navigation_drawer/menu/menu_view_model.dart' as _i8;
import '../ui/register/register_view_model.dart' as _i9;
import '../ui/splash/splash_view_model.dart' as _i11;
import '../ui/todo/todo_viewmodel.dart' as _i12;
import '../ui/welcome/welcome_view_model.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServices = _$ThirdPartyServices();
  gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService());
  gh.lazySingleton<_i4.AuthenticationService>(
      () => _i4.AuthenticationService());
  gh.singleton<_i5.BottomNavigationViewModel>(_i5.BottomNavigationViewModel());
  gh.lazySingleton<_i6.BottomSheetService>(
      () => thirdPartyServices.bottomSheetService);
  gh.lazySingleton<_i6.DialogService>(() => thirdPartyServices.dialogService);
  gh.singleton<_i7.HomeNavigationDrawerViewModel>(
      _i7.HomeNavigationDrawerViewModel());
  gh.singleton<_i8.MenuViewModel>(_i8.MenuViewModel());
  gh.lazySingleton<_i6.NavigationService>(
      () => thirdPartyServices.navigationService);
  gh.singleton<_i9.RegisterViewModel>(_i9.RegisterViewModel());
  gh.singleton<_i10.SignInViewModel>(_i10.SignInViewModel());
  gh.lazySingleton<_i6.SnackbarService>(
      () => thirdPartyServices.snackBarService);
  gh.singleton<_i11.SplashViewModel>(_i11.SplashViewModel());
  gh.singleton<_i12.TodoViewModel>(_i12.TodoViewModel());
  gh.singleton<_i13.WelcomeViewModel>(_i13.WelcomeViewModel());
  return get;
}

class _$ThirdPartyServices extends _i14.ThirdPartyServices {
  @override
  _i6.BottomSheetService get bottomSheetService => _i6.BottomSheetService();
  @override
  _i6.DialogService get dialogService => _i6.DialogService();
  @override
  _i6.NavigationService get navigationService => _i6.NavigationService();
  @override
  _i6.SnackbarService get snackBarService => _i6.SnackbarService();
}
