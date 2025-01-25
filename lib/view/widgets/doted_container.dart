import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_color.dart';

class DotedContainer extends StatelessWidget {
  const DotedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PainterWidget(),
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class PainterWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double radius = size.width / 2;
    double dashWidth = 2;
    double dashSpace = 2;
    double circumference = 2 * 3.141592653589793 * radius;

    double totalDashes = circumference / (dashWidth + dashSpace);

    for (int i = 0; i < totalDashes; i++) {
      double startAngle = (i * (dashWidth + dashSpace)) / radius;
      double sweepAngle = dashWidth / radius;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
