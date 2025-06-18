import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/presentation/widgets/custom_assets_image.dart';
import 'package:tafeel_task/presentation/widgets/custom_text.dart';
import 'package:tafeel_task/presentation/widgets/spaces.dart';
import 'package:tafeel_task/presentation/widgets/tap_effect.dart';

import '../../core/resources/resources.dart';
import 'button_indicator.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final String? assetsIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final MainAxisAlignment? buttonAlignment;
  final bool withBorder;
  final bool loading;
  final TextStyle? textStyle;
  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BorderRadius? radius;
  final VoidCallback? onTap;

  const CustomButton(
      {super.key,
      this.text,
      this.assetsIcon,
      this.width,
      this.withBorder = false,
      this.height,
      this.buttonAlignment,
      this.radius,
      this.textStyle,
      this.borderColor,
      this.padding,
      this.margin,
      this.loading = false,
      this.backgroundColor,
      this.textColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      isClickable: !loading,
      onTap: loading ? null : onTap,
      child: Container(
        height: height ?? 50.h,
        width: width,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w),
        margin: margin,
        decoration: BoxDecoration(
          border: withBorder
              ? Border.all(
                  color: borderColor ??
                      backgroundColor ??
                      Theme.of(context).primaryColor)
              : null,
         
          color: backgroundColor ?? ColorManager.primary,
          borderRadius: radius ??
              BorderRadius.all(
                Radius.circular(8.r),
              ),
        ),
        child: Center(
            child: loading
                ? ButtonProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetsIcon != null
                          ? Padding(
                              padding: EdgeInsets.all(8.w),
                              child: CustomAssetsImage(
                                  height: 20.h, image: assetsIcon!),
                            )
                          : const SizedBox(),
                      assetsIcon != null
                          ? HorizontalSpace(20)
                          : const SizedBox(),
                      assetsIcon != null
                          ? Expanded(
                              child: CustomText(
                                textStyle: textStyle ??
                                    Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: textColor ?? Colors.white,
                                            fontWeight:
                                                FontWeightManager.semiBold,
                                            height: 1),
                                textAlign: TextAlign.start,
                                text ?? "",
                              ),
                            )
                          : CustomText(
                              textStyle: textStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: textColor ?? Colors.white,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          height: 1),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text ?? "",
                            ),
                      assetsIcon != null
                          ? Icon(
                              Icons.arrow_forward_ios,
                              color: ColorManager.white,
                              size: 20.h,
                            )
                          : const SizedBox(),
                    ],
                  )),
      ),
    );
  }
}
