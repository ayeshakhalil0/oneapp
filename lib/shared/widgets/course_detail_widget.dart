import 'package:flutter/material.dart';
import '../../app/theme.dart';

class VideoInfo extends StatelessWidget {
  final String heading;
  final String number;

  const VideoInfo({
    Key? key,
    required this.heading,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.fromLTRB(3, 5, 10, 5),
      width: screenWidth * 0.6,
      height: screenHeight * 0.06,
      padding: const EdgeInsets.fromLTRB(5, 6, 5, 6),
      decoration: BoxDecoration(
        color: AppColors.videoDetailBackgroundColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.videoDetailBorderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            'No.$number',
            style: const TextStyle(
              color: AppColors.lightGray,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.play_arrow_outlined,
            color: AppColors.signUpOrange,
            size: 35,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            heading,
            style: const TextStyle(
              color: AppColors.lightGray,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
