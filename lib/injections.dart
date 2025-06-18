import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tafeel_task/domain/use_case/user/featch_user_details.dart';
import 'package:tafeel_task/domain/use_case/user/featch_user_list.dart';

import 'core/services/network/dio/dio_client.dart';
import 'core/services/network/dio/logging_interceptor.dart';
import 'core/services/network/endpoints.dart';
import 'data/data_source/users/base_users_data_source.dart';
import 'data/repository_implementation/users/users_repository.dart';
import 'domain/repository/users/users_repository.dart';
import 'presentation/pages/user_details/view_model/fetch_user_data_view_model.dart';
import 'presentation/pages/users_list/view_model/users_list_view_model.dart';

//service locator
final sl = GetIt.instance;

Future<void> init() async {
  ///Use Case
  sl.registerLazySingleton(() => FeatchUsersListUseCase(sl()));
  sl.registerLazySingleton(() => FeatchUsersDetailsUseCase(sl()));

  ///View Model
  sl.registerLazySingleton(
      () => UsersListViewModel(featchUsersListUseCase: sl()));

  sl.registerLazySingleton(
      () => FetchUserViewModel(featchUsersDetailsUseCase: sl()));

  ///Repository

  sl.registerLazySingleton<BaseUsersRepository>(
      () => UsersRepositoryImplementationRepository(sl()));

  ///Data Source
  sl.registerLazySingleton<BaseUsersRemoteDataSource>(
      () => UsersRemoteDataSource(dioClient: sl()));

  /// External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => CancelToken());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => DioClient(
        NetworkPath.hostName,
        loggingInterceptor: sl(),
      ));
}
