import 'package:flutter/material.dart';
import '../shared/widgets/common_background.dart';
import '../shared/widgets/gradient_card.dart';
import '../app/theme.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Center(
              child: Text(
                'Launch Your Services',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightGray,
                ),
              ),
            ),
          ),
          // Cards
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientCard(
                    startColor: AppColors.telegramColor1,
                    endColor: AppColors.telegramColor2,
                    text: 'Telegram',
                    icon: Icons.telegram,
                    onTap: () {
                      print('Card 1 tapped');
                    },
                  ),
                  GradientCard(
                    startColor: AppColors.courseColor1,
                    endColor: AppColors.courseColor2,
                    text: 'Course',
                    icon: Icons.camera_alt_outlined,
                    onTap: () {
                      print('Card 2 tapped');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientCard(
                    startColor: AppColors.apiColor1,
                    endColor: AppColors.apiColor2,
                    text: 'Webinar',
                    icon: Icons.web,
                    onTap: () {
                      print('Card 3 tapped');
                    },
                  ),
                  GradientCard(
                    startColor: AppColors.webinarColor1,
                    endColor: AppColors.webinarColor2,
                    text: 'Api',
                    icon: Icons.api_outlined,
                    onTap: () {
                      print('Card 4 tapped');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Row 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientCard(
                    startColor: AppColors.payingUpColor1,
                    endColor: AppColors.payingUpColor2,
                    text: 'Paying up',
                    icon: Icons.payment_outlined,
                    onTap: () {
                      print('Card 5 tapped');
                    },
                  ),
                  GradientCard(
                    startColor: AppColors.discordColor2,
                    endColor: AppColors.discordColor1,
                    text: 'Discord',
                    icon: Icons.discord_outlined,
                    onTap: () {
                      print('Card 6 tapped');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
