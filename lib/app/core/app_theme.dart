import 'package:flutter/material.dart';
import 'package:food/app/core/app_colors.dart';

abstract class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
    ),
  );
}
