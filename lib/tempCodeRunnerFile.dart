import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';

class antrianUmum extends StatefulWidget {
  const antrianUmum({super.key});

  @override
  State<antrianUmum> createState() => _antrianUmumState();
}

class _antrianUmumState extends State<antrianUmum> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Antrian Poli Umum',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                children: [
                  QueueItem(status: QueueStatus.missed, queueNumber: 1, patientName: 'Budi'),
                  QueueItem(status: QueueStatus.pending, queueNumber: 2, patientName: 'Siti'),
                  QueueItem(status: QueueStatus.processing, queueNumber: 3, patientName: 'Ahmad'),
                ],
              ),
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

enum QueueStatus { missed, completed, pending, processing }

class QueueItem extends StatelessWidget {
  final QueueStatus status;
  final int queueNumber;
  final String patientName;

  const QueueItem({
    Key? key,
    required this.status,
    required this.queueNumber,
    required this.patientName,
  }) : super(key: key);

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
            color: Color.fromRGBO(9, 82, 89, 1), // Warna hijau untuk setiap item antrian
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Kolom kiri untuk nomor antrian yang diperbesar
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$queueNumber',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Kolom kanan untuk status dan nama pasien
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status: $statusText',
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Nama: $patientName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (status == QueueStatus.pending)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk memproses antrian di sini
                    },
                    child: Text('Proses'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
