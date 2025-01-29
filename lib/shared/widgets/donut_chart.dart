import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui';

class DonutChartData {
  final String name;
  final double percentage;
  final List<Color> gradientColors;

  DonutChartData({
    required this.name,
    required this.percentage,
    required this.gradientColors,
  });
}

class CustomDonutChart extends StatelessWidget {
  final List<DonutChartData> data;
  final double size;
  final double thickness;
  final String centerText;

  const CustomDonutChart({
    Key? key,
    required this.data,
    required this.size,
    this.thickness = 25, // Reduced thickness for more subtle look
    this.centerText = 'Payments',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableSize = min(constraints.maxWidth, constraints.maxHeight);
        final chartSize = min(size, availableSize * 0.8);
        final labelPadding = chartSize * 0.2;

        return Container(
          width: chartSize + (labelPadding * 2),
          height: chartSize + (labelPadding * 2),
          color: Colors.black,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: SizedBox(
                  width: chartSize,
                  height: chartSize,
                  child: CustomPaint(
                    painter: _DonutChartPainter(
                      data: data,
                      thickness: thickness,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  centerText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: chartSize * 0.1, // Increased font size
                    fontWeight: FontWeight.w500, // Slightly reduced weight
                  ),
                ),
              ),
              ...generateLabels(chartSize, labelPadding),
            ],
          ),
        );
      },
    );
  }

  List<Widget> generateLabels(double chartSize, double padding) {
    final List<Widget> labels = [];
    double startAngle = -pi / 2;
    const double gap = 0.15;

    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final sweepAngle = (2 * pi * (item.percentage / 100)) - gap;
      final labelAngle = startAngle + (sweepAngle / 2);

      final radius = (chartSize / 2) + (padding * 0.5);
      final x = cos(labelAngle) * radius + (chartSize / 2) + padding;
      final y = sin(labelAngle) * radius + (chartSize / 2) + padding;

      labels.add(
        Positioned(
          left: x - (chartSize * 0.1),
          top: y - (chartSize * 0.06),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: chartSize * 0.045,
                ),
              ),
              Text(
                '${item.percentage.toStringAsFixed(0)}%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500, // Medium weight
                  fontSize: chartSize * 0.05,
                ),
              ),
            ],
          ),
        ),
      );

      startAngle += sweepAngle + gap;
    }

    return labels;
  }
}

class _DonutChartPainter extends CustomPainter {
  final List<DonutChartData> data;
  final double thickness;
  static const double gap = 0.27; // Reduced gap for closer segments

  _DonutChartPainter({
    required this.data,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    double startAngle = -pi / 2;

    // Draw background circle with very subtle glow
    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness * 0.1
      ..color = Colors.white.withOpacity(0.03) // More subtle
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - (thickness / 2), bgPaint);

    // Draw segments with gradients
    for (var item in data) {
      final sweepAngle = (2 * pi * (item.percentage / 100)) - gap;

      // Create gradient for both glow and main segment
      final gradient = LinearGradient(
        colors: item.gradientColors,
        begin: Alignment(
          cos(startAngle + (sweepAngle / 2)),
          sin(startAngle + (sweepAngle / 2)),
        ),
        end: Alignment(
          -cos(startAngle + (sweepAngle / 2)),
          -sin(startAngle + (sweepAngle / 2)),
        ),
      ).createShader(Rect.fromCircle(center: center, radius: radius));

      // Draw outer glow
      final glowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness * 1.5
        ..strokeCap = StrokeCap.round
        ..maskFilter =
            const MaskFilter.blur(BlurStyle.outer, 20) // Increased blur
        ..shader = gradient;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - (thickness / 2)),
        startAngle + (gap / 2),
        sweepAngle - gap,
        false,
        glowPaint,
      );

      // Draw main segment
      final mainPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..strokeCap = StrokeCap.round
        ..shader = gradient;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - (thickness / 2)),
        startAngle + (gap / 2),
        sweepAngle - gap,
        false,
        mainPaint,
      );

      // Draw inner glow
      final innerGlowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness * 0.8
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 8)
        ..shader = gradient;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - (thickness / 2)),
        startAngle + (gap / 2),
        sweepAngle - gap,
        false,
        innerGlowPaint,
      );

      startAngle += sweepAngle + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
