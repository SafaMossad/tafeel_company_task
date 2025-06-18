import 'package:flutter/material.dart';
import '../../core/resources/resources.dart';

class MyCircularIndicator extends StatelessWidget {
  final Color? color;
  final double? size;
  final double? strokeWidth;

  const MyCircularIndicator({super.key, this.color, this.size, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: color ?? ColorManager.primary,
        strokeWidth: strokeWidth ?? 4,
      ),
    );
  }
}
