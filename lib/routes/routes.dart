import 'package:get/get.dart';
import '../views/auth/sign_in_screen.dart';
import '../views/auth/sign_up_screen.dart';
import '../views/splash_screen.dart';
import '../views/welcome_screen.dart';
import '../views/main/bottom_nav.dart';
import '../bindings/bottom_nav_binding.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const signin = '/signin';
  static const signup = '/signup';
  static const home = '/home';
  static const mainApp = '/main-app'; 


  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: signin, page: () => SignInScreen()),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: home, page: () => BottomNav(), binding: BottomNavBinding(),),
    GetPage(name: mainApp, page: () => BottomNav(), binding: BottomNavBinding(),),
  ];
}
