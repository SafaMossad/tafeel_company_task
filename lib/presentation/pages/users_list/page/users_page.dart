import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tafeel_task/core/resources/resources.dart';
import 'package:tafeel_task/presentation/pages/users_list/view_model/users_list_view_model.dart';
import 'package:tafeel_task/presentation/widgets/app_widgets.dart';

import '../../../../translations/local_keys.g.dart';
import '../../../widgets/indicator.dart';
import '../components/users_list_custom_list_tile_component.dart';
import '../components/users_list_shimmer_tile.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final _controller = ScrollController();

  @override
  void initState() {
    init();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        Provider.of<UsersListViewModel>(context, listen: false).getUsersLIst(
          context: context,
          isClear: false,
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) => context
        .read<UsersListViewModel>()
        .getUsersLIst(context: context, isClear: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        withBack: false,
        title: translate(LocaleKeys.usersList),
        centerTitle: true,
      ),
      body: Consumer<UsersListViewModel>(builder: (context, controller, child) {
        if (controller.isLoading) {
          return Center(
              child: ListView.builder(
            itemCount: 10, 
            itemBuilder: (context, index) => const UsersListShimmerTile(),
          ));
        } else if (controller.requestsData == null) {
          return const Center(child: SomeThingWentWrongWidget());
        } else if (controller.paginatedRequestsList.isEmpty) {
          return const Center(child: CustomEmptyDataWidget());
        } else {
          return ListView.builder(
            controller: _controller,
            itemCount: controller.paginatedRequestsList.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.paginatedRequestsList.length) {
                final user = controller.paginatedRequestsList[index];
                return UsersListCustomListTileComponent(user: user);
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppPadding.p12.h,
                  ),
                  child: Center(
                    child: controller.hasMore
                        ? const MyCircularIndicator()
                        : CustomText(
                            "No more data",
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                  ),
                );
              }
            },
          );
        }
      }),
    );
  }
}
