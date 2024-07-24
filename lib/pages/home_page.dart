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
      ..lineTo(0, size.height * 0.80)
      ..quadraticBezierTo(
        size.width * 0.1,
        size.height * 1.10,
        size.width * 0.44,
        size.height * 0.75,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.45,
        size.width,
        size.height * 1.0,
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

Widget _buildCircle(String value, String label, Color color) {
  return Container(
    width: 95,
    height: 95,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: color, width: 2.5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ข้อมูล mock
  final List<Map<String, dynamic>> mockData = [
    {
      "date": "13/06/67",
      "time": "18.35",
      "sys": 184,
      "dia": 115,
      "pulse": 92,
      "level": "สูงมาก",
      "count": 4,
      "max": 184,
      "min": 133,
    },
    {
      "date": "12/06/67",
      "time": "16.15",
      "sys": 170,
      "dia": 102,
      "pulse": 87,
      "level": "สูง",
      "count": 3,
      "max": 170,
      "min": 133,
    },
    {
      "date": "11/06/67",
      "time": "14.35",
      "sys": 145,
      "dia": 95,
      "pulse": 84,
      "level": "เริ่มสูง",
      "count": 2,
      "max": 145,
      "min": 133,
    },
    {
      "date": "10/06/67",
      "time": "17.30",
      "sys": 133,
      "dia": 72,
      "pulse": 83,
      "level": "ปกติ",
      "count": 1,
      "max": 133,
      "min": 133,
    },

    // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
  ];

  // เพิ่มตัวแปรสำหรับเก็บ index ของข้อมูล
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    //print('initState');
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
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            // ทำอะไรกับวันที่ที่เลือก เช่น อัพเดทสถานะหรือนำทางไปยังหน้าอื่น
                            print("Selected date: $selectedDate");
                          }
                        });
                      },
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
                  const SizedBox(height: 8),
                  Container(
                    height: 390,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 80,
                          width: 320,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xff73B5FF),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(200, 200, 200, 0.5),
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: Center(
                            child: Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth(),
                              },
                              children: <TableRow>[
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'จำนวนที่วัด',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${mockData[_currentIndex]['count']}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'สูงสุด',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${mockData[_currentIndex]['max']}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'ต่ำสุด',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${mockData[_currentIndex]['min']}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
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
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.calendar_today_outlined,
                                      color: Colors.blue),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${mockData[_currentIndex]['date']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.access_alarm,
                                      color: Colors.blue),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${mockData[_currentIndex]['time']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 1),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  'ระดับ : ${mockData[_currentIndex]['level']}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          // เพิ่มความสูงของ Stack ตรงนี้
                          width: context.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = (_currentIndex - 1)
                                            .clamp(0, mockData.length - 1);
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            top:
                                                0, // Adjust the position as needed
                                            child: _buildCircle(
                                                '${mockData[_currentIndex]['sys']}',
                                                'SYS',
                                                Colors.red),
                                          ),
                                          Positioned(
                                            left: 15,
                                            top: 90, // ปรับตำแหน่งให้ลดลงมา
                                            child: _buildCircle(
                                                '${mockData[_currentIndex]['dia']}',
                                                'DIA',
                                                Colors.green),
                                          ),
                                          Positioned(
                                            right: 15,
                                            top: 90, // ปรับตำแหน่งให้ลดลงมา
                                            child: _buildCircle(
                                                '${mockData[_currentIndex]['pulse']}',
                                                'PULSE',
                                                Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = (_currentIndex + 1)
                                            .clamp(0, mockData.length - 1);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                      height: 20), // Add some space between the containers
                  Container(
                    height: 90,
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
                                      size: 35,
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
                                      size: 35,
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
                                      size: 35,
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
                                      size: 35,
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
                      SizedBox(height: 2),
                      Text(
                        'สแกน',
                        style: TextStyle(
                          color: Color(0xFF3294FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
