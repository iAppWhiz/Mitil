import 'package:dartz/dartz.dart';
import 'package:mitil/api_layer/api_helper.dart';
import 'package:mitil/api_layer/error/failure.dart';
import 'package:mitil/models/base_request.dart';
import 'package:mitil/models/base_response.dart';

class APIRepository {
  APIHelper apiHelper = APIHelper();
  Future<Either<Failure, BaseResponse>> getData(BaseRequest req) async {
    try {

      var response = await apiHelper.getRestClient().getData();
      return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, BaseResponse>> postData(BaseRequest req) async {
    try {

      var response = await apiHelper.getRestClient().postData(req);
      return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
