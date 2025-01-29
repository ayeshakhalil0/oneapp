import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  final Widget child;

  const CommonBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF010101),
              Color(0xFF230C07),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
