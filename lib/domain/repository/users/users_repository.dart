import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../../data/models/employee/request/fetch_users_request_body_model.dart';

abstract class BaseUsersRepository {
  Future<Either<Failure, BaseModel>> getEmployeesList(
      FetchUsersRequesBodyModel parameter);
  Future<Either<Failure, BaseModel>> getEmployeeDetails(int userId);
}
