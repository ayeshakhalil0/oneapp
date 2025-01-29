import 'package:flutter/material.dart';
import '../shared/screens/common_background.dart';
import '../shared/widgets/main_features_common_widget.dart';
import '../shared/styles/common_header.dart';
import '../screens/purchased_course.dart';
import '../screens/launch_by_you.dart';
import '../screens/purchased_by_you.dart';
import '../screens/telegram_group.dart';
import '../screens/discord_group.dart';

class MainFeatures extends StatelessWidget {
  const MainFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              const CommonHeader(title: 'Main Features'),
              MainFeaturesItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PurchasedCourse(),
                    ),
                  );
                },
                text: 'Purchased Course',
                leftIcon: Icons.golf_course,
              ),
              const SizedBox(
                height: 10,
              ),
              MainFeaturesItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LaunchByYou(),
                    ),
                  );
                },
                text: 'Created by You',
                leftIcon: Icons.add,
              ),
              const SizedBox(
                height: 10,
              ),
              MainFeaturesItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PurchasedByYou(),
                    ),
                  );
                },
                text: 'Purchased by You',
                leftIcon: Icons.shop_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              MainFeaturesItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelegramGroup(),
                    ),
                  );
                },
                text: 'Telegram Group',
                leftIcon: Icons.group,
              ),
              const SizedBox(
                height: 10,
              ),
              MainFeaturesItemWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiscordGroup(),
                    ),
                  );
                },
                text: 'Discord Group',
                leftIcon: Icons.group,
              ),
              const SizedBox(
                height: 10,
              ),
              MainFeaturesItemWidget(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Feature1Screen(),
                  //   ),
                  // );
                },
                text: 'Website Plugin',
                leftIcon: Icons.web,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
