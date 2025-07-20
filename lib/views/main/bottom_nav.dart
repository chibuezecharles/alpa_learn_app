import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_nav_controller.dart';
import 'home_screen.dart';
import 'movies_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final screens = [
    HomeScreen(),
    MoviesScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<BottomNavController>(); 

    return Obx(() => Scaffold(
      body: screens[navController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changeTab,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    ));
  }
}


