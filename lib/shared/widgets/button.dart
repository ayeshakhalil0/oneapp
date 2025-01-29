import 'package:flutter/material.dart';
import '../../app/theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors
            .transparent), // Set background to transparent to allow the gradient to show
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 0), // Adjusted horizontal padding to 0 for full width
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.buttonColor1, // Start color
              AppColors.buttonColor2, // End color
            ],
            begin: Alignment.topCenter, // Gradient from top
            end: Alignment.bottomCenter, // Gradient to bottom
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: double.infinity, // Make the container take full width
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
