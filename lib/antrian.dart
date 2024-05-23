import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'antrianUmum.dart';
import 'antrianMata.dart';
import 'antrianGigi.dart';
import 'antrianKandungan.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Daftar Antrian',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        width: 250,
                        height: 100, // Perbesar tinggi tombol
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16), // Perbesar padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Ini membuat bentuk bulat
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => antrianUmum()),
                            );
                          },
                          child: Text(
                            'Antrian Poli Umum',
                            style: TextStyle(fontSize: 24), // Perbesar ukuran teks
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 250,
                        height: 100, // Perbesar tinggi tombol
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16), // Perbesar padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Ini membuat bentuk bulat
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => antrianMata()),
                            );
                          },
                          child: Text(
                            'Antrian Poli Mata',
                            style: TextStyle(fontSize: 24), // Perbesar ukuran teks
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 250,
                        height: 100, // Perbesar tinggi tombol
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16), // Perbesar padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Ini membuat bentuk bulat
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => antrianGigi()),
                            );
                          },
                          child: Text(
                            'Antrian Poli Gigi',
                            style: TextStyle(fontSize: 24), // Perbesar ukuran teks
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 250,
                        height: 100, // Perbesar tinggi tombol
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16), // Perbesar padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Ini membuat bentuk bulat
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => antrianKandungan()),
                            );
                          },
                          child: Text(
                            'Antrian Poli Kandungan',
                            style: TextStyle(fontSize: 24), // Perbesar ukuran teks
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
