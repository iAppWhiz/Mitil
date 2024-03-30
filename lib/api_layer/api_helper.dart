import 'package:dio/dio.dart';
import 'package:mitil/api_layer/rest_client.dart';

import 'api.dart';

class APIHelper {
  late Dio dio;
  APIHelper() {
    dio = Dio();
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: false,
        requestHeader: true,
        request: true));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers = await headers();
      return handler.next(options);
    }));
    // dio.lock();
  }

  RestClient getRestClient() {
    return RestClient(dio, baseUrl: API.BASE_URL);
  }

  Future<Map<String, dynamic>> headers() async {
    return {"Content-Type": "application/json", 'AUTH': 'your api key'};
  }
}
