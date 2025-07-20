import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.welcome);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.jpg', height: 120),
            const SizedBox(height: 20),
            const Text("Alpha Learn", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
