import 'package:flutter/material.dart';
import '../../app/theme.dart';

Shader buildTextShader(Rect bounds) {
  return const LinearGradient(
    colors: [
      AppColors.buttonColor1,
      AppColors.buttonColor2,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(bounds);
}
