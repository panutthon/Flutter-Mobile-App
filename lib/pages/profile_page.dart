import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          toolbarHeight: 85.0,
          title: const Text(
            'โปรไฟล์',
            style: TextStyle(
              fontSize: 28,
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: const ProfilePicture(
                      name: 'ปณัฐฑรณ์ ชนาชน',
                      radius: 64,
                      fontsize: 21,
                    ),
                  ),
                  const Text(
                    'ปณัฐฑรณ์ ชนาชน',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 230,
                    width: 350,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(200, 200, 200, 0.5),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'แก้ไขโปรไฟล์',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications_outlined,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'แจ้งเตือน',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'ตั้งค่า',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 75,
                    width: 350,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(200, 200, 200, 0.5),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                size: 40,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'ออกจากระบบ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // เพิ่มระยะห่างด้านล่าง
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            BottomNavigationBar(
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
                  label: 'หน้าหลัก',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(height: 40.0, width: 40.0),
                  label: '',
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
            Positioned(
              top: -40, // ปรับตำแหน่งให้ยื่นขึ้นมาจาก BottomNavigationBar
              child: GestureDetector(
                onTap: () => Get.toNamed('/about'),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Color(0xFF3294FF),
                        size: 40.0,
                      ),
                      SizedBox(
                          height: 2), // เพิ่มระยะห่างระหว่างไอคอนกับข้อความ
                      Text(
                        'สแกน',
                        style: TextStyle(
                          color: Color(0xFF3294FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 20, // ปรับขนาดตัวอักษรตามความเหมาะสม
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
