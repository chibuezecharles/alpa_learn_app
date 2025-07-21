// lib/views/auth/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(child: Image.asset('assets/images/logo.jpg', height: 60)),
                const SizedBox(height: 20),
                const Text("Welcome Back", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),

                CustomTextField(
                  label: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => !value!.contains('@') ? "Invalid email" : null,
                ),

                const SizedBox(height: 16),

                Obx(() => CustomTextField(
                      label: "Password",
                      controller: passwordController,
                      obscureText: !authController.passwordVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(authController.passwordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: authController.togglePasswordVisibility,
                      ),
                      validator: (value) => value!.isEmpty ? "Enter password" : null,
                    )),

                const SizedBox(height: 30),

                Obx(() => CustomButton(
                      text: "Sign In",
                      isLoading: authController.isLoading.value,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authController.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                    )),

                const SizedBox(height: 10),
                Obx(() => authController.errorMessage.value.isNotEmpty
                    ? Text(authController.errorMessage.value, style: const TextStyle(color: Colors.red))
                    : const SizedBox.shrink()),

                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Get.toNamed('/signup'),
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
