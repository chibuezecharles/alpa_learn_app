import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Text(
        "Welcome, ${authController.userEmail.value}",
        style: const TextStyle(fontSize: 18),
      )),
    );
  }
}
