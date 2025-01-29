import 'package:flutter/material.dart';
import '../../app/theme.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.darkTextGray.withOpacity(0.6),
            hintText: label,
            hintStyle: const TextStyle(color: AppColors.lightGray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
