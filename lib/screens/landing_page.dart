import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../shared/widgets/course_widget.dart';
import '../shared/widgets/common_background.dart';
import '../shared/styles/shaders.dart';
import '../core/config/home_page.config.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: BackgroundScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Column(
            children: [
              // Existing UI for logo and notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/app_logo.png',
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.08,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkTextGray,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Notification icon logic here
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Welcome section (already in your code)
              Container(
                width: screenWidth * 0.98,
                decoration: BoxDecoration(
                  color: AppColors.containerBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShaderMask(
                              shaderCallback: buildTextShader,
                              child: const Text(
                                "Welcome to OneApp",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Your one-stop platform for stock market trading and digital product creation. Start your journey to financial success today!",
                              style: TextStyle(
                                color: Color(0xFFD0D0D0),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        child: Transform(
                          transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/profile2.png',
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.16,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Displaying the course widgets
              Expanded(
                child: ListView.builder(
                  itemCount: courseData.length,
                  itemBuilder: (context, index) {
                    return CourseWidget(
                      image: courseData[index]['image']!,
                      title: courseData[index]['title']!,
                      subtitle: courseData[index]['subtitle']!,
                      price: courseData[index]['price']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
