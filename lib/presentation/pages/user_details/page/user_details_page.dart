import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tafeel_task/presentation/widgets/custom_network_image.dart';
import 'package:tafeel_task/presentation/widgets/spaces.dart';

import '../../../../core/resources/resources.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../widgets/app_widgets.dart';
import '../components/user_details_personal_info_component.dart';
import '../components/user_details_shimmer.dart';
import '../view_model/fetch_user_data_view_model.dart';

class UsersDetailsPage extends StatefulWidget {
  final int userId;
  const UsersDetailsPage({super.key, required this.userId});

  @override
  State<UsersDetailsPage> createState() => _UsersDetailsPageState();
}

class _UsersDetailsPageState extends State<UsersDetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => context
        .read<FetchUserViewModel>()
        .featchUserData(context: context, userId: widget.userId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        withBack: true,
        title: translate(LocaleKeys.userProfile),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p18.h),
        child:
            Consumer<FetchUserViewModel>(builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: UserDetailsShimmer());
          } else if (controller.userData == null) {
            return const Center(child: SomeThingWentWrongWidget());
          } else {
            final userData = controller.userData?.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: CustomNetworkImage(
                    image: userData?.avatar ?? "",
                    height: deviceHeight * 0.20,
                    width: deviceHeight * 0.20,
                    boxFit: BoxFit.cover,
                  ),
                ),
                VerticalSpace(AppPadding.p14.h),
                CustomText(
                    "${userData?.firstName ?? ""} ${userData?.lastName ?? ""}",
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(
                            color: ColorManager.black,
                            fontFamily: FontFamilyManager.manropeBoldFontFamily,
                            fontWeight: FontWeightManager.bold)),
                CustomText(userData?.email ?? "",
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorManager.wormGreyColor)),
                VerticalSpace(AppPadding.p50.h),
                UserDetailsPersonalInfoComponent(userData: userData),
              ],
            );
          }
        }),
      ),
    );
  }
}
