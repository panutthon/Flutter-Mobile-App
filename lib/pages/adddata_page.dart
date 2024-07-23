import 'package:flutter/material.dart';

class AdddataPage extends StatelessWidget {
  const AdddataPage({super.key});

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
          'บันทึกค่าความดันโลหิต',
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
      body: const Text(''),
    );
  }
}
