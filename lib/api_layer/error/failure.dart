import 'package:dio/dio.dart';
import 'package:mitil/api_layer/error/server_error.dart';

class Failure {
  String? message;

  Failure({this.message});

  Failure.fromServerError(DioError? error) {
    message = ServerError(error).message;
  }
}
