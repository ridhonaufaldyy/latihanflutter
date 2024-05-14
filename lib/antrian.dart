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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                    child: Text('Antrian Poli Umum'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                    child: Text('Antrian Poli Mata'),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                    child: Text('Antrian Poli Gigi'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                    child: Text('Antrian Poli Kandungan'),
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
