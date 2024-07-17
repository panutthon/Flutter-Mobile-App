import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      colors: [Color(0xFF4EC9FF), Color(0xFF3294FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    var paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    var shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.0);

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 1.00)
      ..quadraticBezierTo(
        size.width * 0.1,
        size.height * 1.25,
        size.width * 0.50,
        size.height * 0.75,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.45,
        size.width,
        size.height * 1.2,
      )
      ..lineTo(size.width, 0)
      ..close();

    // วาดเงา
    canvas.drawPath(path.shift(const Offset(0, 2)), shadowPaint);

    // วาดเส้นโค้ง
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    ///print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Stack(
            children: [
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 120.0),
                painter: CurvedPainter(),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 85.0,
                title: const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'WhatAiDan',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined,
                          color: Colors.white, size: 30.0),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: IconButton(
                      icon: const Icon(Icons.notifications,
                          color: Colors.white, size: 30.0),
                      onPressed: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF3294FF),
                ),
                child: Text(
                  'แจ้งเตือน',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Get.toNamed('/');
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Scan'),
                onTap: () {
                  Get.toNamed('/about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Get.toNamed('/profile');
                },
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    height: 350,
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
                  ),
                  const SizedBox(
                      height: 20), // Add some space between the containers
                  Container(
                    height: 110,
                    width: 350,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xFF73B5FF),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(200, 200, 200, 0.5),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/analyzedata');
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.assessment_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'วิเคราะห์',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/history');
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'ประวัติ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/adddata');
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.assignment,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'บันทึก',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/about');
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'ข้อมูล',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
