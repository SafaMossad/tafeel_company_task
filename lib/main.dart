import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tafeel_task/providers.dart';

import 'config/navigation/navigation.dart';
import 'config/themes/theme_manager.dart';
import 'core/resources/resources.dart';
import 'core/utils/utils.dart';
import 'injections.dart' as di;
import 'translations/codegen_loader.g.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();

  runApp(AppProviders(
    child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar', 'SA'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getDeviceSizes(context);

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: Constants.appName,
          theme: getApplicationTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          navigatorKey: NavigationService.navigationKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
        );
      },
    );
  }
}
