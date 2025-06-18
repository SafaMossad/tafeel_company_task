import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/resources.dart';

String translate(String word) {
  return word.tr();
}

Widget customText(
    {Key? key,
    String? text,
    Color? color,
    double? fontSize,
    double? height,
    bool underline = false,
    double? letterSpacing,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    int? maxLines}) {
  return Text(
    text!,
    textAlign: textAlign,
    style: TextStyle(
      decoration: underline ? TextDecoration.underline : null,
      letterSpacing: letterSpacing,
      height: height,
      color: color ?? ColorManager.black,
      fontSize: fontSize?.sp ?? 14.sp,
      fontWeight: fontWeight ?? FontWeightManager.medium,
      fontFamily: FontFamilyManager.manropeFontFamily,
    ),
    overflow: overflow,
    maxLines: maxLines,
  );
}

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.textStyle,
      this.textAlign,
      this.overflow,
      this.maxLines});
  final String? text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: textStyle ?? Theme.of(context).textTheme.titleSmall,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
