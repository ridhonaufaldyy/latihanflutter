import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'screen/suksesPembayaran.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metode Pembayaran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentMethodPage(),
    );
  }
}

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _selectedIndex = 0;
  String? _selectedPaymentMethod;
  String? _selectedBank;
  String? _selectedOneKlikBank;

  final List<String> _paymentMethods = [
    'Transfer Bank',
    'Dompetku',
    'Kartu Kredit / Debit Online',
    'Bayar di Rumah Sakit'
  ];

  final List<String> _banks = [
    'Bank BCA',
    'Bank Mandiri',
    'Bank BNI',
    'Bank BRI',
    'Bank CIMB Niaga',
  ];

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
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Pilih Metode Pembayaran'),
              value: _selectedPaymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                  _selectedBank = null; // Reset bank selection when payment method changes
                  _selectedOneKlikBank = null; // Reset OneKlik bank selection
                });
              },
              items: _paymentMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (_selectedPaymentMethod == 'Transfer Bank' || _selectedPaymentMethod == 'OneKlik') ...[
              SizedBox(height: 20),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text('Pilih Bank'),
                value: _selectedPaymentMethod == 'Transfer Bank' ? _selectedBank : _selectedOneKlikBank,
                onChanged: (String? newValue) {
                  setState(() {
                    if (_selectedPaymentMethod == 'Transfer Bank') {
                      _selectedBank = newValue;
                    } else if (_selectedPaymentMethod == 'OneKlik') {
                      _selectedOneKlikBank = newValue;
                    }
                  });
                },
                items: _banks.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedPaymentMethod != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessPage()),
                      );
                    }
                  : null,
              child: Text('Konfirmasi'),
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

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran Sukses'),
      ),
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
                  // Ganti dengan navigasi ke halaman yang sesuai
                },
                child: Text('Lihat Antrian'), // Ubah teks tombol
              ),
            ],
          ),
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
