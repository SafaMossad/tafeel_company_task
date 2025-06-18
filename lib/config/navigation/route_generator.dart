import 'package:flutter/material.dart';

import '../../presentation/pages/splash_screen/pages/splash_screen.dart';
import '../../presentation/pages/user_details/page/user_details_page.dart';
import '../../presentation/pages/users_list/page/users_page.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return platformPageRoute(const SplashScreen()); 
         case Routes.usersPage:
        return platformPageRoute(const UsersPage());
 
      case Routes.userDetailsPage:
        final args = settings.arguments as Map<String, dynamic>;

        return platformPageRoute(UsersDetailsPage(
          userId: args['userId'],
        ));
    

      default:
        return platformPageRoute(Container());
    }
  }
}
