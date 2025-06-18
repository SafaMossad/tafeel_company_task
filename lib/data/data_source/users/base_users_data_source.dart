//contract


import '../../../core/error/exceptions.dart';
import '../../../core/exceptions/error_handler.dart';
import '../../../core/services/network/dio/dio_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../../models/base_response/base_model.dart';
import '../../models/base_response/error_response.dart';
import '../../models/user/request/fetch_users_request_body_model.dart';

abstract class BaseUsersRemoteDataSource {
  Future<BaseModel> getUsersList(FetchUsersRequesBodyModel parameter);

  Future<BaseModel> getUserDetails(int userId);
}

class UsersRemoteDataSource extends BaseUsersRemoteDataSource {
  final DioClient? dioClient;

  UsersRemoteDataSource({required this.dioClient});

  @override
  Future<BaseModel> getUsersList(FetchUsersRequesBodyModel parameter) async {
    try {
      final response = await dioClient?.get(
        EndPoints.userEndPOint,
        queryParameters: parameter.toJson(),
      );
      if (response?.statusCode == 200) {
        var data = BaseModel.fromJson(response?.data);

        return data;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response?.data));
      }
    } on ServerException catch (serverException) {
      final errorMessage = serverException.errorMessageModel.message;
      throw ServerException(
          errorMessageModel: ErrorMessageModel(message: errorMessage));
    } on Exception catch (e) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              message: ErrorHandler.handle(e).failure.message));
    }
  }

  @override
  Future<BaseModel> getUserDetails(int userId) async {
    try {
      final response = await dioClient?.get(
        EndPoints.userDetailsEndPOint(userId),
      );
      if (response?.statusCode == 200) {
        var data = BaseModel.fromJson(response?.data);

        return data;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response?.data));
      }
    } on ServerException catch (serverException) {
      final errorMessage = serverException.errorMessageModel.message;
      throw ServerException(
          errorMessageModel: ErrorMessageModel(message: errorMessage));
    } on Exception catch (e) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              message: ErrorHandler.handle(e).failure.message));
    }
  }
}
