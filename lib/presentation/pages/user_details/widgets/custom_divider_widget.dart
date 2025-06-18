import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      color: ColorManager.dividerColor,
      height: 1,
      width: double.infinity,
    );
  }
}
