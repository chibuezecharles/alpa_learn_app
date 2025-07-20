import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/routes.dart';

class AuthController extends GetxController {
  // Form keys
  final signupFormKey = GlobalKey<FormState>();
  final signinFormKey = GlobalKey<FormState>();

  // Controllers for text fields
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive variables
  var passwordVisible = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var userEmail = ''.obs;
  var userName = ''.obs;
  var userUsername = ''.obs;

  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    GetStorage.init();
    checkIfLoggedIn();
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void loadUserProfile() {
    userEmail.value = storage.read('user_email') ?? '';
    userName.value = storage.read('user_name') ?? '';
    userUsername.value = storage.read('user_username') ?? '';
  }

  void checkIfLoggedIn() {
    final savedEmail = storage.read('user_email');
    if (savedEmail != null) {
      loadUserProfile();
      userEmail.value = savedEmail;

      Future.microtask(() {
        Get.offAllNamed(AppRoutes.mainApp);
      });
    }
}



  void signIn() {
    if (signinFormKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';

      Future.delayed(const Duration(seconds: 2), () {
        final savedEmail = storage.read('user_email');
        final savedPassword = storage.read('user_password');

        if (emailController.text == savedEmail &&
          passwordController.text == savedPassword) {
          userEmail.value = savedEmail;
          loadUserProfile();
          clearFormFields();
          Future.microtask(() {
            Get.offAllNamed(AppRoutes.mainApp);
          });
        } else {
          errorMessage.value = 'Invalid email or password';
        }
        isLoading.value = false;
      });
    }
  }

  void signUp() {
  if (signupFormKey.currentState!.validate()) {
    isLoading.value = true;
    errorMessage.value = '';

    Future.delayed(const Duration(seconds: 2), () {
      userEmail.value = emailController.text;
      storage.write('user_email', userEmail.value);
      storage.write('user_name', nameController.text);
      storage.write('user_username', usernameController.text);
      storage.write('user_password', passwordController.text);
      clearFormFields();

      Future.microtask(() {
        Get.offAllNamed(AppRoutes.signin);
        Get.snackbar(
          'Account Created',
          'Please sign in with your credentials',
          snackPosition: SnackPosition.BOTTOM,
        );
      });

      isLoading.value = false;
    });
  }
}


  void logout() {
    storage.remove('user_email');
    emailController.clear();
    clearFormFields();
    passwordController.clear();
    userEmail.value = '';
    Get.offAllNamed(AppRoutes.signin);
  }

  @override
  void onClose() {
    // nameController.dispose();
    // usernameController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }

  void clearFormFields() {
    nameController.clear();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    errorMessage.value = '';
  }

  

}
