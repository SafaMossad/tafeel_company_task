import '../../../../domain/entities/users/request/featch_users_request_body_entity.dart';

class FetchUsersRequesBodyModel extends FeatchUsersRequestBodyEntity {
  const FetchUsersRequesBodyModel({
    required super.page,
    required super.perPage,
  });

  factory FetchUsersRequesBodyModel.fromJson(Map<String, dynamic> json) {
    return FetchUsersRequesBodyModel(
      page: json['page'],
      perPage: json['total_pages'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
    };
  }
}
