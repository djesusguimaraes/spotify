import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class DefaultTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: onPrimary,
      secondary: AppColors.second,
      onSecondary: Colors.black,
      background: AppColors.primary,
      onBackground: Colors.white,
      surface: AppColors.primaryLight,
      onSurface: Colors.white,
      error: Colors.red[900]!,
      onError: Colors.white,
    ),
    hoverColor: onPrimary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.second,
        unselectedItemColor: Colors.white),
    fontFamily: GoogleFonts.montserrat(color: onPrimary).fontFamily,
    iconTheme: IconThemeData(color: Colors.grey[500], size: 20),
  );

  static const _primarySwatch = MaterialColor(
    AppColors.secondInt,
    <int, Color>{
      50: Color(0xffe9fcf0),
      100: Color(0xffbdf5d1),
      200: Color(0xff91eeb2),
      300: Color(0xff65e793),
      400: Color(0xff39e074),
      500: Color(AppColors.secondInt),
      600: Color(0xff189a46),
      700: Color(0xff116e32),
      800: Color(0xff0a421e),
      900: Color(0xff03160a)
    },
  );

  static const Color onPrimary = Colors.white;
}
