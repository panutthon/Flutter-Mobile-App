import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/about_page.dart';
import 'pages/adddata_page.dart';
import 'pages/analyzedata_page.dart';
import 'pages/calendar_page.dart';
import 'pages/edit_page.dart';
import 'pages/history_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/setting_page.dart';

import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansThaiTextTheme(),
      ),
      //home: const MyHomePage()
      //home: const AboutPage()
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/about', page: () => const AboutPage()),
        GetPage(name: '/profile', page: () => const MyProfilePage()),
        GetPage(name: '/setting', page: () => const SettingPage()),
        GetPage(name: '/adddata', page: () => const AdddataPage()),
        GetPage(name: '/history', page: () => const HistoryPage()),
        GetPage(name: '/analyzedata', page: () => const AnalyzedataPage()),
        GetPage(name: '/editprofile', page: () => const EditPage()),
        GetPage(name: '/calendar', page: () => const CalendarPage()),
      ],
    );
  }
}
