import 'package:car_auction_new/data/model/response/base/error_response.dart';
import 'package:car_auction_new/view/base/show_custom_snakbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiErrorHandler {
  static dynamic getMessage(dynamic error) {
    dynamic errorDescription = "";
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout with server";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Caused by an incorrect certificate";
          break;
        case DioExceptionType.badResponse:
          if (error.response != null) {
            switch (error.response!.statusCode) {
              case 403:
                if (kDebugMode) {
                  print('<==Here is error body==${error.response!.data.toString()}===>');
                }
                errorDescription = error.response!.data['message'];
                errorDescription = error.response!.data['errors'][0]['message'];
                ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                errorDescription = errorResponse.errors![0].message;
                showCustomSnackBar(errorDescription);
                break;
              case 404:
              case 500:
              case 503:
                errorDescription = error.response!.statusMessage;
                break;
              default:
                ErrorResponse? errorResponse;
                try {
                  errorResponse = ErrorResponse.fromJson(error.response!.data);
                } catch (e) {
                  errorDescription =
                  "Failed to load data - status code: ${error.response!.statusCode}";
                }
                if (errorResponse != null &&
                    errorResponse.errors != null &&
                    errorResponse.errors!.isNotEmpty) {
                  errorDescription = errorResponse.errors![0].message;
                } else {
                  errorDescription =
                  "Failed to load data - status code: ${error.response!.statusCode}";
                }
            }
          }
          break;
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection error";
          break;
        case DioExceptionType.unknown:
          errorDescription = "Unknown error occurred";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }
}
