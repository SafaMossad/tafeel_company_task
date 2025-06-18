import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/resources.dart';
import '../../../../data/models/employee/response/user_model.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../widgets/app_widgets.dart';
import '../../../widgets/spaces.dart';
import '../widgets/custom_divider_widget.dart';
import 'user_personal_information_lable_component.dart';

class UserDetailsPersonalInfoComponent extends StatelessWidget {
  const UserDetailsPersonalInfoComponent({
    super.key,
    required this.userData,
  });

  final UsersModel? userData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(translate(LocaleKeys.personalInfo),
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.black,
                  fontWeight: FontWeightManager.bold)),
          VerticalSpace(AppPadding.p18.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDividerWidget(),
              UserPersonalInformationLableComponent(
                  title: translate(LocaleKeys.firstName),
                  text: userData?.firstName ?? ""),
              const CustomDividerWidget(),
              UserPersonalInformationLableComponent(
                  title: translate(LocaleKeys.lastName),
                  text: userData?.lastName ?? ""),
              const CustomDividerWidget(),
              UserPersonalInformationLableComponent(
                  title: translate(LocaleKeys.email),
                  text: userData?.email ?? ""),
            ],
          ),
        ],
      ),
    );
  }
}
