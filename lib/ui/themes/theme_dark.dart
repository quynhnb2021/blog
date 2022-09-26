import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class AppThemeDark {
  static Color primaryColor = AppColors.backgroundBarDarkMode;

  AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),

    color: primaryColor,
    titleTextStyle: TextStyles.boldText16.setColor(Colors.white),

    // brightness: Brightness.light,
    // systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
  );

  ThemeData getTheme() {
    return ThemeData(
      appBarTheme: appBarTheme,
      fontFamily: "Bai Jamjuree",
      textTheme: TextTheme(
        headlineLarge: TextStyles.boldText36.primaryWhiteColor,
        headlineMedium: TextStyles.boldText24.primaryWhiteColor,
        headlineSmall: TextStyles.boldText24.primaryWhiteColor,
        titleLarge: TextStyles.boldText18.primaryWhiteColor,
        titleMedium: TextStyles.boldText16.primaryWhiteColor,
        titleSmall: TextStyles.boldText14.primaryWhiteColor,
        bodyLarge: TextStyles.regularText16.w600.primaryWhiteColor,
        bodyMedium: TextStyles.regularText16.w400.primaryWhiteColor,
        bodySmall: TextStyles.boldText14.w400.secondaryWhiteColor,
        labelLarge: TextStyles.boldText12.secondaryWhiteColor,
        labelMedium: TextStyles.regularText12.w400.secondaryWhiteColor,
        labelSmall: TextStyles.regularText14.w600.secondaryWhiteColor,
      ),
      hintColor: AppColors.contentPlaceholder,
      buttonColor: AppColors.bgButtonDarkColor,
      primaryColor: Colors.white,
      disabledColor: const Color(0xFF404040),
      // accentColor: Colors.amber,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDarkMode,
      backgroundColor: AppColors.backgroundBarDarkMode,
      // fontFamily: 'Bai Jamjuree',
      // visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
