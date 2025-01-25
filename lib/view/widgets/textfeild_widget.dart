import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';

class TextFeildWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const TextFeildWidget({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kGrey1),
          color: kWhite,
          boxShadow: const [
            BoxShadow(
                color: kGrey1,
                spreadRadius: 2,
                offset: Offset(0, 2),
                blurRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: TextField(
          style: styles.blackRegular15,
          controller: controller,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      ),
    );
  }
}
