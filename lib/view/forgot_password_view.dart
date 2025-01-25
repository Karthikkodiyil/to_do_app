import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view/widgets/button_widget.dart';
import 'package:to_do_app/view/widgets/textfeild_widget.dart';
import 'package:to_do_app/view_model/auth_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: Consumer<AuthViewmodel>(
        builder: (context, authController, child) => Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * .15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      authController.popFunction(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  "Forgot Password",
                  style: styles.blackBold18,
                ),
                35.kW,
              ],
            ),
            30.kH,
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: SizedBox(
                child: Column(
                  children: [
                    TextFeildWidget(
                        hint: "Email",
                        controller: authController.emailController),
                    20.kH,
                    Text(
                      "Enter the email address you used to create your account and we will email you a link to reset your password.",
                      style: styles.blackRegular10,
                      textAlign: TextAlign.center,
                    ),
                    35.kH,
                    ButtonWidget(onPressed: () {}),
                    35.kH,
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
            )
          ],
        ),
      ),
    );
  }
}
