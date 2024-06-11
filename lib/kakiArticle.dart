import 'package:flutter/material.dart';
import 'MyBotNavBar.dart'; // Import file untuk MyBottomNavigationBar
import 'home_page.dart';

void main() {
  runApp(ArticleKaki());
}

class ArticleKaki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artikel Kesehatan Kaki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleKakiScreen(),
    );
  }
}

class ArticleKakiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips & Trick Menjaga Kesehatan Kaki'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildTipItem(
              'Pilih Sepatu yang Nyaman',
              'Pastikan sepatu yang Anda gunakan sesuai dengan bentuk dan ukuran kaki Anda. Hindari sepatu yang terlalu sempit atau terlalu longgar.',
            ),
            SizedBox(height: 16),
            _buildTipItem(
              'Istirahatkan Kaki',
              'Jika Anda bekerja atau beraktivitas dalam waktu yang lama, berikan waktu istirahat untuk kaki Anda. Lakukan peregangan ringan atau pijatan untuk merilekskan otot kaki.',
            ),
            SizedBox(height: 16),
            _buildTipItem(
              'Perhatikan Postur Tubuh',
              'Pastikan postur tubuh Anda saat berdiri atau duduk tidak memberikan tekanan berlebih pada kaki. Dukung tubuh Anda dengan baik untuk menghindari cedera.',
            ),
            SizedBox(height: 16),
            _buildTipItem(
              'Jaga Kebersihan Kaki',
              'Bersihkan dan keringkan kaki setiap hari. Gunakan sepatu dan kaos kaki yang bersih untuk menghindari infeksi dan iritasi kulit.',
            ),
            SizedBox(height: 16),
            _buildTipItem(
              'Gunakan Pelindung Saat Berolahraga',
              'Jika Anda melakukan aktivitas olahraga atau bermain olahraga yang melibatkan kaki, gunakan pelindung seperti pergelangan kaki atau pelindung lutut untuk mencegah cedera.',
            ),
            SizedBox(height: 16),
            _buildTipItem(
              'Kontrol Berat Badan',
              'Pertahankan berat badan yang sehat untuk mengurangi tekanan pada kaki. Berat badan yang berlebih dapat meningkatkan risiko cedera dan masalah kaki lainnya.',
            ),
          ],
        ),
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   // Tambahkan MyBottomNavigationBar di bottomNavigationBar
      //   selectedIndex: 0, // Sesuaikan selectedIndex jika diperlukan
      //   onItemTapped: (index) {
      //     // Sesuaikan onItemTapped jika diperlukan
      //     // Handle navigasi ketika item bottom navigation bar ditekan
      //     // Contoh:
      //     if (index == 0) {
      //       // Navigator.push(
      //       //   // Navigasi ke halaman HomeScreen
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => HomeScreen()),
      //       // );
      //     } else if (index == 1) {
      //       // Jika index 1 (atau index untuk halaman 'Obat'), tidak ada tindakan khusus
      //     } else if (index == 2) {
      //       // Jika index 2 (atau index untuk halaman 'Healing'), tidak ada tindakan khusus
      //     } else if (index == 3) {
      //       // Jika index 3 (atau index untuk halaman 'Profile'), tidak ada tindakan khusus
      //     }
      //     // Tambahkan kondisi lain jika diperlukan
      //   },
      // ),
    );
  }

  Widget _buildTipItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          description,
        ),
      ],
    );
  }
}
