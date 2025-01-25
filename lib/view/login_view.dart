import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/assets/assets.gen.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view/widgets/button_widget.dart';
import 'package:to_do_app/view/widgets/textfeild_widget.dart';
import 'package:to_do_app/view_model/auth_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: Consumer<AuthViewmodel>(
            builder: (context, authController, child) => Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * .15),
                SizedBox(
                  height: 75,
                  child: Image.asset(Assets.icon.mimoLightIcon.path),
                ),
                40.kH,
                TextFeildWidget(
                  hint: 'Email',
                  controller: authController.emailController,
                ),
                25.kH,
                TextFeildWidget(
                  hint: 'Password',
                  controller: authController.passController,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {
                        authController.navigateForgotPasswordPage(context);
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: styles.blackBold13,
                      )),
                ),
                15.kH,
                ButtonWidget(
                  onPressed: () {},
                ),
                20.kH,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an account?  ",
                      style: styles.blackRegular12),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          authController.navigateRegisterPage(context);
                        },
                      text: "Register",
                      style: styles.underLinedBlack12)
                ])),
                25.kH
              ],
            ),
          ),
        )),
      ),
    );
  }
}
