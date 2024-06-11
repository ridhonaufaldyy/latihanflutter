import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DaftarPoli.dart';
import 'MyBotNavBar.dart';
import 'antrian.dart';
import 'riwayat.dart';
import 'chatAdmin.dart';
import 'obat.dart';

class HomeScreen extends StatefulWidget {
  final int userId;
  final String token;

  HomeScreen({
    required this.userId,
    required this.token,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String fullName = '';
  String nik = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> fetchUserData() async {
    final url = Uri.parse('http://127.0.0.1:8000/get_users/${widget.userId}');
    print('Fetching data from $url');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${widget.token}',
        'Content-Type': 'application/json',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        fullName = responseData['fullname'];
        nik = responseData['nik'];
        isLoading = false;
      });
      print('Full name: $fullName, NIK: $nik');
    } else {
      print('Failed to fetch user data: ${response.body}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
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
                  ],
                ),
              ),
            ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        userId: widget.userId,
        token: widget.token,
      ),
    );
  }

  Widget _buildGreetings(BuildContext context) {
    return Row(
      children: [
        Text(
          fullName.isNotEmpty ? 'Halo $fullName!' : 'Loading...',
          style: TextStyle(fontSize: 24.0),
        ),
        Spacer(),
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
            '$fullName',
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
            '$nik',
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
              fontSize: 22,
              fontFamily: 'Kadwa',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 20),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            buildStack('Daftar', Icons.list, 45.0, context,
                DaftarPoli(
                  userId: widget.userId,
                  token : widget.token,)),
            buildStack('Pesan Obat', Icons.medical_services, 45.0, context,
                MedicineSalesPage(
                  userId: widget.userId,
                  token : widget.token,
                )),
            buildStack('Antrian', Icons.playlist_add_check, 45.0, context,
                QueuePage()),
            buildStack('Riwayat', Icons.history, 45.0, context,
                CheckupHistoryPage()),
            buildStack('Chat Admin', Icons.chat, 45.0, context,
                ChatAdmin(title: 'Chat Admin')),
          ],
        ),
      ],
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
