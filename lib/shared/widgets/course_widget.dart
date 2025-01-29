import 'package:flutter/material.dart';
import '../../app/theme.dart';
import './button.dart';
import '../styles/shaders.dart';

class CourseWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  const CourseWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: screenWidth * 0.95,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.courseBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white, // Set the border color here
            width: 0.2, // Set the border width here
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                width: screenWidth * 0.95,
                height: screenHeight * 0.24,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFD0D0D0),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      shaderCallback: buildTextShader,
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.35,
                      child: CustomButton(
                        label: 'Enroll Now',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
