import 'package:flutter/material.dart';
import 'package:blog/data/model/local/app_preferences_helper.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

const double textSize36 = 36;
const double textSize32 = 32;
const double textSize24 = 24;
const double textSize20 = 20;
const double textSize18 = 18;
const double textSize16 = 16;
const double textSize15 = 15;
const double textSize14 = 14;
const double textSize12 = 12;

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get w400 {
    return copyWith(
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get w500 {
    return copyWith(
        fontWeight: FontWeight.w500, color: AppColors.primaryTextColor);
  }

  TextStyle get italic {
    return copyWith(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic);
  }

  TextStyle get large {
    return copyWith(fontSize: 21);
  }

  TextStyle get w600 {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get w700 {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get semiBoldDisable {
    return copyWith(fontWeight: FontWeight.w600, color: Colors.black38);
  }

  TextStyle get w800 {
    return copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle get primaryTextColor {
    return copyWith(color: const Color(0xFF222222));
  }

  TextStyle get titleTextColor {
    return copyWith(color: AppColors.backgroundDarkMode);
  }

  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setFontWeight(FontWeight fontWeight) {
    return copyWith(fontWeight: fontWeight);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }

  TextStyle get colorAppBar {
    return copyWith(color: Colors.white);
  }

  TextStyle get colorPrimary {
    return copyWith(color: const Color(0xFF858584));
  }

  TextStyle get colorPrimaryOrange {
    return copyWith(color: const Color(0xFFFF961F));
  }

  TextStyle get colorPrimaryBlack {
    return copyWith(color: const Color(0xFF1A1917));
  }

  TextStyle get secondaryBlackColor {
    return copyWith(color: const Color(0xff5E5E5B));
  }

  TextStyle get primaryWhiteColor {
    return copyWith(color: const Color(0xFFFFFFFF));
  }

  TextStyle get secondaryWhiteColor {
    return copyWith(color: const Color(0xFFDAD9D9));
  }

  TextStyle get colorPrimaryGray {
    return copyWith(color: AppColors.contentLightModeColor);
  }
}

class TextStyles {
  static const double _height = 1.4;

  static final TextStyle _defaultStyle = TextStyle(
      fontSize: textSize14,
      height: _height,
      fontFamily: 'Bai Jamjuree',
      color: const Color(0xff505050));

  static TextStyle normalText =
      regularText16 = _defaultStyle.copyWith(fontSize: textSize16);

  static TextStyle regularText36 = _defaultStyle.copyWith(fontSize: textSize36);
  static TextStyle regularText32 = _defaultStyle.copyWith(fontSize: textSize32);
  static TextStyle regularText24 = _defaultStyle.copyWith(fontSize: textSize24);
  static TextStyle regularText20 = _defaultStyle.copyWith(fontSize: textSize20);
  static TextStyle regularText18 = _defaultStyle.copyWith(fontSize: textSize18);
  static TextStyle regularText16 = _defaultStyle.copyWith(fontSize: textSize16);
  static TextStyle regularText15 = _defaultStyle.copyWith(fontSize: textSize15);
  static TextStyle regularText14 = _defaultStyle.copyWith(fontSize: textSize14);
  static TextStyle regularText12 = _defaultStyle.copyWith(fontSize: textSize12);
  static TextStyle appBarText = _defaultStyle.colorAppBar.w700.large;
  static TextStyle boldText36 = _defaultStyle
      .copyWith(fontSize: textSize36, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText32 = _defaultStyle
      .copyWith(fontSize: textSize32, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText24 = _defaultStyle
      .copyWith(fontSize: textSize24, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText20 = _defaultStyle
      .copyWith(fontSize: textSize20, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText28 = _defaultStyle
      .copyWith(fontSize: textSize18, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText18 = _defaultStyle
      .copyWith(fontSize: textSize18, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText16 = _defaultStyle
      .copyWith(fontSize: textSize16, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText14 = _defaultStyle
      .copyWith(fontSize: textSize14, color: AppColors.backgroundDarkMode)
      .w700;
  static TextStyle boldText12 = _defaultStyle
      .copyWith(fontSize: textSize12, color: AppColors.backgroundDarkMode)
      .w700;

  static const TextStyle defaultStyle = TextStyle(
      fontSize: 14,
      color: Color(0xFF333333),
      height: _height,
      fontWeight: FontWeight.normal,
      fontFamily: 'SVN-Gilroy');
}
// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);
