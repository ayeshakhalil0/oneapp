import 'package:flutter/material.dart';

// Define the colors you will use throughout your app
class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFCDCCCC);
  static const Color darkTextGray = Color(0xFF222121);
  static const Color buttonColor1 = Color(0xFFFF9B1E);
  static const Color buttonColor2 = Color(0xFFF64454);
  static const Color signUpOrange = Color(0xFFFF8123);
  static const Color lineGray = Color(0xFF808080);
  static const Color backgroundColor = Color(0xFF000000);
  static const secondaryBackgroundColor = Color(0xFFF5F5F5);
  static const containerBackground = Color(0xFF141414);
  static const courseBackground = Color(0xFF0C0C0C);
  static const telegramColor1 = Color(0xFF4282D5);
  static const telegramColor2 = Color(0xFF44A5E2);
  static const courseColor1 = Color(0xFF137E90);
  static const courseColor2 = Color(0xFF45954D);
  static const webinarColor1 = Color(0xFF137E90);
  static const webinarColor2 = Color(0xFF45954D);
  static const apiColor1 = Color(0xFF6048AE);
  static const apiColor2 = Color(0xFF662B99);
  static const payingUpColor1 = Color(0xFF5D5D81);
  static const payingUpColor2 = Color(0xFF1B918B);
  static const discordColor1 = Color(0xFF8DA4D7);
  static const discordColor2 = Color(0xFF163BB2);
  static const animationBaseColor = Color(0xFF4D280A);
  static const profileCommonWidgetColor = Color(0xFF787878);
  static const courseWidgetColor = Color(0xFF9E9E9E);
  static const videoDetailBorderColor = Color(0xFF3B3B3B);
  static const videoDetailBackgroundColor = Color(0xFF181818);
  static const videoDetailIconBackgroundColor = Color(0xFF3F3F3F);
  static const discordTelegramColor1 = Color(0xFF2EC8A8);
  static const discordTelegramColor2 = Color(0xFF2F3CB4);
  static const loginScreenIconBackground = Color(0xFF232221);
  static const walletPageTransactionBackgroundColor = Color(0xFF272727);
  static const totalEarningColor = Color(0xFF3D86F3);
  static const totalWithdrawlColor = Color(0xFF158808);
  static const amountInPurseColor = Color(0xFFFF0000);
  static const withdrawTransactionTabColor = Color(0xFF955623);
  // Color(0xFF0C0C0C),
}

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.buttonColor1,
    scaffoldBackgroundColor: AppColors.white,
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: AppColors.darkTextGray),
    //   bodyMedium: TextStyle(color: AppColors.lightGray),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(AppColors.buttonColor1),
    //   ),
    // ),
  );
}
