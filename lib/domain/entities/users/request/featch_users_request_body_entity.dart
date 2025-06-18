import 'package:equatable/equatable.dart';

class FeatchUsersRequestBodyEntity extends Equatable {
  final int? page;
  final int? perPage;

  const FeatchUsersRequestBodyEntity({
    this.page,
    this.perPage,
  });

  @override
  List<Object?> get props => [
        page,
        perPage,
      ];
}
