import 'package:flutter/material.dart';
import 'package:proyecto_final/core/constants/app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 27,
    color: Color(0xFF2C473E),
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    fontFamily: 'Montserrat',
  );

  static const button = TextStyle(
    color: AppColors.textButton,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
}
