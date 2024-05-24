import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'suksesPembayaran.dart'; // import file suksesPembayaran.dart
import 'package:latihanflutter/screen/paymentScreen.dart';

class PaymentScreen extends StatefulWidget {
  // tambahkan properti yang diperlukan
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/sukses.png',
                height: 200, // Sesuaikan dengan ukuran gambar
              ),
              SizedBox(height: 20),
              Text(
                'Pembayaran Berhasil',
                style: TextStyle(
                  fontSize: 28, // Ukuran teks sedikit besar
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Data pembayaran sudah berhasil diproses',
                style: TextStyle(
                  fontSize: 16, // Ukuran teks kecil
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman sukses pembayaran
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
                child: Text('Lihat Antrian'), // Ubah teks tombol
              ),
            ],
          ),
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
