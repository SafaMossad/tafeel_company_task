import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/presentation/widgets/custom_assets_image.dart';
import 'package:tafeel_task/presentation/widgets/custom_text.dart';
import 'package:tafeel_task/presentation/widgets/spaces.dart';

import '../../core/resources/resources.dart';

class CustomEmptyDataWidget extends StatelessWidget {
  final String? message;
  final String? title;

  const CustomEmptyDataWidget({
    this.title,
    this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAssetsImage(
          image: AssetsManager.emptyListIcon,
          height: 100.h,
        ),
        VerticalSpace(AppPadding.p16.h),
        CustomText(
          title ?? " it seems you don't have any data",
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
        message != null
            ? CustomText(
                message ?? "",
                textStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorManager.black),
              )
            : SizedBox(),
        VerticalSpace(30.h),
      ],
    ));
  }
}
