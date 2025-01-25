import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return MaterialButton(
      onPressed: onPressed,
      color: kPrimary,
      height: 50,
      minWidth: double.infinity,
      child: Text(
        "CONTINUE",
        style: styles.whiteBold14,
      ),
    );

  }
}