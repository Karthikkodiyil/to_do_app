import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view/widgets/button_widget.dart';
import 'package:to_do_app/view/widgets/textfeild_widget.dart';
import 'package:to_do_app/view_model/auth_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Center(
          child: Consumer<AuthViewmodel>(
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
                        icon: Icon(Icons.arrow_back)),
                    Text(
                      "Create an Account",
                      style: styles.blackBold18,
                    ),
                    35.kW
                  ],
                ),
                30.kH,
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Column(
                      children: [
                        TextFeildWidget(
                            hint: "Full Name",
                            controller: authController.nameController),
                        20.kH,
                        TextFeildWidget(
                            hint: "Email",
                            controller: authController.emailController),
                        20.kH,
                        TextFeildWidget(
                            hint: "Password",
                            controller: authController.passController),
                        20.kH,
                        TextFeildWidget(
                            hint: "Confirm Password",
                            controller: authController.confirmPassController),
                        30.kH,
                        ButtonWidget(onPressed: () {}),
                        20.kH,
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Already have an account?  ",
                              style: styles.blackRegular12),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  authController.navigateLoginPage(context);
                                },
                              text: "Login",
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
        ),
      ),
    );
  }
}
