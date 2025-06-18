import '../../data/models/base_response/error_response.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

// FOr example, if you want to handle local database exceptions separately
class LocalDataBaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const LocalDataBaseException({required this.errorMessageModel});
}
