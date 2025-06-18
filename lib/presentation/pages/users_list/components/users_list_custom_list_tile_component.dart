import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../data/models/employee/response/user_model.dart';
import '../../../widgets/app_widgets.dart';
import '../../../widgets/custom_network_image.dart';
import '../../../widgets/spaces.dart';

class UsersListCustomListTileComponent extends StatelessWidget {
  const UsersListCustomListTileComponent({
    super.key,
    required this.user,
  });

  final UsersModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p12.h),
      child: TapEffect(
          onTap: () {
            NavigationService.push(context, Routes.userDetailsPage,
                arguments: {"userId": user?.id});
          },
          child: Row(children: [
            ClipOval(
              child: CustomNetworkImage(
                image: user?.avatar ?? "",
                height: 80.w,
                width: 80.w,
                boxFit: BoxFit.cover,
              ),
            ),
            HorizontalSpace(AppPadding.p12.w),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("${user?.firstName} ${user?.lastName ?? ""}",
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.black)),
                CustomText(user?.email ?? "",
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontWeight: FontWeightManager.regular,
                            color: ColorManager.wormGreyColor)),
              ],
            ))
          ])),
    );
  }
}
