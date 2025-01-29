import 'package:flutter/material.dart';
import '../../app/theme.dart';
import './circular_gradient_icon_background.dart';

class MainFeaturesItemWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData leftIcon;

  const MainFeaturesItemWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.leftIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 3, top: 3),
        width: screenWidth * 0.97,
        height: screenHeight * 0.065,
        decoration: BoxDecoration(
          color: AppColors.profileCommonWidgetColor.withOpacity(0.19),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.profileCommonWidgetColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: GradientCircleIcon(
                  icon: Icon(leftIcon, color: Colors.white, size: 25),
                  size: 40,
                ),
              ),
            ),
            // Text
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
