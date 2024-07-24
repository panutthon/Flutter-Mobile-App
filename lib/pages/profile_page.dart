import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
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

class _MyProfilePageState extends State<MyProfilePage> {
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
              Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'แจ้งเตือน',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.access_alarm, color: Colors.blue),
                title: Text(
                  'วันนี้อย่าลืมวัดความดันนะครับ',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 25/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const ListTile(
                leading: Icon(Icons.system_update, color: Colors.green),
                title: Text(
                  'แอพพลิเคชั่นเวอร์ชั่นใหม่ 1.0.1 พร้อมใช้งานแล้ว',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 24/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'ความดันของคุณ ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'สูงเกินไป',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      TextSpan(
                        text: ' กรุณาปรึกษาหมอ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text(
                  'วันที่ 23/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const ListTile(
                leading: Icon(Icons.notifications, color: Colors.orange),
                title: Text(
                  'ถึงเวลาวัดความดันประจำวันแล้วนะครับ',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 22/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const ListTile(
                leading: Icon(Icons.update, color: Colors.blue),
                title: Text(
                  'มีการอัพเดทข้อมูลใหม่ กรุณาตรวจสอบ',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 21/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                leading: const Icon(Icons.error, color: Colors.red),
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'ข้อมูลการวัดพบว่า ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'ความดันของคุณสูงเกินไป',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      TextSpan(
                        text: ' ติดต่อแพทย์ทันที',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text(
                  'วันที่ 20/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                leading: const Icon(Icons.warning_amber_rounded,
                    color: Colors.yellow),
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'ความดันต่ำกว่าปกติ ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'กรุณาตรวจสอบอีกครั้ง',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text(
                  'วันที่ 19/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text(
                  'ข้อมูลการวัดบันทึกเรียบร้อยแล้ว',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 18/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const ListTile(
                leading: Icon(Icons.access_alarm, color: Colors.blue),
                title: Text(
                  'วันนี้อย่าลืมวัดความดันนะครับ',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 17/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const ListTile(
                leading: Icon(Icons.system_update, color: Colors.green),
                title: Text(
                  'แอพพลิเคชั่นเวอร์ชั่นใหม่ 1.0.0 พร้อมใช้งานแล้ว',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'วันที่ 16/07/2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
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
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: const ProfilePicture(
                      name: 'ปณัฐฑรณ์ ชนาชน',
                      radius: 64,
                      fontsize: 24,
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
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.blue,
                          ),
                          title: const Text(
                            'แก้ไขโปรไฟล์',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          onTap: () {
                            Get.toNamed('/editprofile');
                          },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(
                            Icons.notifications_outlined,
                            size: 40,
                            color: Colors.blue,
                          ),
                          title: const Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          trailing: Switch(
                            value: true, // ควรใช้ตัวแปร state จริงๆ ที่นี่
                            onChanged: (bool value) {
                              // ควรอัปเดต state ที่นี่
                            },
                            activeColor: Colors.white, // เพิ่มสีไอคอนเป็นสีฟ้า
                            activeTrackColor: const Color(
                                0xFF3294FF), // เพิ่มสีพื้นหลังเป็นสีฟ้า
                          ),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(
                            Icons.settings,
                            size: 40,
                            color: Colors.blue,
                          ),
                          title: const Text(
                            'ตั้งค่า',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          onTap: () {
                            Get.toNamed('/setting');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
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
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout_outlined,
                        size: 40,
                        color: Colors.red,
                      ),
                      title: const Text(
                        'ออกจากระบบ',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                      onTap: () {
                        // ใส่โค้ดสำหรับการออกจากระบบที่นี่
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  Get.toNamed('');
                } else if (index == 2) {
                  Get.toNamed('/profile');
                }
              },
            ),
            Positioned(
              top: -40, // ปรับตำแหน่งให้ยื่นขึ้นมาจาก BottomNavigationBar
              child: GestureDetector(
                // onTap: () => Get.toNamed(''),
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
