import 'package:flutter/material.dart';
import 'MyBotNavBar.dart'; // Import file untuk MyBottomNavigationBar
import 'home_page.dart';

void main() {
  runApp(ArticleMata());
}

class ArticleMata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artikel Kesehatan Mata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleMataScreen(),
    );
  }
}

class ArticleMataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buah untuk Kesehatan Mata'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildFruitItem(
              'Jeruk',
              'Jeruk kaya akan vitamin C yang melindungi mata dari kerusakan oksidatif. Vitamin C juga membantu meningkatkan daya tahan tubuh dan mengurangi risiko penyakit mata.',
              'assets/orange.jpg',
            ),
            SizedBox(height: 16),
            _buildFruitItem(
              'Blueberry',
              'Blueberry mengandung antosianin yang melindungi retina dari kerusakan. Antosianin juga dapat membantu meningkatkan sirkulasi darah ke mata.',
              'assets/blueberry.jpeg',
            ),
            SizedBox(height: 16),
            _buildFruitItem(
              'Strawberry',
              'Strawberry kaya akan vitamin C dan lutein, yang membantu melindungi mata dari kerusakan radikal bebas dan membantu menjaga kesehatan retina.',
              'assets/strawberry.jpg',
            ),
            SizedBox(height: 16),
            _buildFruitItem(
              'Alpukat',
              'Alpukat mengandung lutein dan zeaxanthin yang baik untuk retina. Kedua zat ini merupakan antioksidan yang membantu melindungi mata dari efek buruk sinar UV.',
              'assets/avocado.jpeg',
            ),
            SizedBox(height: 16),
            _buildFruitItem(
              'Pepaya',
              'Pepaya kaya akan vitamin C dan beta karoten yang membantu menjaga kesehatan mata. Beta karoten juga berperan dalam pembentukan pigmen retina.',
              'assets/pepaya.jpg',
            ),
            SizedBox(height: 16),
            _buildFruitItem(
              'Mangga',
              'Mangga mengandung vitamin A dan beta karoten untuk menjaga kelembaban mata dan menjaga kesehatan retina. Vitamin A juga penting untuk menjaga kornea mata tetap sehat.',
              'assets/mango.jpg',
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
      //       //   // Navigasi ke halaman LoginScreen
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => HomeScreen()),
      //       // ); 
      //                } else if (index == 1) {
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

  Widget _buildFruitItem(String title, String description, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Image.asset(
          imagePath,
          width: 200,
          height: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          description,
        ),
      ],
    );
  }
}
