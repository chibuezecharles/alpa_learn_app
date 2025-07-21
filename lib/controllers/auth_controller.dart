// lib/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/routes.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final passwordVisible = false.obs;
  final errorMessage = ''.obs;

  final userEmail = ''.obs;
  final userName = ''.obs;
  final userUsername = ''.obs;

  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
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
      Future.microtask(() {
        Get.offAllNamed(AppRoutes.mainApp);
      });
    }
  }

  void signIn(String email, String password) {
    isLoading.value = true;
    errorMessage.value = '';
    Future.delayed(const Duration(seconds: 2), () {
      final savedEmail = storage.read('user_email');
      final savedPassword = storage.read('user_password');

      if (email == savedEmail && password == savedPassword) {
        loadUserProfile();
        Get.offAllNamed(AppRoutes.mainApp);
      } else {
        errorMessage.value = 'Invalid email or password';
      }
      isLoading.value = false;
    });
  }

  void signUp(String name, String username, String email, String password) {
    isLoading.value = true;
    errorMessage.value = '';

    Future.delayed(const Duration(seconds: 2), () {
      storage.write('user_email', email);
      storage.write('user_password', password);
      storage.write('user_name', name);
      storage.write('user_username', username);

      Get.offAllNamed(AppRoutes.signin);
      Future.delayed(const Duration(milliseconds: 300), () {
        Get.snackbar(
          'Account Created',
          'Please sign in with your credentials',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
      isLoading.value = false;
    });
  }

  void logout() {
    storage.remove('user_email');
    userEmail.value = '';
    userName.value = '';
    userUsername.value = '';
    Get.offAllNamed(AppRoutes.signin);
  }
  
}
