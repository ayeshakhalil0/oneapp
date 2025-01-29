import 'package:flutter/material.dart';
import 'package:oneapp/app/theme.dart';

class LogoCircle extends StatelessWidget {
  final Icon icon;
  final double? size;

  const LogoCircle({
    Key? key,
    required this.icon,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 35,
      height: size ?? 35,
      decoration: const BoxDecoration(
        color: AppColors.videoDetailIconBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: icon),
    );
  }
}
