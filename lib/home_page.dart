import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Kadwa'
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(), // Panggil DashboardScreen sebagai home
    );
  }
}
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_selectedIndex) {
      case 0:
        currentPage = HomeScreen();
        break;
      case 1:
        currentPage = SearchScreen();
        break;
      case 2:
        currentPage = ProfileScreen();
        break;
      default:
        currentPage = HomeScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: currentPage,
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ini adalah Halaman Search',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ini adalah Halaman Profile',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Menggunakan Scaffold untuk menampilkan BottomNavigationBar
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      'Haloo Nadia!',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                    Icon(Icons.notifications_rounded),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFD4DCE7),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        'Nadia Aprilianl',
                        style: TextStyle(fontSize: 13.0),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 20,
                              thickness: 2,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        '32710928778299',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 130,
                  height: 23,
                  child: Text(
                    'Pelayanan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Kadwa',
                      fontWeight: FontWeight.w700,
                      height: 0.05,
                      letterSpacing: -0.08,
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildStack('Daftar', Icons.list, 40.0),
                    buildStack('Pesan Obat', Icons.medical_services, 40.0),
                    buildStack('Antrian', Icons.playlist_add_check, 40.0),
                    buildStack('Kamar', Icons.hotel, 40.0),
                    buildStack('Ambulans', Icons.local_hospital, 40.0),
                    buildStack('Riwayat', Icons.history, 40.0),
                    buildStack('Chat Admin', Icons.chat, 40.0),
                    buildStack('Lainnya', Icons.more_horiz, 40.0),
                  ],
                ),

                SizedBox(height: 20),
                Text(
                  'Artikel Kesehatan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Kadwa',
                    fontWeight: FontWeight.w700,
                    height: 0.05,
                    letterSpacing: -0.08,
                  ),
                ),
                //SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/60514791.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Cara Menjaga Kesehatan Kaki',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Kadwa',
                          fontWeight: FontWeight.w700,
                          height: 0.05,
                          letterSpacing: -0.08,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Tips & Tricks Menjaga Kesehatan Kaki',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Kaisei Decol',
                          fontWeight: FontWeight.w700,
                          height: 0.14,
                          letterSpacing: -0.08,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/60514791.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tips Menjaga Kesehatan Mata',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Kadwa',
                          fontWeight: FontWeight.w700,
                          height: 0.05,
                          letterSpacing: -0.08,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Daftar Buah Yang Bagus Untuk Kesehatan Mata',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Kaisei Decol',
                          fontWeight: FontWeight.w700,
                          height: 0.14,
                          letterSpacing: -0.08,
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
    );
  }

  Widget buildStack(String text, IconData iconData, double iconSize) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color(0xFF095259),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              iconData,
              color: Colors.white,
              size: iconSize,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

