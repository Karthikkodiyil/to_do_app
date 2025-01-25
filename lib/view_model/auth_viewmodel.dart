import 'package:flutter/material.dart';
import 'package:to_do_app/view/forgot_password_view.dart';
import 'package:to_do_app/view/home_page_view.dart';
import 'package:to_do_app/view/login_view.dart';
import 'package:to_do_app/view/register_view.dart';

class AuthViewmodel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void navigateRegisterPage(BuildContext context) {
    clearController();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterView()));
  }

  void popFunction(BuildContext context) {
    clearController();
    Navigator.pop(context);
  }

  void navigateLoginPage(BuildContext context) {
    clearController();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginView()));
  }

  void navigateForgotPasswordPage(BuildContext context) {
    clearController();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordView()));
  }

  void clearController() {
    nameController.clear();
    emailController.clear();
    passController.clear();
    confirmPassController.clear();
  }

  void navigateHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePageView()));
  }
}
