// ignore_for_file: constant_identifier_names, avoid_dynamic_calls

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ivorypay/src/presentation/resources/strings.res.dart';

class CustomException implements Exception {
  CustomException({
    this.code,
    this.statusCode,
    this.message,
  });

  factory CustomException.fromParsingException(
    Exception error,
    StackTrace s,
  ) {
    log(
      error.toString(),
      stackTrace: s,
    );
    return CustomException(
      statusCode: 500,
      message: errorMessage,
    );
  }

  factory CustomException.fromDioException(
    Exception error,
  ) {
    try {
      if (error is DioError) {
        //Determine the type pf DioError that error is
        switch (error.type) {
          case DioErrorType.cancel:
            return CustomException(
              statusCode: error.response?.statusCode,
            );
          case DioErrorType.connectionError:
            return CustomException(
              statusCode: error.response?.statusCode,
            );
          case DioErrorType.badCertificate:
            return CustomException(
              statusCode: error.response?.statusCode,
            );
          case DioErrorType.connectionTimeout:
            return CustomException(
              statusCode: error.response?.statusCode,
            );
          case DioErrorType.sendTimeout:
            return CustomException(
              statusCode: error.response?.statusCode,
            );
          case DioErrorType.receiveTimeout:
            return CustomException(
              statusCode: error.response?.statusCode,
            );
          case DioErrorType.badResponse:
          case DioErrorType.unknown:
            //Logic when error is Socket Exception
            if (error.message?.contains('SocketException') ?? false) {
              return CustomException(
                statusCode: error.response?.statusCode,
                message: networkError,
              );
            }

            //Logic when error contains a status code
            if (error.response?.statusCode != null) {
              final code = error.response?.statusCode;

              final customException = CustomException(
                statusCode: code,
                message:
                    error.response?.data['message'] as String? ?? errorMessage,
              );

              return customException;
            }

            final customException = CustomException(
              message: error.response?.data['message'] as String? ??
                  error.response?.data['error'] as String? ??
                  errorMessage,
              statusCode: error.response?.statusCode,
            );

            return customException;
        }
      } else {
        return CustomException(
          message: errorMessage,
        );
      }
    } on FormatException {
      return CustomException(
        message: errorMessage,
      );
    } on Exception {
      return CustomException(
        message: errorMessage,
      );
    } catch (err) {
      return CustomException(
        message: errorMessage,
      );
    }
  }

  final String? message;
  final String? code;
  final int? statusCode;
}
