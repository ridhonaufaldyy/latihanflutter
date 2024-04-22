import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antrian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QueuePage(),
    );
  }
}

class QueuePage extends StatefulWidget {
  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Antrian'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: [
            QueueItem(status: QueueStatus.missed),
            QueueItem(status: QueueStatus.completed),
            QueueItem(status: QueueStatus.pending),
            QueueItem(status: QueueStatus.processing),
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

enum QueueStatus { missed, completed, pending, processing }

class QueueItem extends StatelessWidget {
  final QueueStatus status;

  const QueueItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    IconData iconData;
    String statusText;

    switch (status) {
      case QueueStatus.missed:
        statusColor = Colors.red;
        iconData = Icons.error;
        statusText = 'Terlewat';
        break;
      case QueueStatus.completed:
        statusColor = Colors.green;
        iconData = Icons.check_circle;
        statusText = 'Selesai';
        break;
      case QueueStatus.pending:
        statusColor = Colors.orange;
        iconData = Icons.watch_later;
        statusText = 'Menunggu';
        break;
      case QueueStatus.processing:
        statusColor = Colors.blue;
        iconData = Icons.access_time;
        statusText = 'Diproses';
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 171, 255, 172), // Warna hijau untuk setiap item antrian
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(
            iconData,
            color: statusColor,
          ),
          title: Text(
            'Antrian 123',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(statusText),
          trailing: status == QueueStatus.pending
              ? ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk memproses antrian di sini
                  },
                  child: Text('Proses'),
                )
              : null,
        ),
      ),
    );
  }
}
