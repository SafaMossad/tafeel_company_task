
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/resources.dart';
import '../../../widgets/spaces.dart';

class UserDetailsShimmer extends StatelessWidget {
  const UserDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          ClipOval(
            child: Container(
              height: deviceHeight * 0.20,
              width: deviceHeight * 0.20,
              color: Colors.white,
            ),
          ),
          VerticalSpace(AppPadding.p14.h),
          // Name
          Container(
            height: AppSize.s35.h,
            width: 180.w,
            color: Colors.white,
          ),
          VerticalSpace(10.h),
          // Email
          Container(
            height: 16.h,
            width: 220.w,
            color: Colors.white,
          ),
          VerticalSpace(AppPadding.p50.h),
          // Personal Info Section
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: AppSize.s35.h,
              width: 140.w,
              color: Colors.white,
            ),
          ),
          VerticalSpace(AppPadding.p18.h),
          // Divider + Info rows
          ...List.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: AppSize.s30.h,
                        width: 100.w,
                        color: Colors.white),
                  ),
                  HorizontalSpace(12.w),
                  Expanded(
                    flex: 2,
                    child: Container(
                        height: AppSize.s30.h,
                        width: 150.w,
                        color: Colors.white),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
