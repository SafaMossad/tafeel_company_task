import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tafeel_task/core/utils/constants.dart';

import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  Dio? dio;
  String? token;

  DioClient(
    this.baseUrl, {
    required this.loggingInterceptor,
  }) {
    dio = Dio();
    dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(seconds: 60)
      ..options.receiveTimeout = Duration(seconds: 60)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    dio!.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool withAuthorization = true,
  }) async {
    try {
      dio!
        ..options.baseUrl = baseUrl
        ..options.connectTimeout = Duration(seconds: 60)
        ..options.receiveTimeout = Duration(seconds: 60)
        ..httpClientAdapter
        ..options.headers = {
          'Accept': 'application/json; charset=UTF-8',
          "x-api-key": Constants.apiKey
        };
      /*dio!.interceptors.add(loggingInterceptor);*/

      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
    String? filePath,
    List<FileModel>? filesPath,
    List<String>? filePathList,
    String? filePathListName,
    String? fileName,
    bool withBearer = true,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      //for clear headers and sure that there is no keys in headers because Expiration Token does not work with Authorization
      dio!.options.headers.clear();

      dio!
        ..options.baseUrl = baseUrl
        ..options.connectTimeout = Duration(seconds: 60)
        ..options.receiveTimeout = Duration(seconds: 60)
        ..httpClientAdapter
        ..options.headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "x-api-key": Constants.apiKey
        };

      if (filePath != null) {
        String fileName0 = filePath.split('/').last;
        Map<String, dynamic> body = {
          fileName ?? "image":
              await MultipartFile.fromFile(filePath, filename: fileName0),
        };
        data = FormData.fromMap(body);
      }

      if (filePathList != null) {
        for (String path in filePathList) {
          String fileName = path.split('/').last;
          data = FormData.fromMap({
            filePathListName ?? "images[]":
                await MultipartFile.fromFile(path, filename: fileName),
          });
        }
      }

      if (filesPath != null) {
        Map<String, dynamic> body = {};
        for (FileModel file in filesPath) {
          if (file.path != null) {
            String fileName = file.path!.split('/').last;
            body.addAll({
              file.name:
                  await MultipartFile.fromFile(file.path!, filename: fileName)
            });
          } else {
            for (String path in file.paths ?? []) {
              String fileName = path.split('/').last;
              data = FormData.fromMap({
                filePathListName ?? "${file.name}[]":
                    await MultipartFile.fromFile(path, filename: fileName),
              });
            }
          }
        }
        data = FormData.fromMap(body);
      }

      var response = await dio!.post(
        uri,
        data: body ?? data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (error) {
      return Future.error(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

class FileModel {
  final String name;
  final String? path;
  final List<String>? paths;

  const FileModel({
    required this.name,
    this.path,
    this.paths,
  });
}
