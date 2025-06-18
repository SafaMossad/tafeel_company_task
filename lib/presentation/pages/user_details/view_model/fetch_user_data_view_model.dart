import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tafeel_task/data/models/user/response/user_model.dart';
import 'package:tafeel_task/domain/use_case/user/featch_user_details.dart';

import '../../../../core/utils/alerts.dart';
import '../../../../data/models/base_response/base_model.dart';

class FetchUserViewModel extends ChangeNotifier {
  final FeatchUsersDetailsUseCase _featchUsersDetailsUseCase;

  FetchUserViewModel({
    required FeatchUsersDetailsUseCase featchUsersDetailsUseCase,
  }) : _featchUsersDetailsUseCase = featchUsersDetailsUseCase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  BaseModel<UsersModel>? _userDataData;
  BaseModel<UsersModel>? get userData => _userDataData;

  Future<void> featchUserData({
    required BuildContext context,
    required int userId,
  }) async {
    _isLoading = true;
    notifyListeners();
    final result = await _featchUsersDetailsUseCase(userId);

    result.fold(
      (l) {
        _userDataData = BaseModel(
          error: l.message,
        );
        Alerts.showCustomToast(
            context: context, message: l.message.toString(), isError: true);
      },
      (r) {
        UsersModel? data;
        data = UsersModel.fromJson(r.data);
        _userDataData = BaseModel(data: data);
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
