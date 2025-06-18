import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../../data/models/employee/request/fetch_users_request_body_model.dart';
import '../../repository/users/users_repository.dart';

class FeatchUsersListUseCase
    extends BaseUseCase<BaseModel, FetchUsersRequesBodyModel> {
  final BaseUsersRepository baseUsersRepository;

  FeatchUsersListUseCase(this.baseUsersRepository);

  @override
  Future<Either<Failure, BaseModel>> call(
      FetchUsersRequesBodyModel parameters) async {
    return await baseUsersRepository.getEmployeesList(parameters);
  }
}
