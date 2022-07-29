import 'package:flutter/material.dart';

import 'colors.dart';

class DefaultTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primarySwatch: _primarySwatch,
  );

  static const _primarySwatch = MaterialColor(
    AppColors.primaryInt,
    <int, Color>{
      50: Color(0xffe9fcf0),
      100: Color(0xffbdf5d1),
      200: Color(0xff91eeb2),
      300: Color(0xff65e793),
      400: Color(0xff39e074),
      500: Color(AppColors.primaryInt),
      600: Color(0xff189a46),
      700: Color(0xff116e32),
      800: Color(0xff0a421e),
      900: Color(0xff03160a)
    },
  );
}
