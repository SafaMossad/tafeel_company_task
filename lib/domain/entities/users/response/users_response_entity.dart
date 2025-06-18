import 'package:equatable/equatable.dart';

import '../../../../data/models/employee/response/user_model.dart';

class UsersResponseEntity extends Equatable {
  final List<UsersModel>? data;
  final int? page;
  final int? perPage;
  final int? totalPages;

  const UsersResponseEntity({
    required this.data,
    required this.totalPages,
    required this.perPage,
    required this.page,
  });

  @override
  List<Object?> get props => [
        data,
        totalPages,
        perPage,
        page,
      ];
}
