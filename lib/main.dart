import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_2/bindings/home_bindings.dart';
import 'package:weather_app_2/src/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'flutterfonts'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
