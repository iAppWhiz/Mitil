import 'dart:io';

import 'package:dio/dio.dart';

import 'network_exceptions.dart';

class ServerError {
  String? message;
  ServerError(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              message = "Request Cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              message = "Request Timeout";
              break;
            case DioExceptionType.unknown:
              message = "Please Try Again";
              break;
            case DioExceptionType.receiveTimeout:
              message = "Send Timeout";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  message = error.response!.statusMessage;
                  break;
                case 401:
                  message = getErrorMessage(
                      const NetworkExceptions.unauthorisedRequest());
                  break;
                case 403:
                  message = getErrorMessage(
                      const NetworkExceptions.unauthorisedRequest());
                  break;
                case 404:
                  message = getErrorMessage(
                      const NetworkExceptions.notFound("Not found"));
                  break;
                case 409:
                  message = getErrorMessage(const NetworkExceptions.conflict());
                  break;
                case 408:
                  message =
                      getErrorMessage(const NetworkExceptions.requestTimeout());
                  break;
                case 500:
                  message = getErrorMessage(
                      const NetworkExceptions.internalServerError());
                  break;
                case 503:
                  message = getErrorMessage(
                      const NetworkExceptions.serviceUnavailable());
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  message = getErrorMessage(NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  ));
              }
              break;
            case DioExceptionType.sendTimeout:
              message = getErrorMessage(const NetworkExceptions.sendTimeout());
              break;
            case DioExceptionType.badCertificate:
              message = getErrorMessage(
                  const NetworkExceptions.defaultError("bad certificate"));
              break;

            case DioExceptionType.connectionError:
              message = getErrorMessage(
                  const NetworkExceptions.defaultError("Connection Error"));
              break;
          }
        } else if (error is SocketException) {
          message =
              getErrorMessage(const NetworkExceptions.noInternetConnection());
        } else {
          message = getErrorMessage(const NetworkExceptions.unexpectedError());
        }
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        message = getErrorMessage(const NetworkExceptions.formatException());
      } catch (_) {
        message = getErrorMessage(const NetworkExceptions.unexpectedError());
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        message = getErrorMessage(const NetworkExceptions.unableToProcess());
      } else {
        message = getErrorMessage(const NetworkExceptions.unexpectedError());
      }
    }
  }
}

String getErrorMessage(NetworkExceptions networkExceptions) {
  var errorMessage = "";
  networkExceptions.when(notImplemented: () {
    errorMessage = "Not Implemented";
  }, requestCancelled: () {
    errorMessage = "Request Cancelled";
  }, internalServerError: () {
    errorMessage = "Internal Server Error";
  }, notFound: (String reason) {
    errorMessage = reason;
  }, serviceUnavailable: () {
    errorMessage = "Service unavailable";
  }, methodNotAllowed: () {
    errorMessage = "Method Allowed";
  }, badRequest: () {
    errorMessage = "Bad request";
  }, unauthorisedRequest: () {
    errorMessage = "Unauthorised request";
  }, unexpectedError: () {
    errorMessage = "Unexpected error occurred";
  }, requestTimeout: () {
    errorMessage = "Connection request timeout";
  }, noInternetConnection: () {
    errorMessage = "No internet connection";
  }, conflict: () {
    errorMessage = "Error due to a conflict";
  }, sendTimeout: () {
    errorMessage = "Send timeout in connection with API server";
  }, unableToProcess: () {
    errorMessage = "Unable to process the data";
  }, defaultError: (String error) {
    errorMessage = error;
  }, formatException: () {
    errorMessage = "Unexpected error occurred";
  }, notAcceptable: () {
    errorMessage = "Not acceptable";
  });
  return errorMessage;
}
