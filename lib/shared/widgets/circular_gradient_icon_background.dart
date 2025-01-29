import 'package:flutter/material.dart';
import '../../app/theme.dart';

class GradientCircleIcon extends StatelessWidget {
  final Widget icon;
  final double size;
  final Gradient gradient;

  const GradientCircleIcon({
    Key? key,
    required this.icon,
    this.size = 50.0,
    this.gradient = const LinearGradient(
      colors: [
        AppColors.buttonColor1,
        AppColors.buttonColor2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
