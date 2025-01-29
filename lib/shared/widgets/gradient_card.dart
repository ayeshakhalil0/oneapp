import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const GradientCard({
    Key? key,
    required this.startColor,
    required this.endColor,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.43,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              // Text at top-left
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Icon at bottom-right
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
