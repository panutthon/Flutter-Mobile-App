import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  void initState() {
    super.initState();

    ///print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        toolbarHeight: 85.0,
        // backgroundColor: const Color(0xFF3294FF),
        // title: Image.asset('assets/images/logo.png', width: 50, height: 50),
        // centerTitle: true,
        title: const Text(
          'WhatAiDan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined,
                color: Colors.white, size: 30.0),
            onPressed: () {
              Get.toNamed('/about');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Colors.white, size: 30.0),
            onPressed: () {
              Get.toNamed('/about');
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3294FF), Color(0xFF4EC9FF)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(200, 200, 200, 0.5),
                    blurRadius: 8,
                    // spreadRadius: 0,
                    // offset: Offset(0, 4),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space between the containers
            Container(
              height: 100,
              width: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(200, 200, 200, 0.5),
                    blurRadius: 8,
                    // spreadRadius: 1,
                    // offset: Offset(0, 4),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF3294FF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 40.0),
            label: ' หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: Colors.white, size: 40.0),
            label: 'สแกน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white, size: 40.0),
            label: 'โปรไฟล์',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/');
          } else if (index == 1) {
            Get.toNamed('/about');
          } else if (index == 2) {
            Get.toNamed('/profile');
          }
        },
      ),
    );
  }
}
