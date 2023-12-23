import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'rest_client.dart';

class ApiClient {
  static final Dio _dio = _createDio();

  static Dio _createDio() {
    return Dio(
      BaseOptions(connectTimeout: Duration(seconds: 15), receiveTimeout: Duration(seconds: 15)),
    );
  }

  static RestClient _restClient() {
    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
        ),
      );
    }
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions requestOptions, RequestInterceptorHandler requestInterceptorHandler) {
          requestOptions.headers.addAll({
            'Accept': 'application/json',
          });

          Duration? connectTimeout = requestOptions.connectTimeout;
          Duration? receiveTimeout = requestOptions.receiveTimeout;

          String? headerConnectionTimeout = requestOptions.headers['connection_timeout'];
          String? headerReceiveTimeout = requestOptions.headers['receive_timeout'];

          if (headerConnectionTimeout != null && headerConnectionTimeout.isNotEmpty) {
            connectTimeout = Duration(seconds: 15);
          }

          if (headerReceiveTimeout != null && headerReceiveTimeout.isNotEmpty) {
            receiveTimeout = Duration(seconds: 15);
          }

          requestOptions.connectTimeout = connectTimeout;
          requestOptions.receiveTimeout = receiveTimeout;

          return requestInterceptorHandler.next(requestOptions);
        },
        onResponse: (Response<dynamic> response, ResponseInterceptorHandler responseInterceptorHandler) {
          return responseInterceptorHandler.next(response);
        },
        onError: (DioError dioError, ErrorInterceptorHandler errorInterceptorHandler) {
          if (dioError.response?.statusCode == 401) {
            // logOutUser();
            return null;
          } else if (dioError.response?.statusCode == 403) {
            // logOutUser();
            return null;
          }

          return errorInterceptorHandler.next(dioError);
        },
      ),
    );
    return RestClient(_dio, baseUrl: 'https://jsonplaceholder.typicode.com'); //FlavorConfiguration.instance!.apiBaseUrl!);
  }

  static final RestClient _instance = _restClient();

  static RestClient get instance {
    return _instance;
  }
}
