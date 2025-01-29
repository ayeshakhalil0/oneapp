import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;

  const BackgroundScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // Black background color
      body: SafeArea(
        child: child, // Content of the screen
      ),
    );
  }
}
