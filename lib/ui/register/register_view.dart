import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/components/background.dart';
import 'package:uipractice/components/or_divider.dart';
import 'package:uipractice/components/register_background.dart';
import 'package:uipractice/components/rounded_input_field.dart';
import 'package:uipractice/components/rounded_password_field.dart';
import 'package:uipractice/components/social_icon.dart';
import 'package:uipractice/ui/register/register_view_model.dart';
import 'package:uipractice/utils/constants.dart';

class RegisterView extends StatelessWidget {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;//screen width height
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => getIt<RegisterViewModel>(),
      builder: (context, model, child) {
        return Scaffold(
            body: RegisterBackground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.04),
                  SvgPicture.asset('assets/icons/signup.svg',height: size.height * 0.3,),
                  SizedBox(height: size.height * 0.01),
                  RoundedInputField(
                      hintText: 'Your Email',
                      iconData: Icons.person,
                      controller: emailController,
                      onChanged: (value){}
                  ),
                  RoundedPasswordField(
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: passwordController,
                      onChanged: (value){}
                  ),
                  SizedBox(height: size.height * 0.035),
                  SizedBox(
                    width: size.width * 0.8,
                    child: TextButton(
                      onPressed: (){
                        model.signUp(email: emailController.text, password: passwordController.text);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                        primary: Colors.white,
                        backgroundColor: kPrimaryColor,
                        onSurface: Colors.grey,
                        shadowColor: Colors.red,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      ),
                      child: Text('Sign Up'),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have account ? ',style: TextStyle(color: kPrimaryColor),),
                      GestureDetector(
                        onTap: model.navigateToLogin,
                        child: Text('Login Now',
                          style: TextStyle(color: kPrimaryColor,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
        );
      },
    );
  }

}
