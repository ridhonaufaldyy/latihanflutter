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
              Tanggal: 'April 20, 2024',
              Diagnosa: 'Flu',
              dokter: 'Dr. Smith',
            ),
            CheckupItem(
              Tanggal: 'April 15, 2024',
              Diagnosa: 'Sore throat',
              dokter: 'Dr. Johnson',
            ),
            CheckupItem(
              Tanggal: 'April 10, 2024',
              Diagnosa: 'Fever',
              dokter: 'Dr. Williams',
            ),
            CheckupItem(
              Tanggal: 'April 5, 2024',
              Diagnosa: 'Headache',
              dokter: 'Dr. Brown',
            ),
          ],
        ),
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}

class CheckupItem extends StatelessWidget {
  final String Tanggal;
  final String Diagnosa;
  final String dokter;

  const CheckupItem({
    Key? key,
    required this.Tanggal,
    required this.Diagnosa,
    required this.dokter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text('Tanggal: $Tanggal'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Diagnosa: $Diagnosa'),
            Text('dokter: $dokter'),
          ],
        ),
      ),
    );
  }
}
