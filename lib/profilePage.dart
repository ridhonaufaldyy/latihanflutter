import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Indeks halaman profil

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Gunakan gambar background yang sama
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(height: 20),
                _buildProfileInfo('Nama', 'Nadia'),
                _buildProfileInfo('Tinggi Badan', '160 cm'),
                _buildProfileInfo('Berat Badan', '48 kg'),
                _buildProfileInfo('Umur', '20 tahun'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan fungsi untuk mengubah profil
                  },
                  child: Text('Ubah Profil'),
                ),
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
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Ubah ke warna yang sesuai
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });

  switch (index) {
    case 0:
      // Navigasi ke halaman Home
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      break;
    case 1:
      // Navigasi ke halaman Medical Services
      Navigator.pushNamed(context, '/medical_services');
      break;
    case 2:
      // Navigasi ke halaman Healing
      Navigator.pushNamed(context, '/healing');
      break;
    case 3:
      // Navigasi ke halaman Profile
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
      break;
  }
}

}
