import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'bottom_nav.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => SplashScreen(),
  '/welcome': (context) => WelcomeScreen(),
  '/signin': (context) => SignInScreen(),
  '/signup': (context) => SignUpScreen(),
  '/home': (context) => BottomNav(),
};
