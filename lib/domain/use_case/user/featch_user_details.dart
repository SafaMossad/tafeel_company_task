import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../repository/users/users_repository.dart';

class FeatchUsersDetailsUseCase extends BaseUseCase<BaseModel, int> {
  final BaseUsersRepository baseUsersRepository;

  FeatchUsersDetailsUseCase(this.baseUsersRepository);

  @override
  Future<Either<Failure, BaseModel>> call(int parameters) async {
    return await baseUsersRepository.getUserDetails(parameters);
  }
}
