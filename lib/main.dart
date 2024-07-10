import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      //home: const MyHomePage()
      //home: const AboutPage()
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/about', page: () => const AboutPage()),
      ],
    );
  }
}
