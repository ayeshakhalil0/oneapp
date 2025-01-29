import 'package:flutter/material.dart';
import 'dart:math';
import '../../app/theme.dart';
import '../widgets/circular_gradient_icon_background.dart';
import '../../screens/main_features.dart';

class AnimatedCircleWidget extends StatefulWidget {
  const AnimatedCircleWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCircleWidgetState createState() => _AnimatedCircleWidgetState();
}

class _AnimatedCircleWidgetState extends State<AnimatedCircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 5), // Slower animation for smoother effect
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final baseSize = screenHeight * 0.16;

    return SizedBox(
      width: screenWidth * 0.98,
      height: screenHeight * 0.25, // Increased height to fit the button
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The Animated Circle Widget
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: baseSize,
                  height: baseSize,
                  decoration: const BoxDecoration(
                    color: AppColors.animationBaseColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: AmoebaPainter(
                        progress: _controller.value,
                        color: AppColors.signUpOrange,
                      ),
                      size: Size(baseSize * 0.9, baseSize * 0.9),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: screenWidth * 0.35,
                  height: screenHeight * 0.17,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile2.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainFeatures(),
                      ),
                    );
                  },
                  child: const GradientCircleIcon(
                    icon: Icon(Icons.menu, color: Colors.white, size: 30),
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print("View Profile button pressed");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.animationBaseColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: AppColors.signUpOrange, // Border color
                  width: 1, // Border width
                ),
              ),
            ),
            child: const Text(
              'View Profile',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AmoebaPainter extends CustomPainter {
  final double progress;
  final Color color;

  AmoebaPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    const points = 60;
    final baseRadius = radius * 0.9;

    List<Offset> controlPoints = [];

    for (int i = 0; i <= points; i++) {
      final angle = (i * 2 * pi / points);
      final variation = sin(progress * 2 * pi + angle * 3) * radius * 0.05 +
          cos(progress * 4 * pi + angle * 2) * radius * 0.05;
      final currentRadius = baseRadius + variation;

      final x = center.dx + cos(angle) * currentRadius;
      final y = center.dy + sin(angle) * currentRadius;
      controlPoints.add(Offset(x, y));
    }

    controlPoints.add(controlPoints[0]);
    controlPoints.add(controlPoints[1]);

    path.moveTo(controlPoints[0].dx, controlPoints[0].dy);

    for (int i = 0; i < controlPoints.length - 3; i++) {
      // final p0 = controlPoints[i];
      final p1 = controlPoints[i + 1];
      final p2 = controlPoints[i + 2];

      // final xc1 = (p0.dx + p1.dx) / 2;
      // final yc1 = (p0.dy + p1.dy) / 2;
      final xc2 = (p1.dx + p2.dx) / 2;
      final yc2 = (p1.dy + p2.dy) / 2;

      path.quadraticBezierTo(p1.dx, p1.dy, xc2, yc2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
