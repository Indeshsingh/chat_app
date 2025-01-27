import 'package:chat_app/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';

class Appthemes {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldlight,
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonlightmode)),
      textTheme: TextTheme(
          bodySmall: TextStyle(color: AppColors.textfieldlightmode),
          bodyLarge: TextStyle(color: AppColors.textfieldlightmode)));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffolddark,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttondarkmode)),
      textTheme: TextTheme(
          bodySmall: TextStyle(color: AppColors.textdarkmode),
          bodyLarge: TextStyle(color: AppColors.textdarkmode)));
}
