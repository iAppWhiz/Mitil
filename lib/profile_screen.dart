

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.back();
    Get.back(result: "thusjshssh");
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.red,
    );
  }
}
