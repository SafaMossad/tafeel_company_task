import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/resources.dart';
import '../../../widgets/spaces.dart';

class UsersListShimmerTile extends StatelessWidget {
  const UsersListShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p12.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.white,
                height: 80.w,
                width: 80.w,
              ),
            ),
            HorizontalSpace(AppPadding.p12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16.h,
                    width: 120.w,
                    color: Colors.white,
                  ),
                  VerticalSpace(8.h),
                  Container(
                    height: 14.h,
                    width: 180.w,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
