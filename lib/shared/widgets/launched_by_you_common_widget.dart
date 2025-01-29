import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../styles/icon_gray.dart';

class LaunchedCourseWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String buyers;

  const LaunchedCourseWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buyers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: AppColors.courseBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: Colors.white,
          width: 0.2,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: constraints.maxHeight * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0), // Reduced padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14, // Slightly reduced font size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Flexible(
                            child: Text(
                              subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12, // Slightly reduced font size
                                color: Color(0xFFD0D0D0),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '${buyers} Buyers',
                              style: const TextStyle(
                                fontSize: 12, // Slightly reduced font size
                                color: AppColors.signUpOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LogoCircle(
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.white,
                              size: 12, // Reduced icon size
                            ),
                          ),
                          SizedBox(width: 4),
                          LogoCircle(
                            icon: Icon(
                              Icons.fast_forward_rounded,
                              color: AppColors.white,
                              size: 12, // Reduced icon size
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
