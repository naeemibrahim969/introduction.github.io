import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/components/background.dart';
import 'package:uipractice/ui/welcome/welcome_view_model.dart';
import 'package:uipractice/utils/constants.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;//screen width height
    return ViewModelBuilder<WelcomeViewModel>.nonReactive(
      viewModelBuilder: () => getIt<WelcomeViewModel>(),
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
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset('assets/icons/chat.svg',height: size.height * 0.5,),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  width: size.width * 0.8,
                  child: TextButton(
                      onPressed: model.navigateToLogin,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                        primary: Colors.white,
                        backgroundColor: kPrimaryColor,
                        onSurface: Colors.grey,
                        shadowColor: Colors.red,
                        elevation: 5,
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      child: Text('Login'),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: size.width * 0.8,
                  child: TextButton(
                      onPressed: model.navigateToSignUp,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                        primary: Colors.black,
                        backgroundColor: kPrimaryLightColor,
                        onSurface: Colors.grey,
                        shadowColor: Colors.red,
                        elevation: 5,
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      child: Text('SignUp'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
