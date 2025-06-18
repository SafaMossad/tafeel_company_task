import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/presentation/widgets/app_widgets.dart';
import 'package:tafeel_task/presentation/widgets/spaces.dart';

import '../../../core/resources/resources.dart';

class SomeThingWentWrongWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final VoidCallback? onRefresh;
  const SomeThingWentWrongWidget({
    super.key,
    this.title,
    this.message,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAssetsImage(image: AssetsManager.somethingWentWrongIcon),
            CustomText(
              title ?? "Some thing went wrong",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.lightBlack,
                    fontFamily: FontFamilyManager.manropeBoldFontFamily,
                  ),
              textAlign: TextAlign.center,
            ),
            VerticalSpace(20.h),
            onRefresh != null
                ? CustomButton(
                    onTap: onRefresh,
                    text: "Something went wrong",
                    height: 45.h,
                    textColor: ColorManager.redColor,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: FontFamilyManager.manropeBoldFontFamily,
                        color: Colors.red,
                        fontWeight: FontWeightManager.semiBold),
                    width: deviceWidth * 0.55,
                  )
                : SizedBox(),
            VerticalSpace(30.h),
          ],
        ),
      ),
    );
  }
}
