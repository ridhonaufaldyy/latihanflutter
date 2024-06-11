import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';

class AntrianKandungan extends StatefulWidget {
  const AntrianKandungan({super.key});

  @override
  State<AntrianKandungan> createState() => _AntrianKandunganState();
}

class _AntrianKandunganState extends State<AntrianKandungan> {
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
                        'Antrian Poli Kandungan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 48), // Menambahkan lebar untuk menjaga jarak
                ],
              ),
            ),
            // Teks "Antrian Sekarang" di luar kotak
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Antrian Sekarang',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Kotak tambahan di bawah teks "Antrian Sekarang"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                width: double.infinity, // Perbesar lebar kotak
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(8, 82, 89, 1).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan konten dalam kolom
                  children: [
                    Center( // Pusatkan nomor antrian
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 48, // Perbesar ukuran nomor antrian
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0), // Jarak antara nomor antrian dan nama
                    Center(
                      child: Text(
                        'Nama: Dian',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0), // Jarak antara kotak dan teks "Status Antrian"
            Text(
              'Status Antrian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                children: [
                  QueueItem(
                    status: QueueStatus.pending,
                    queueNumber: 1,
                    patientName: 'Dian',
                    compact: true,
                  ),
                  QueueItem(
                    status: QueueStatus.missed,
                    queueNumber: 2,
                    patientName: 'Eka',
                    compact: true,
                  ),
                  QueueItem(
                    status: QueueStatus.processing,
                    queueNumber: 3,
                    patientName: 'Feri',
                    compact: true,
                  ),
                ],
              ),
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

enum QueueStatus { missed, completed, pending, processing }

class QueueItem extends StatelessWidget {
  final QueueStatus status;
  final int queueNumber;
  final String patientName;
  final bool compact;

  const QueueItem({
    Key? key,
    required this.status,
    required this.queueNumber,
    required this.patientName,
    this.compact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    String statusText;

    switch (status) {
      case QueueStatus.missed:
        statusColor = Colors.red;
        statusText = 'Terlewat';
        break;
      case QueueStatus.completed:
        statusColor = Colors.green;
        statusText = 'Selesai';
        break;
      case QueueStatus.pending:
        statusColor = Colors.orange;
        statusText = 'Menunggu';
        break;
      case QueueStatus.processing:
        statusColor = Colors.blue;
        statusText = 'Diproses';
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: compact ? 80 : 100, // Perkecil ukuran status antrian
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(9, 82, 89, 1), // Warna hijau untuk setiap item antrian
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Kolom kiri untuk nomor antrian yang diperbesar
              Container(
                height: compact ? 80 : 100,
                width: compact ? 80 : 100,
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
                      fontSize: compact ? 24 : 32,
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
                          fontSize: compact ? 16 : 18,
                        ),
                      ),
                      Text(
                        'Nama: $patientName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: compact ? 16 : 18,
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
