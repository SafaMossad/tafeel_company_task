import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';

class ButtonProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const ButtonProgressIndicator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? ColorManager.white,
    );
  }
}
