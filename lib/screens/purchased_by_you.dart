import 'package:flutter/material.dart';
import '../shared/screens/common_background.dart';
import '../shared/styles/common_header.dart';
import '../core/config/purchased_by_you.config.dart';
import '../shared/widgets/purchase_by_you_common_widget.dart';

class PurchasedByYou extends StatelessWidget {
  const PurchasedByYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              const CommonHeader(title: 'Purchased by You'),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return PurchasedCourseWidget(
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
