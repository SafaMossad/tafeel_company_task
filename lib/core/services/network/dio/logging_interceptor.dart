import 'package:dio/dio.dart';

import '../../../utils/logger.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;
  final _tag = 'API Request';
  Dio? dio;

  LoggingInterceptor() {
    dio = Dio();
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logData(_tag,
        "Request \n${options.method} : ${options.baseUrl} / ${options.path}  \nParameter: ${options.queryParameters}; \nHeaders: ${options.headers};  \nFormData: ${options.data.toString()}; \nEND Request");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    logData(_tag,
        "Response \nStatus: ${response.statusCode}\nURL: ${response.requestOptions.method} ${response.requestOptions.baseUrl} / ${response.requestOptions.path}");

    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
      }
    } else {
      logData(_tag, 'Response: ${response.data}');
    }
    logData(_tag, "Receive END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    logData(_tag,
        "ERROR[${err.response?.statusCode}] \nURL: ${err.requestOptions.baseUrl}${err.requestOptions.path} \nRequest Data[${err.response?.data}]");

    return super.onError(err, handler);
  }

// Retry the request if it fails due to a DioException
//use this method for refrsh token or any other retry logic
 /*  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio!.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  } */
}
