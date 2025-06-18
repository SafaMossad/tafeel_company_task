import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../widgets/app_widgets.dart';

class UserPersonalInformationLableComponent extends StatelessWidget {
  const UserPersonalInformationLableComponent({
    super.key,
    required this.text,
    required this.title,
    this.withDivider = true,
  });

  final String title;
  final String text;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomText(title,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeightManager.medium,
                  color: ColorManager.wormGreyColor)),
        ),
        Expanded(
          flex: 2,
          child: CustomText(text,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeightManager.medium,
                  color: ColorManager.black)),
        ),
      ],
    );
  }
}
