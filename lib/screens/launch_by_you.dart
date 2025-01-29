import 'package:flutter/material.dart';
import '../shared/screens/common_background.dart';
import '../shared/styles/common_header.dart';
import '../shared/widgets/launched_by_you_common_widget.dart';
import '../core/config/launch_by_you.config.dart';

class LaunchByYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              const CommonHeader(title: 'Launched by You'),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return LaunchedCourseWidget(
                      image: courses[index]['image']!,
                      title: courses[index]['title']!,
                      subtitle: courses[index]['subtitle']!,
                      buyers: courses[index]['buyers']!,
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
