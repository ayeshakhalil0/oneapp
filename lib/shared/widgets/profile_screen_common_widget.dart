import 'package:flutter/material.dart';
import '../../app/theme.dart';

class ProfileItemWidget extends StatefulWidget {
  final Function() onTap;
  final String text;
  final IconData leftIcon;
  final bool isNotification;

  const ProfileItemWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.leftIcon,
    this.isNotification = false, // Default value set to false
  }) : super(key: key);

  @override
  State<ProfileItemWidget> createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  bool isSwitchOn = false; // Local state for the toggle

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 3, top: 3),
        width: screenWidth * 0.97,
        height: screenHeight * 0.065,
        decoration: BoxDecoration(
          color: AppColors.profileCommonWidgetColor.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.profileCommonWidgetColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.leftIcon,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            if (widget.isNotification)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Switch(
                  value: isSwitchOn,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.signUpOrange,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: Colors.grey.withOpacity(0.8),
                ),
              )
            else
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
