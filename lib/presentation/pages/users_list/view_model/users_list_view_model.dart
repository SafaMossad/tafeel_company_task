import 'package:flutter/material.dart';
import 'package:tafeel_task/core/utils/constants.dart';
import 'package:tafeel_task/data/models/user/response/user_model.dart';

import '../../../../core/utils/alerts.dart';
import '../../../../data/models/base_response/base_model.dart';
import '../../../../data/models/user/request/fetch_users_request_body_model.dart';
import '../../../../domain/use_case/user/featch_user_list.dart';

class UsersListViewModel extends ChangeNotifier {
  final FeatchUsersListUseCase _featchUsersListUseCase;

  UsersListViewModel({
    required FeatchUsersListUseCase featchUsersListUseCase,
  }) : _featchUsersListUseCase = featchUsersListUseCase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int _page = 1;
  bool _hasMore = true;
  int get page => _page;
  bool get hasMore => _hasMore;
  BaseModel<List<UsersModel?>>? _requestsData;
  BaseModel<List<UsersModel?>>? get requestsData => _requestsData;
  final List<UsersModel?> _paginatedRequestsList = [];
  List<UsersModel?> get paginatedRequestsList => _paginatedRequestsList;

  Future<void> getUsersLIst({
    required BuildContext context,
    bool isClear = true,
  }) async {
    _isLoading = true;

    if (isClear) {

      clearData(context);
    }

    if (_hasMore == true) {
      final result = await _featchUsersListUseCase.call(
        FetchUsersRequesBodyModel(
          page: _page,
          perPage: Constants.appPaginationLimit,
        ),
      );

      result.fold(
        (l) {
          Alerts.showCustomToast(
              context: context, message: l.message.toString(), isError: true);
        },
        (r) {
          List<UsersModel?> data = [];

          r.data.forEach((object) => data.add(UsersModel.fromJson(object)));

          _requestsData = BaseModel<List<UsersModel?>>(
              totalPages: r.totalPages, error: r.error, data: data);

          _paginatedRequestsList.addAll(data.map<UsersModel?>((e) {
            return e;
          }).toList());

          if (_page <= _requestsData!.totalPages!) {
            if (_page == _requestsData!.totalPages!) {
              _hasMore = false;
            }
            notifyListeners();
            _page = _page + 1;
          } else {
            _hasMore = false;
            notifyListeners();
          }
        },
      );

      _isLoading = false;
      notifyListeners();
    }
  }

  void clearData(BuildContext context) {
    _requestsData = null;
    _hasMore = true;
    _page = 1;
    _paginatedRequestsList.clear();
    notifyListeners();
  }
}
