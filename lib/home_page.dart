import 'package:flutter/material.dart';
import 'package:latihanflutter/chatAdmin.dart';
import 'DaftarPoli.dart';
import 'MyBotNavBar.dart'; // Import file untuk MyBottomNavigationBar
import 'ambulans.dart';
import 'mataArticle.dart';
import 'kakiArticle.dart';
import 'kamar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetings(context),
              SizedBox(height: 20),
              _buildProfileInfo(),
              SizedBox(height: 30),
              _buildServiceSection(context),
              SizedBox(height: 20),
              _buildHealthArticlesSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildGreetings(BuildContext context) {
    return Row(
      children: [
        Text(
          'Haloo Nadia!',
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.3),
        Icon(Icons.notifications_rounded),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFFD4DCE7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nadia Aprilianl',
            style: TextStyle(fontSize: 13.0),
          ),
          SizedBox(height: 2),
          Divider(
            height: 20,
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(height: 2),
          Text(
            '32710928778299',
            style: TextStyle(fontSize: 13.0),
          ),
        ],
      ),
    );
  }

Widget _buildServiceSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
          ),
        ),
      ),
      GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          buildStack('Daftar', Icons.list, 40.0, context,
              DaftarPoli(title: 'Daftar')),
          buildStack('Pesan Obat', Icons.medical_services, 40.0, context,
              DaftarPoli(title: 'Pesan Obat')),
          buildStack('Antrian', Icons.playlist_add_check, 40.0, context,
              DaftarPoli(title: 'Antrian')),
          buildStack('Kamar', Icons.hotel, 40.0, context,
              DashBoardScreenKamar()),
          buildStack('Ambulans', Icons.local_hospital, 40.0, context,
              PhoneCallScreen()),
          buildStack('Riwayat', Icons.history, 40.0, context,
              DaftarPoli(title: 'Riwayat')),
          buildStack('Chat Admin', Icons.chat, 40.0, context,
              ChatAdmin(title: 'Chat Admin')),
        ],
      ),
    ],
  );
}

  Widget _buildHealthArticlesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Artikel Kesehatan',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Kadwa',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 20),
        _buildKakiHealthArticle(context),
        SizedBox(height: 10),
        _buildMataHealthArticle(context),
      ],
    );
  }

  Widget _buildKakiHealthArticle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman artikel kaki
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleKakiScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/60514791.png'),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMataHealthArticle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman artikel mata
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleMataScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/60514791.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tips Menjaga Kesehatan Mata',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Kadwa',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Daftar Buah Yang Bagus Untuk Kesehatan Mata',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Kaisei Decol',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStack(String text, IconData iconData, double size,
      BuildContext context, Widget route) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
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
                size: size,
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
      ),
    );
  }
}
