import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class AppThemeLight {
  static const Color primaryColor = Colors.white;

  AppBarTheme appBarTheme = AppBarTheme(
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      color: primaryColor,
      titleTextStyle:
          TextStyles.boldText16.setColor(AppColors.backgroundDarkMode)
      // brightness: Brightness.light,
      // systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
      );

  ThemeData getTheme() {
    return ThemeData(
      appBarTheme: appBarTheme,
      fontFamily: "Bai Jamjuree",
      textTheme: TextTheme(
        headlineLarge: TextStyles.boldText36.colorPrimaryBlack,
        headlineMedium: TextStyles.boldText24.colorPrimaryBlack,
        titleLarge: TextStyles.boldText18.colorPrimaryBlack,
        titleMedium: TextStyles.boldText16.colorPrimaryBlack,
        titleSmall: TextStyles.boldText14.colorPrimaryBlack,
        bodyLarge: TextStyles.regularText16.w600.colorPrimaryBlack,
        bodySmall: TextStyles.regularText16.w400.secondaryBlackColor,
        labelLarge: TextStyles.boldText12.secondaryBlackColor,
        labelMedium: TextStyles.regularText12.w400.secondaryBlackColor,
        labelSmall: TextStyles.regularText14.w500.secondaryBlackColor,
      ),
      // primarySwatch: Colors.grey,
      hintColor: AppColors.contentPlaceholder,
      disabledColor: AppColors.disableColor,
      buttonColor: AppColors.colorDivider,
      primaryColor: Colors.black,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      backgroundColor: AppColors.textThemeDarkColor,
      // dividerColor: Colors.white54,
    );
  }
}
