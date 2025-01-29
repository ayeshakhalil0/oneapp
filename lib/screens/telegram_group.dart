import 'package:flutter/material.dart';
import 'package:oneapp/shared/screens/telegram_discord_screen.dart';
import '../shared/screens/common_background.dart';
import '../shared/styles/common_header.dart';

class TelegramGroup extends StatelessWidget {
  const TelegramGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              const CommonHeader(title: 'Telegram Group'),
              DiscordTelegram(
                firstText: 'Banknify Premium',
                secondText: 'Launch at, Mon 10 Dec 2024',
                firstContainerText: 'Customers',
                secondContainerText: 'Amount Earn',
                firstContainerCount: 78,
                secondContainerCount: 7800,
                firstContainerIcon: Icons.group,
                secondContainerIcon: Icons.money,
                onView: () => print('View button pressed'),
                onEdit: () => print('Edit button pressed'),
                onShare: () => print('Share button pressed'),
              ),
              const SizedBox(
                height: 10,
              ),
              DiscordTelegram(
                firstText: 'Nifty fifty Premium',
                secondText: 'Launch at, Mon 10 Dec 2024',
                firstContainerText: 'Customers',
                secondContainerText: 'Amount Earn',
                firstContainerCount: 28,
                secondContainerCount: 800,
                firstContainerIcon: Icons.group,
                secondContainerIcon: Icons.money,
                onView: () => print('View button pressed'),
                onEdit: () => print('Edit button pressed'),
                onShare: () => print('Share button pressed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
