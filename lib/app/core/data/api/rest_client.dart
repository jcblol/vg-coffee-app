import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vg_coffee_app/environment.dart';

@singleton
class RestClient {
  RestClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://${EnvironmentConfig.apiDomain}',
          ),
        )..interceptors.add(PrettyDioLogger());

  final Dio _dio;

  Future<Response<dynamic>> get(
    String path, {
    ApiType apiType = ApiType.protected,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    final requestOptions = _getOptions(apiType);
    if (headers != null) {
      requestOptions.headers?.addAll(headers);
    }
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
  }

  Options _getOptions(ApiType api) {
    switch (api) {
      case ApiType.public:
        return PublicApiOptions();
      case ApiType.protected:
        const apiToken = '';
        return ProtectedApiOptions(apiToken);
    }
  }
}

enum ApiType { public, protected }

class PublicApiOptions extends Options {
  PublicApiOptions() {
    super.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }
}

class ProtectedApiOptions extends Options {
  ProtectedApiOptions(String apiToken) {
    super.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiToken',
    };
  }
}
