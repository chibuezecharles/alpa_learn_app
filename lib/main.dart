import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/routes.dart';
import 'bindings/auth_binding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); 
  runApp(const AlphaLearnApp());
}

class AlphaLearnApp extends StatelessWidget {
  const AlphaLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alpha Learn',
      initialBinding: AuthBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.green,
      ),
    );
  }
}
