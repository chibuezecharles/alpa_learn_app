import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Form(
            key: authController.signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.jpg', height: 60),
                const SizedBox(height: 20),
                const Text(
                  "Create your account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                CustomTextField(
                  label: "Full Name",
                  controller: authController.nameController,
                  validator: (value) => value!.isEmpty ? "Enter name" : null,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Username",
                  controller: authController.usernameController,
                  validator: (value) => value!.isEmpty ? "Enter username" : null,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Email",
                  controller: authController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => !value!.contains('@') ? "Invalid email" : null,
                ),
                const SizedBox(height: 16),

                Obx(() => CustomTextField(
                      label: "Password",
                      controller: authController.passwordController,
                      obscureText: !authController.passwordVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(authController.passwordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => authController.togglePasswordVisibility(),
                      ),
                      validator: (value) =>
                          value!.length < 8 ? "Min. 8 characters" : null,
                    )),
                const SizedBox(height: 30),

                Obx(() => CustomButton(
                      text: "Create Account",
                      isLoading: authController.isLoading.value,
                      onPressed: () => authController.signUp(),
                    )),

                const SizedBox(height: 20),
                const Text("or sign up with"),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.apple, size: 32),
                    SizedBox(width: 20),
                    Icon(Icons.g_mobiledata, size: 32),
                  ],
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () => Get.toNamed('/signin'),
                  child: const Text("Already have an account? Sign in"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
