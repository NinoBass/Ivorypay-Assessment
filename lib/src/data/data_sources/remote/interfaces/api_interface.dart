import 'package:dio/dio.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';

/// A base class containing methods for basic API functionality.
///
/// Should be implemented by any service class that wishes to interact
/// with an API.
abstract class ApiInterface {
  /// Abstract const constructor. This constructor enables subclasses
  /// to provide const constructors so that they can be used in
  /// const expressions.
  const ApiInterface();

  Future<T> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic responseBody) converter,
  });

  Future<T> sendData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  });

  Future<T> sendMultipartFormData<T>({
    required String endpoint,
    required FormData formData,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  });

  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  });

  Future<T> patchUpdateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  });

  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAccessToken = true,
    required T Function(dynamic response) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}
