import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:ivorypay/src/data/data_sources/remote/interceptors/logging_interceptor.dart';
import 'package:ivorypay/src/domain/services/path_provider.services.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';

DioService get dioServiceProvider {
  //Base options for all requests, set 1 minute time out
  final baseOptions = BaseOptions(
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    sendTimeout: const Duration(minutes: 1),
    responseType: ResponseType.plain,
  );
  final cacheOptions = CacheOptions(
    store: HiveCacheStore(PathProviderService.path),
    policy:
        CachePolicy.noCache, // Bcz we can force cache on-demand in repositories
    maxStale: const Duration(days: 30), // No of days cache is valid
    keyBuilder: (options) => options.path,
  );
  final dio = Dio(baseOptions);
  //this is for avoiding certificates error cause by dio
  //https://issueexplorer.com/issue/flutterchina/dio/1285
  (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return DioService(
    dioClient: dio,
    globalCacheOptions: cacheOptions,
    interceptors: [
      // Order of interceptors very important
      if (kDebugMode) LoggingInterceptor(),

      DioCacheInterceptor(options: cacheOptions),
    ],
  );
}

/// A service class that wraps the [Dio] instance and provides methods for
/// basic network requests.
class DioService {
  DioService({
    required Dio dioClient,
    this.globalCacheOptions,
    Iterable<Interceptor>? interceptors,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
  }

  /// An instance of [Dio] for executing network requests.
  final Dio _dio;

  /// A set of cache options to be used for each request
  final CacheOptions? globalCacheOptions;

  /// An instance of [CancelToken] used to pre-maturely cancel
  /// network requests.
  final CancelToken _cancelToken;

  /// This method invokes the [cancel()] method on either the input
  /// [cancelToken] or internal [_cancelToken] to pre-maturely end all
  /// requests attached to this token.
  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  /// This method sends a `GET` request to the [endpoint], **decodes**
  /// the response and returns a parsed [dynamic] with a body of type `R`.
  ///
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [cacheOptions] are special cache instructions that can merge and override
  /// the [globalCacheOptions].
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<dynamic> get({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<dynamic>(
      endpoint,
      queryParameters: queryParams,
      options: _mergeDioAndCacheOptions(
        dioOptions: options,
        cacheOptions: cacheOptions,
      ),
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// This method sends a `POST` request to the [endpoint], **decodes**
  /// the response and returns a parsed [dynamic] with a body of type `R`.
  ///
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<dynamic> post({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<dynamic>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// This method sends a `POST` request to the [endpoint], **decodes**
  /// the response and returns a parsed [dynamic] with a body of type `R`.
  ///
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<dynamic> postMultipart({
    required String endpoint,
    required FormData data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<dynamic>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// This method sends a `PATCH` request to the [endpoint], **decodes**
  /// the response and returns a parsed [dynamic] with a body of type `R`.
  ///
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<dynamic> patch({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.patch<dynamic>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// This method sends a `PUT` request to the [endpoint], **decodes**
  /// the response and returns a parsed [dynamic] with a body of type `R`.
  ///
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<dynamic> put({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.put<dynamic>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// This method sends a `DELETE` request to the [endpoint], **decodes**
  /// the response and returns a parsed [dynamic] with a body of type `R`.
  ///
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<dynamic> delete({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<dynamic>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// A utility method used to merge together [Options]
  /// and [CacheOptions].
  ///
  /// Returns an [Options] object with [CacheOptions] stored
  /// in the `options.extra` key.
  Options? _mergeDioAndCacheOptions({
    Options? dioOptions,
    CacheOptions? cacheOptions,
  }) {
    if (dioOptions == null && cacheOptions == null) {
      return null;
    } else if (dioOptions == null && cacheOptions != null) {
      return cacheOptions.toOptions();
    } else if (dioOptions != null && cacheOptions == null) {
      return dioOptions;
    }

    final cacheOptionsMap = cacheOptions!.toExtra();
    final options = dioOptions!.copyWith(
      extra: <String, dynamic>{...dioOptions.extra!, ...cacheOptionsMap},
    );
    return options;
  }
}
