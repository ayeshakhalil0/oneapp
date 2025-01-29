import 'package:flutter/material.dart';
import 'package:oneapp/screens/purchased_course_detailed.dart';
import '../../app/theme.dart';
import '../../shared/widgets/circular_gradient_icon_background.dart';

class PurchasedCourseWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int video;
  final String language;

  const PurchasedCourseWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.video,
    required this.language,
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
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                image,
                width: screenWidth * 0.95,
                height: screenHeight * 0.24,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFD0D0D0),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '$video Videos',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.courseWidgetColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                          ),
                          onPressed: () {},
                          child: Text(
                            language,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchasedCourseDetailed(
                            image: image,
                            title: title,
                            subtitle: subtitle,
                            video: video,
                            language: language,
                          ),
                        ),
                      );
                    },
                    child: const GradientCircleIcon(
                      icon: Icon(Icons.play_arrow_outlined,
                          color: Colors.white, size: 30),
                      size: 55,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
