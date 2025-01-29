import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart'; // For logos
import '../../app/theme.dart'; // For custom themes

class PlatformSelectionWidget extends StatelessWidget {
  final String? selectedPlatform;
  final ValueChanged<String?> onPlatformChanged;

  PlatformSelectionWidget({
    Key? key,
    required this.selectedPlatform,
    required this.onPlatformChanged,
  }) : super(key: key);

  final List<Map<String, dynamic>> platforms = [
    {
      'platform': 'Facebook',
      'icon': Logo(
        Logos.facebook_logo,
        size: 10,
      )
    },
    {'platform': 'Instagram', 'icon': Logo(Logos.instagram)},
    {'platform': 'Twitter', 'icon': Logo(Logos.twitter)},
    {'platform': 'LinkedIn', 'icon': Logo(Logos.linkedin)},
    {'platform': 'Telegram', 'icon': Logo(Logos.telegram)},
    {
      'platform': 'Website',
      'icon': Logo(Logos.web_components_dot_org)
    } // Custom icon
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Where did you hear about us?",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.darkTextGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            menuMaxHeight: 150,
            menuWidth: MediaQuery.of(context).size.width * 0.75,
            borderRadius: BorderRadius.circular(10),
            value: selectedPlatform,
            onChanged: onPlatformChanged,
            hint: const Text(
              "Select platform",
              style: TextStyle(
                color: AppColors.lightGray,
              ),
            ),
            isExpanded: true,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.white,
            ),
            underline: const SizedBox(),
            dropdownColor: AppColors.darkTextGray,
            items: platforms.map<DropdownMenuItem<String>>((platform) {
              return DropdownMenuItem<String>(
                value: platform['platform'],
                child: Row(
                  children: [
                    _buildLogoCircle(
                      logo: platform['icon'],
                      backgroundColor: AppColors.loginScreenIconBackground,
                    ),
                    const SizedBox(width: 13),
                    Text(
                      platform['platform'],
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Custom method to build circular icons
  Widget _buildLogoCircle(
      {required Widget logo, required Color backgroundColor}) {
    return Container(
      width: 30, // Adjust width as needed
      height: 30, // Adjust height as needed
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: logo),
    );
  }
}
