import 'package:dartz/dartz.dart';
import 'package:tafeel_task/data/models/user/request/fetch_users_request_body_model.dart';
import 'package:tafeel_task/domain/repository/users/users_repository.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../data_source/users/base_users_data_source.dart';
import '../../models/base_response/base_model.dart';

class UsersRepositoryImplementationRepository implements BaseUsersRepository {
  final BaseUsersRemoteDataSource baseUsersRemoteDataSource;

  UsersRepositoryImplementationRepository(this.baseUsersRemoteDataSource);

  @override
  Future<Either<Failure, BaseModel>> getUserDetails(int userId) async {
    try {
      final result = await baseUsersRemoteDataSource.getUserDetails(userId);
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.message!));
    }
  }

  @override
  Future<Either<Failure, BaseModel>> getUsersList(
      FetchUsersRequesBodyModel parameter) async {
    try {
      final result = await baseUsersRemoteDataSource.getUsersList(parameter);
      return right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMessageModel.message!));
    }
  }
}
