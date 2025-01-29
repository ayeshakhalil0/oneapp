import 'package:flutter/material.dart';
import '../shared/screens/common_background.dart';
import '../shared/styles/common_header.dart';
import '../app/theme.dart';
import '../shared/widgets/course_detail_widget.dart';

class PurchasedCourseDetailed extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int video;
  final String language;

  const PurchasedCourseDetailed({
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

    return Scaffold(
      body: CommonBackground(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeader(title: 'Purchased Course'),
              Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                        ],
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
              const SizedBox(
                height: 12,
              ),
              const Text(
                'All Courses',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: screenHeight * 0.4,
                child: ListView.builder(
                  // physics: AlwaysScrollableScrollPhysics(),
                  itemCount: video, // Total number of videos
                  itemBuilder: (context, index) {
                    return VideoInfo(
                      heading: 'Basic of Stock Market ${index + 1}',
                      number: '${index + 1}',
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
