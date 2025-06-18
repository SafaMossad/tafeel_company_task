import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafeel_task/presentation/widgets/app_widgets.dart';
import 'package:tafeel_task/presentation/widgets/indicator.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../widgets/spaces.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initNavigation();
    super.initState();
  }

  void initNavigation() async {
    await Future.delayed(const Duration(seconds: 4));
    NavigationService.pushReplacement(context, Routes.usersPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.business_outlined,
                size: 150.h,
              ),
            ),
            VerticalSpace(AppPadding.p16.h),
            CustomText(
              "Welcome to Tafeel",
              textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: ColorManager.primary,
                    fontWeight: FontWeightManager.bold
                  ),
            ),
            CustomText(
              "Welcome Back to our App ",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.black,
                  ),
            ),
            VerticalSpace(AppPadding.p50.h),
            MyCircularIndicator()
          ],
        ),
      ),
    );
  }
}
