import 'package:flutter/material.dart';
import '../shared/screens/common_background.dart';
import '../shared/styles/common_header.dart';
import '../shared/widgets/purchased_course_common_widget.dart';

class PurchasedCourse extends StatelessWidget {
  const PurchasedCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CommonBackground(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonHeader(title: 'Purchased Course'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PurchasedCourseWidget(
                        image: 'assets/images/thumbnail3.jpeg',
                        title: 'Basic of Stock Market',
                        subtitle: 'Learn trading from beginner to advanced',
                        video: 20,
                        language: 'English',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      PurchasedCourseWidget(
                        image: 'assets/images/thumbnail4.png',
                        title: 'Basic of Stock Market',
                        subtitle: 'Learn trading from beginner to advanced',
                        video: 10,
                        language: 'Hindi',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
