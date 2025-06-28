import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String normalText;
  final String highlightedText;

  const HighlightedText({
    super.key,
    required this.normalText,
    required this.highlightedText,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1E1E1E),
          height: 1.3,
        ),
        children: [
          TextSpan(text: normalText),
          WidgetSpan(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  highlightedText,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFF7733),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: CustomPaint(
                    size: Size(
                      _getTextWidth(context, highlightedText) + 10,
                      10,
                    ),
                    painter: CurvedUnderlinePainter(const Color(0xFFFF7733)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }
}

class CurvedUnderlinePainter extends CustomPainter {
  final Color color;

  CurvedUnderlinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 10,
      size.width,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
