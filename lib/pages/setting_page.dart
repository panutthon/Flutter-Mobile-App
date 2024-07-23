import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 85.0,
        title: const Text(
          'ตั้งค่า',
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
      body: ListView(
        children: [
          _buildSettingItem('เปลี่ยนภาษา', Icons.language, onTap: () {}),
          _buildSettingItem('เปลี่ยนรหัสผ่าน', Icons.key, onTap: () {}),
          _buildSettingItem('เปลี่ยน PIN', Icons.lock, onTap: () {}),
          _buildSettingItem('เกี่ยวกับแอป', Icons.info, onTap: () {}),
          _buildSettingItem('ติดต่อเรา', Icons.mail, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, {VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
