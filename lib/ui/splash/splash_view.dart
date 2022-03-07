import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/components/background.dart';
import 'package:uipractice/ui/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;//screen width height
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      viewModelBuilder: () => getIt<SplashViewModel>(),
      builder: (context, model, child) {
        return Scaffold(
          body: Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to EDU',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/icons/chat.svg',height: size.height * 0.5,)
              ],
            ),
          ),
        );
      },
      onModelReady: (model) => SchedulerBinding.instance
          ?.addPostFrameCallback((_) => model.navigateToNextView()),
    );
  }

}
