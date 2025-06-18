import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../../data/models/user/request/fetch_users_request_body_model.dart';

abstract class BaseUsersRepository {
  Future<Either<Failure, BaseModel>> getUsersList(
      FetchUsersRequesBodyModel parameter);
  Future<Either<Failure, BaseModel>> getUserDetails(int userId);
}
