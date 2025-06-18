import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../presentation/widgets/app_widgets.dart';
import '../resources/resources.dart';

class Alerts {
  static void showSnackBar(
    BuildContext context,
    String message, {
    bool forError = true,
    Duration duration = Time.t2000,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: forError ? Colors.red : ColorManager.primary,
        content: CustomText(
          message,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.black, fontSize: FontSize.s14),
        ),
      ),
    );
  }

  static void showActionSnackBar(
    BuildContext context, {
    required String message,
    required String actionLabel,
    required VoidCallback onActionPressed,
    Duration duration = Time.longTime,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: duration,
        backgroundColor: ColorManager.black,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(AppPadding.p16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8)),
        action: SnackBarAction(
            label: actionLabel,
            onPressed: onActionPressed,
            textColor: ColorManager.white),
        content: CustomText(
          message,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.white, fontSize: FontSize.s14),
        )));
  }

  static void showCustomToast({
    required BuildContext context,
    required String message,
    bool isError = false,
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: isError ? ColorManager.redColor : ColorManager.primary,
      ),
      child: CustomText(
        message,
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: /*isError ? ColorManager.white :*/ ColorManager.white,
            fontWeight: FontWeightManager.semiBold),
      ),
    );
    FToast? fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
