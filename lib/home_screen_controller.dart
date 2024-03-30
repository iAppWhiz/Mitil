
import 'package:get/get.dart';
import 'package:mitil/models/base_request.dart';
import 'package:mitil/profile_screen.dart';
import 'package:mitil/repository/api_repository.dart';

class HomeScreenController extends GetxController{

  var isLoading = false.obs;
  var responseStr = "".obs;
  final apiRepo = APIRepository();
  void getData()async{

    isLoading.value = true;
    final response = await apiRepo.getData(BaseRequest());
    response.fold((l)
        {
          responseStr.value = l.message.toString();
        },
            (r)
      async {
        responseStr.value = "Response success";
      var fes = await Get.to(ProfileScreen());
      });
    isLoading.value = false;



}
}