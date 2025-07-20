import 'package:alpha_learn_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/welcome.jpg', height: 300),
                const SizedBox(height: 30),
                const Text(
                  "Welcome to Alpha Learn",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text("Your campus, anywhere.", textAlign: TextAlign.center),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => {Get.toNamed(AppRoutes.signup), authController.clearFormFields()},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
                    child: Text("Get Started", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
