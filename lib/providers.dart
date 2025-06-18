import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tafeel_task/injections.dart';

import 'presentation/pages/user_details/view_model/fetch_user_data_view_model.dart';
import 'presentation/pages/users_list/view_model/users_list_view_model.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<UsersListViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<FetchUserViewModel>()),
      ],
      child: child,
    );
  }
}
