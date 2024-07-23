import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 85.0,
        title: const Text(
          'ประวัติ',
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
      body: HistoryList(),
    );
  }
}

class HistoryList extends StatelessWidget {
  HistoryList({super.key});

  final List<Map<String, dynamic>> historyData = [
    {
      'date': DateTime(2024, 6, 13, 18, 35),
      'sys': 184,
      'dia': 115,
      'pulse': 92,
      'level': 'สูงมาก'
    },
    {
      'date': DateTime(2024, 6, 12, 10, 15),
      'sys': 150,
      'dia': 95,
      'pulse': 80,
      'level': 'สูง'
    },
    {
      'date': DateTime(2024, 6, 11, 14, 30),
      'sys': 130,
      'dia': 85,
      'pulse': 75,
      'level': 'ปกติ'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyData.length,
      itemBuilder: (context, index) {
        final item = historyData[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('dd/MM/yy').format(item['date']),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_alarm,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('HH:mm').format(item['date']),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('ระดับ : ${item['level']}',
                    style: TextStyle(color: _getLevelColor(item['level']))),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildValueBox('SYS', item['sys'].toString(), Colors.red),
                    _buildValueBox(
                        'PULSE', item['pulse'].toString(), Colors.blue),
                    _buildValueBox('DIA', item['dia'].toString(), Colors.green),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildValueBox(String label, String value, Color color) {
    return Column(
      children: [
        Text(label,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        Text(value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'สูงมาก':
        return Colors.red;
      case 'สูง':
        return Colors.orange;
      case 'ปกติ':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
