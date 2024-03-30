
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mitil/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ctrlHome = HomeScreenController();
  @override
  void initState() {
    Get.put(ctrlHome);
    super.initState();
    ctrlHome.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: ctrlHome.isLoading.value ? CircularProgressIndicator() : Container(
        width: Get.width,
        child: Text("Data Received SuSuccesscesssS").paddingAll(50),
      ).paddingAll(0),
    ));
  }
}
