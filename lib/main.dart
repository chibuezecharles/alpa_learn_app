import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const AlphaLearnApp());
}

class AlphaLearnApp extends StatelessWidget {
  const AlphaLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
