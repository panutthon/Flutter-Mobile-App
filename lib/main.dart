import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false, // ซ่อน Debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue, // สีหลักของแอพ
        canvasColor: Colors.yellow.shade100, // สีพื้นหลังของแอพ
      ),
      home: const MyHomePage(), // HomePage หรือหน้าแรกของแอพ
    );
  }
}
