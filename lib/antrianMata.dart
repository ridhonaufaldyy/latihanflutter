import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';

class antrianMata extends StatefulWidget {
  const antrianMata({super.key});

  @override
  State<antrianMata> createState() => antrianMataState();
}

class antrianMataState extends State<antrianMata> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Antrian Poli Mata'),
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
            QueueItem(status: QueueStatus.missed,queueNumber: 2),
            QueueItem(status: QueueStatus.pending,queueNumber: 1),
            QueueItem(status: QueueStatus.processing,queueNumber: 3),
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
  final int queueNumber;

  const QueueItem({Key? key,required this.status, required this.queueNumber}) : super(key: key);

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
      child: Center(
        child: Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 171, 255, 172), // Warna hijau untuk setiap item antrian
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nomor Antrian: $queueNumber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Status: $statusText',
                      style: TextStyle(
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (status == QueueStatus.pending)
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk memproses antrian di sini
                  },
                  child: Text('Proses'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
