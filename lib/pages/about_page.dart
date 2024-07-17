import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        toolbarHeight: 85.0,
        title: const Text(
          'ระดับความดันอ้างอิง',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: 350,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFD31F28),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(200, 200, 200, 0.5),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: const Text(
                  'ระดับ 3 สูงมาก',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ควรพบแพทย์ด่วน',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ความดันขณะหัวใจบีบตัว (systole)\n>= 180 mmHg\nความดันขณะหัวใจคลายตัว (Diastole)\n>= 110 mmHg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: 350,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFFF904E),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(200, 200, 200, 0.5),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: const Text(
                  'ระดับ 2 สูง',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ควรพบแพทย์',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ความดันขณะหัวใจบีบตัว (systole)\n160 -179 mmHg\nความดันขณะหัวใจคลายตัว (Diastole)\n100 -109 mmHg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: 350,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFFFD517),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(200, 200, 200, 0.5),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: const Text(
                  'ระดับ 1 เริ่มสูง',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ควบคุมการออกกำลังกาย หมั่นเช็คความดัน',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ความดันขณะหัวใจบีบตัว (systole)\n140 - 159 mmHg\nความดันขณะหัวใจคลายตัว (Diastole)\n90-99 mmHg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: 350,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFF1EAA79),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(200, 200, 200, 0.5),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: const Text(
                  'ระดับ 0 ปกติ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ควบคุมการออกกำลังกาย หมั่นเช็คความดัน',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ความดันขณะหัวใจบีบตัว (systole)\nไม่เกิน 140 mmHg\nความดันขณะหัวใจคลายตัว (Diastole)\nไม่เกิน 90 mmHg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
