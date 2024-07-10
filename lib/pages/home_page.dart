import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    ///print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png', width: 50, height: 50),
          centerTitle: true,
        ),
        body: OutlinedButton(
          onPressed: () {
            Get.toNamed('/about');
          },
          child: const Text('About Page'),
        ));
  }
}
