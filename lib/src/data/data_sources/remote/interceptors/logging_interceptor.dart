import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A class that intercepts network requests for logging purposes only. This is
/// the second interceptor in case of both request and response.
///
/// ** This interceptor doesn't modify the request or response in any way. And
/// only works in `debug` mode **
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;

    debugPrint('--> $httpMethod $url'); //GET www.example.com/mock_path/all

    debugPrint('\tHeaders:');
    options.headers.forEach((k, Object? v) => debugPrint('\t\t$k: $v'));

    if (options.queryParameters.isNotEmpty) {
      debugPrint('\tqueryParams:');
      options.queryParameters
          .forEach((k, Object? v) => debugPrint('\t\t$k: $v'));
    }

    if (options.data != null) {
      debugPrint('\tBody: ${options.data}');
    }

    debugPrint('--> END $httpMethod');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('<-- RESPONSE');

    debugPrint('\tStatus code: ${response.statusCode}');

    if (response.statusCode == 304) {
      debugPrint('\tSource: Cache');
    } else {
      debugPrint('\tSource: Network');
    }

    debugPrint('\tResponse: ${response.data}');

    debugPrint('<-- END HTTP');

    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    debugPrint('--> ERROR');
    final httpMethod = err.requestOptions.method.toUpperCase();
    final url = err.requestOptions.baseUrl + err.requestOptions.path;

    debugPrint('\tMETHOD: $httpMethod'); // GET
    debugPrint('\tURL: $url'); // URL
    if (err.response != null) {
      debugPrint('\tStatus code: ${err.response!.statusCode}');
      debugPrint('${err.response!.data}');
    } else {
      debugPrint('\tStatus code: ${err.response!.statusCode}');
      debugPrint('Response: ${err.response}');
      debugPrint('Error: $err');
      debugPrint('\tUnknown Error');
    }

    debugPrint('<-- END ERROR');

    return super.onError(err, handler);
  }
}
