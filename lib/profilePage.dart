import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'MyBotNavBar.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  final int userId;
  final String token;

  ProfilePage({
    required this.userId,
    required this.token,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Indeks halaman profil
  String fullName = '';
  String nik = '';
  String telphone = '';
  String email = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
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
        telphone = responseData['telphone'];
        email = responseData['email'];
        isLoading = false;
      });
      print('Full name: $fullName, NIK: $nik, Telphone: $telphone, Email: $email');
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
        title: Text('Profile'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      fullName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'NIK: $nik',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 10),
                    _buildProfileInfo('Telphone', telphone),
                    SizedBox(height: 10),
                    _buildProfileInfo('Email', email),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan fungsi untuk mengubah profil
                      },
                      child: Text('Ubah Profil'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan fungsi untuk keluar
                      },
                      child: Text('Keluar'),
                    ),
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

  Widget _buildProfileInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Navigasi ke halaman Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userId: widget.userId,
              token: widget.token,
            ),
          ),
        );
        break;
      case 1:
        // Navigasi ke halaman Medical Services
        Navigator.pushNamed(context, '/medical_services');
        break;
      case 2:
        // Navigasi ke halaman Janji Temu
        Navigator.pushNamed(context, '/janji_temu');
        break;
      case 3:
        // Tidak perlu melakukan navigasi karena sudah berada di halaman Profile
        break;
      default:
        break;
    }
  }
}
