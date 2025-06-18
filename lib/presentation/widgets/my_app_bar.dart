import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/presentation/widgets/tap_effect.dart';

import '../../core/resources/resources.dart';
import 'custom_text.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool withBack;
  final bool withBottomCurve;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final bool isDarkStatusBar;
  final bool homeIcon;
  final bool hasTitleSpacing;
  final Color backgroundColor;
  final double? height;
  final VoidCallback? onLeadingTap;

  const MyAppbar({
    this.homeIcon = false,
    this.withBack = true,
    this.leading,
    this.title,
    this.actions,
    this.withBottomCurve = true,
    this.bottom,
    this.flexibleSpace,
    this.titleWidget,
    this.onLeadingTap,
    this.height,
    this.backgroundColor = ColorManager.primary,
    this.centerTitle = false,
    this.isDarkStatusBar = false,
    this.hasTitleSpacing = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: Row(
          children: [
            withBack
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: homeIcon ? 10.w : 20.w),
                    child: TapEffect(
                      onTap: onLeadingTap ?? () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30.h,
                        color: ColorManager.white,
                      ),
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: titleWidget ??
                    CustomText(
                      title ?? "",
                      textStyle: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: ColorManager.white,
                              fontWeight: FontWeightManager.bold,
                              fontFamily:
                                  FontFamilyManager.manropeBoldFontFamily,
                              fontSize: FontSize.s24.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ],
        ),
      ),
      actions: actions ?? [],
      actionsIconTheme:
          Theme.of(context).iconTheme.copyWith(color: ColorManager.white),

      elevation: 0,
      // elevation: AppSize.s4.h,
      centerTitle: centerTitle,
      titleSpacing: hasTitleSpacing ? AppPadding.p8.w : 0,
      // toolbarHeight: 100.h,
      flexibleSpace: ClipRRect(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(AppSize.s20.r)),
        child: Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: flexibleSpace ??
                const SizedBox(
                    width: double.infinity, height: double.infinity)),
      ),
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r))),
      bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
        statusBarIconBrightness:
            isDarkStatusBar ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            isDarkStatusBar ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80.h);
}
