import 'package:flutter/material.dart';

class MirrorWidget extends StatelessWidget {
  final Widget child;
  final bool horizontal;

  const MirrorWidget({
    super.key,
    required this.child,
    required this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: horizontal
          ? (Matrix4.identity()..scale(horizontal ? -1.0 : 1.0, horizontal ? 1.0 : -1.0, 1.0))
          : Matrix4.identity(),
      child: child,
    );
  }
}
