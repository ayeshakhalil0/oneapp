import 'package:flutter/material.dart';
import 'login.dart';
import '../shared/screens/common_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return CommonBackground(
      child: Center(
        child: Image.asset(
          'assets/images/app_logo.png',
          // width: screenWidth * 0.9,
          // height: screenHeight * 0.09,
          width: 1000,
          height: 300,
        ),
      ),
    );
  }
}
