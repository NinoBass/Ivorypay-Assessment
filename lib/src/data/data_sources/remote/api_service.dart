import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get/get.dart' show GetxService;
import 'package:ivorypay/src/data/data_sources/remote/dio_service.dart';
import 'package:ivorypay/src/data/data_sources/remote/interfaces/api_interface.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';

/// A service class implementing methods for basic API requests.
class ApiService extends GetxService implements ApiInterface {
  /// A public constructor that is used to initialize the API service
  /// and setup the underlying [_dioService].
  ApiService(DioService dioService) : _dioService = dioService;

  /// An instance of [DioService] for network requests
  late final DioService _dioService;

  /// An implementation of the base method for requesting a document of data
  /// from the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [converter] callback is used to **deserialize** the response body
  /// into an object of type [T].
  /// The callback is executed on the response `body`.
  /// [T] is usually set to a `Model`.
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAccessToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an `ApiInterceptor`.
  /// The default value is `true`.
  @override
  Future<T> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    JSON? headers,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  }) async {
    dynamic response;
    try {
      // Entire map of response
      response = await _dioService.get(
        endpoint: endpoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(
          headers: headers,
          extra: <String, Object?>{
            'requiresAccessToken': requiresAccessToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception {
      rethrow;
    }

    try {
      // Returning the deserialized object
      return converter(response);
    } on Exception {
      rethrow;
    }
  }

  /// An implementation of the base method for inserting [data] at
  /// the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the [dynamic]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAccessToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an `ApiInterceptor`.
  /// The default value is `true`.
  @override
  Future<T> sendData<T>({
    required String endpoint,
    required JSON data,
    JSON? headers,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  }) async {
    dynamic response;

    try {
      // Entire map of response
      response = await _dioService.post(
        endpoint: endpoint,
        data: data,
        options: Options(
          headers: headers,
          extra: <String, Object?>{
            'requiresAccessToken': requiresAccessToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception {
      rethrow;
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception {
      rethrow;
    }
  }

  /// An implementation of the base method for inserting `formdata` at
  /// the `endpoint`.
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The `formdata` contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the [dynamic]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAccessToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an `ApiInterceptor`.
  /// The default value is `true`.
  @override
  Future<T> sendMultipartFormData<T>({
    required String endpoint,
    required FormData formData,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  }) async {
    dynamic response;

    try {
      // Entire map of response
      response = await _dioService.postMultipart(
        endpoint: endpoint,
        data: formData,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'multipart/form-data',
          },
          contentType: 'multipart/form-data',
          extra: <String, Object?>{
            'requiresAccessToken': requiresAccessToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception {
      rethrow;
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception {
      rethrow;
    }
  }

  /// An implementation of the base method for updating [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the [dynamic]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAccessToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an `ApiInterceptor`.
  /// The default value is `true`.
  @override
  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    JSON? headers,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  }) async {
    dynamic response;

    try {
      // Entire map of response
      response = await _dioService.put(
        endpoint: endpoint,
        data: data,
        options: Options(
          headers: headers,
          extra: <String, Object?>{
            'requiresAccessToken': requiresAccessToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception {
      rethrow;
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception {
      rethrow;
    }
  }

  /// An implementation of the base method for updating [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the [dynamic]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAccessToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an `ApiInterceptor`.
  /// The default value is `true`.
  @override
  Future<T> patchUpdateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  }) async {
    dynamic response;

    try {
      // Entire map of response
      response = await _dioService.patch(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAccessToken': requiresAccessToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception {
      rethrow;
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception {
      rethrow;
    }
  }

  /// An implementation of the base method for deleting [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the [dynamic]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAccessToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an `ApiInterceptor`.
  /// The default value is `true`.
  @override
  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  }) async {
    dynamic response;

    try {
      // Entire map of response
      response = await _dioService.delete(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAccessToken': requiresAccessToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception {
      rethrow;
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception {
      rethrow;
    }
  }

  /// An implementation of the base method for cancelling
  /// requests pre-maturely using the [cancelToken].
  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
