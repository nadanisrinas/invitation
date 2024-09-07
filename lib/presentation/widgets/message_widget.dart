import 'package:flutter/material.dart';

class TrapezoidBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final double padding;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlurRadius;

  const TrapezoidBox(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.child,
      required this.shadowColor,
      required this.shadowOffset,
      required this.shadowBlurRadius,
      this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomPaint(
        size: Size(width, height),
        painter: TrapezoidShadowPainter(
          shadowColor: shadowColor,
          shadowOffset: shadowOffset,
          shadowBlurRadius: shadowBlurRadius,
        ),
      ),
      CustomPaint(
        size: Size(width, height),
        painter: TrapezoidPainter(color),
      ),
      Positioned.fill(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    ]);
  }
}

class TrapezoidShadowPainter extends CustomPainter {
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlurRadius;

  TrapezoidShadowPainter({
    required this.shadowColor,
    required this.shadowOffset,
    required this.shadowBlurRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = shadowColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    final Path path = Path()
      ..lineTo(size.width * 0.8 + shadowOffset.dx, shadowOffset.dy) //
      ..lineTo(size.width + shadowOffset.dx, size.height + shadowOffset.dy)
      ..lineTo(shadowOffset.dx, size.height + shadowOffset.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TrapezoidPainter extends CustomPainter {
  final Color color;

  TrapezoidPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..lineTo(size.width * 0.8, 0) // Top right
      ..lineTo(size.width, size.height) // Bottom right
      ..lineTo(0, size.height) // Bottom left
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MessageWidget extends StatelessWidget {
  final List<Widget> children;
  final bool isRight;
  const MessageWidget({super.key, required this.children, required this.isRight});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: isRight ? 0 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    );
  }
}
