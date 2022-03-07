import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/components/login_background.dart';
import 'package:uipractice/components/rounded_input_field.dart';
import 'package:uipractice/components/rounded_password_field.dart';
import 'package:uipractice/ui/login/signin_view_model.dart';
import 'package:uipractice/utils/constants.dart';

class SignInView extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;//screen width height
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => getIt<SignInViewModel>(),
      builder: (context, model, child) {
        return Scaffold(
            body: LoginBackground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset('assets/icons/login.svg',height: size.height * 0.3,),
                  RoundedInputField(
                      hintText: 'Your Email',
                      iconData: Icons.person,
                      controller: emailController,
                      onChanged: (value){}
                  ),
                  RoundedPasswordField(
                      hintText: 'Password',
                      controller: passwordController,
                      iconData: Icons.lock,
                      onChanged: (value){}
                  ),
                  SizedBox(height: size.height * 0.04),
                  SizedBox(
                    width: size.width * 0.8,
                    child: TextButton(
                      onPressed:(){
                        model.signIn(email: emailController.text, password: passwordController.text);
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
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account ? ',style: TextStyle(color: kPrimaryColor),),
                      GestureDetector(
                        onTap: model.navigateToSignUp,
                        child: Text('Sign Up Now',
                          style: TextStyle(color: kPrimaryColor,
                              fontWeight: FontWeight.bold
                          ),),
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


