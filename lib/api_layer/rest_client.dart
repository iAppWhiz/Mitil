import 'package:dio/dio.dart';
import 'package:mitil/api_layer/api.dart';
import 'package:mitil/models/base_request.dart';
import 'package:mitil/models/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(API.postData)
  Future<BaseResponse> postData(@Body() BaseRequest request);
  @GET(API.getData)
  Future<BaseResponse> getData();
  @GET(API.getProfile)
  Future<BaseResponse> getProfileInfo();
}
