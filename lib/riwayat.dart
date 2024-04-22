import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riwayat Checkup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckupHistoryPage(),
    );
  }
}

class CheckupHistoryPage extends StatefulWidget {
  @override
  _CheckupHistoryPageState createState() => _CheckupHistoryPageState();
}

class _CheckupHistoryPageState extends State<CheckupHistoryPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Checkup'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Sesuaikan dengan gambar latar belakang yang Anda inginkan
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            CheckupItem(
              date: 'April 20, 2024',
              diagnosis: 'Flu',
              doctor: 'Dr. Smith',
            ),
            CheckupItem(
              date: 'April 15, 2024',
              diagnosis: 'Sore throat',
              doctor: 'Dr. Johnson',
            ),
            CheckupItem(
              date: 'April 10, 2024',
              diagnosis: 'Fever',
              doctor: 'Dr. Williams',
            ),
            CheckupItem(
              date: 'April 5, 2024',
              diagnosis: 'Headache',
              doctor: 'Dr. Brown',
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CheckupItem extends StatelessWidget {
  final String date;
  final String diagnosis;
  final String doctor;

  const CheckupItem({
    Key? key,
    required this.date,
    required this.diagnosis,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text('Date: $date'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Diagnosis: $diagnosis'),
            Text('Doctor: $doctor'),
          ],
        ),
      ),
    );
  }
}
