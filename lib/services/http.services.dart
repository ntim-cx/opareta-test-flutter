import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:opareta_test/constants/api.dart';

class HttpService {
  BaseOptions? baseOptions;
  Dio? dio;

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      'X-CMC_PRO_API_KEY': Api.coinMarketApiKey
    };
  }

  HttpService() {
    baseOptions = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      validateStatus: (status) {
        return status! <= 500;
      },
    );
    dio = Dio(baseOptions);
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    String uri = url;
    log(uri);
    try {
      return dio!.get(
        uri,
        options: Options(
          headers: await getHeaders(),
        ),
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {}
    }
  }
}
