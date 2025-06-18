import 'package:dio/dio.dart';

import '../error/failure.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(Exception error) {
    if (error is DioException) {
      failure = _handleDioError(error);
    } else {
      failure = ServerFailure(error.toString().substring(11));
    }
  }

  Failure _handleDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorType.connectionTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return ErrorType.sendTimeOut.getFailure();
      case DioExceptionType.receiveTimeout:
        return ErrorType.receiveTimeOut.getFailure();
      case DioExceptionType.badCertificate:
        return ErrorType.badCertificate.getFailure();
      case DioExceptionType.cancel:
        return ErrorType.cancel.getFailure();
      case DioExceptionType.badResponse:
        {
          try {
            if (dioException.response?.statusMessage != null &&
                dioException.response?.statusCode != null) {
              final String message = _getErrorMessage(dioException.response!);
              return ServerFailure(message);
            } else {
              return ErrorType.unKnown.getFailure();
            }
          } catch (e) {
            return ErrorType.badResponse.getFailure();
          }
        }

      case DioExceptionType.connectionError:
        return ErrorType.noInternetConnection.getFailure();
      case DioExceptionType.unknown:
        return ErrorType.unKnown.getFailure();
    }
  }

  String _getErrorMessage(Response response) {
    switch (response.statusCode) {
      case ResponseCode.unauthorized:
        return ResponseMessage.unauthorized;
      case ResponseCode.unKnown:
        return ResponseMessage.unKnown;
      case ResponseCode.badResponse:
        return ResponseMessage.badResponse;
      default:
        return ResponseMessage.unKnown;
    }
  }
}

enum ErrorType {
  cancel,
  connectionTimeout,
  badResponse,
  receiveTimeOut,
  sendTimeOut,
  noInternetConnection,
  badCertificate,
  unauthorized,
  unKnown,
}

extension ErrorTypeException on ErrorType {
  Failure getFailure() {
    switch (this) {
      case ErrorType.connectionTimeout:
        return ServerFailure(ResponseMessage.connectTimeOut);
      case ErrorType.badResponse:
        return ServerFailure(ResponseMessage.badResponse);
      case ErrorType.cancel:
        return ServerFailure(ResponseMessage.cancel);
      case ErrorType.receiveTimeOut:
        return ServerFailure(ResponseMessage.receiveTimeOut);
      case ErrorType.sendTimeOut:
        return ServerFailure(ResponseMessage.sendTimeOut);
      case ErrorType.noInternetConnection:
        return ServerFailure(ResponseMessage.noInternetConnection);
      case ErrorType.badCertificate:
        return ServerFailure(ResponseMessage.noInternetConnection);
      case ErrorType.unauthorized:
        return ServerFailure(ResponseMessage.unauthorized);
      case ErrorType.unKnown:
        return ServerFailure(ResponseMessage.unKnown);
    }
  }
}

class ResponseCode {
  static const int unKnown = 1;

  static const int unauthorized = 401;
  static const int badResponse = 500;
}

class ResponseMessage {
  static String cancel = "canceled";
  static String connectTimeOut = "Connect Timeout";
  static String badResponse = "Bad Response";
  static String receiveTimeOut = "receive TimeOut";
  static String sendTimeOut = "send TimeOut";
  static String noInternetConnection =
      "translate(LocaleKeys.noInternetConnection)";
  static String unKnown = " Unknown Error";
  static String unauthorized = "your session has been expired";
}
