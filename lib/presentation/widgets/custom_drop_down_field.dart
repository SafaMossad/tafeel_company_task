import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/presentation/widgets/custom_text.dart';

import '../../core/resources/resources.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final String hintText;
  final bool isLoading;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final void Function()? onTap;
  final String? Function(T?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final T? value;
  final TextInputType? keyBoardType;
  final AutovalidateMode? autoValidateMode;
  final double? iconSize;
  final bool hasLoadingSuffix;
  final Color? backGround;
  final String? labelTitle;

  const CustomDropDownField({
    required this.hintText,
    this.onChanged,
    this.onTap,
    this.items,
    this.prefix,
    this.suffix,
    this.validator,
    this.keyBoardType,
    this.value,
    this.autoValidateMode,
    this.iconSize,
    this.backGround,
    this.labelTitle,
    this.hasLoadingSuffix = false,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTitle == null
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CustomText(
                    textAlign: TextAlign.center,
                    labelTitle,
                    textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeightManager.semiBold,
                        color: ColorManager.lightBlack)),
              ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: DropdownButtonFormField<T>(
            items: items ?? [],
            onChanged: onChanged,
            validator: validator,
            value: value,
            onTap: onTap,
            iconSize: iconSize ?? 30.h,
            hint: CustomText(hintText,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeightManager.light,
                    color: ColorManager.hintGreyColor)),
            isDense: true,
            isExpanded: true,
            menuMaxHeight: deviceHeight * 0.70,
            autovalidateMode: autoValidateMode,
            dropdownColor: ColorManager.white,
            icon: isLoading
                ? SizedBox(
                    width: 20.h,
                    height: 20.h,
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    Icons.keyboard_arrow_down,
                    color: items != null
                        ? ColorManager.black
                        : ColorManager.greyColor,
                  ),
            decoration: InputDecoration(
              fillColor: backGround ?? ColorManager.textFieldGreyColor,
              filled: true,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              prefixIcon: prefix != null
                  ? Padding(
                      padding: EdgeInsets.all(AppPadding.p8.w), child: prefix)
                  : null,
              suffixIcon: hasLoadingSuffix
                  ? Padding(
                      padding: EdgeInsets.all(AppPadding.p16.w),
                      child: SizedBox(
                        width: AppSize.s16.w,
                        height: AppSize.s16.w,
                        child: CircularProgressIndicator(
                            strokeWidth: AppSize.s2.w),
                      ),
                    )
                  : suffix != null
                      ? Padding(
                          padding: EdgeInsets.all(AppPadding.p16.w),
                          child: suffix)
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}
