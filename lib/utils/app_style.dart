import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_color.dart';

class AppStyles {
  static final AppStyles _instance = AppStyles._internal();

  factory AppStyles() {
    return _instance;
  }

  AppStyles._internal();

  static TextStyle _baseTextStyle(
      Color color, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'poppins',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle _underLinedTextStyle(Color color, double fontSize,
      FontWeight fontWeight, TextDecoration? decoration) {
    return TextStyle(
        fontFamily: 'poppins',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration);
  }

  TextStyle get primMedium16 => _baseTextStyle(kPrimary, 16.0, FontWeight.w500);
  TextStyle get blackBold16 => _baseTextStyle(kBlack, 16.0, FontWeight.bold);
  TextStyle get whiteBold16 => _baseTextStyle(kWhite, 18.0, FontWeight.w500);
  TextStyle get blackBold18 => _baseTextStyle(kBlack, 18.0, FontWeight.w600);

  TextStyle get blackRegular11 => _baseTextStyle(kBlack, 11.0, FontWeight.w500);
  TextStyle get blackRegular12 => _baseTextStyle(kBlack, 12.0, FontWeight.w500);
  TextStyle get blackRegular13 => _baseTextStyle(kBlack, 13.0, FontWeight.w500);

  TextStyle get whiteRegular11 => _baseTextStyle(kWhite, 11.0, FontWeight.w500);

  TextStyle get primBold20 => _baseTextStyle(kPrimary, 20.0, FontWeight.bold);
  TextStyle get blackBold14 => _baseTextStyle(kBlack, 14.0, FontWeight.w500);
  TextStyle get blackRegular10 => _baseTextStyle(kBlack, 10.0, FontWeight.w500);
  TextStyle get blackRegular15 => _baseTextStyle(kBlack, 15.0, FontWeight.w500);
  TextStyle get greyRegular9 => _baseTextStyle(kGrey, 9.0, FontWeight.w500);
  TextStyle get greyRegular19 => _baseTextStyle(kGrey, 19.0, FontWeight.w500);
  TextStyle get greyRegular13 => _baseTextStyle(kGrey, 13.0, FontWeight.w500);

  TextStyle get blackBold13 => _baseTextStyle(kBlack, 14.0, FontWeight.w800);

  TextStyle get whiteBold14 => _baseTextStyle(
        kWhite,
        14.0,
        FontWeight.w500,
      );

  TextStyle get underLinedBlack12 => _underLinedTextStyle(
      kBlack, 12.0, FontWeight.w700, TextDecoration.underline);
}
