import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'Pendaftaran.dart';
import 'screen/regScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Poli',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DaftarPoli(title: 'Daftar Poli'),
    );
  }
}

class DaftarPoli extends StatefulWidget {
  const DaftarPoli({Key? key, required this.title});
  final String title;

  @override
  State<DaftarPoli> createState() => _DaftarPoliState();
}

class _DaftarPoliState extends State<DaftarPoli> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengubah posisi teks "Daftar POLI"
          children: [
            const SizedBox(height: 40), // Jarak antara atas ke kontainer pertama
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                child: Text(
                  'Daftar POLI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 0.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(1.0,1.0),
                        blurRadius: 10.0,
                        color: Color.fromARGB(121, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak antara dua kontainer
            _buildPoliContainer(context, 'POLI UMUM', 'https://puskpolowijen.malangkota.go.id/wp-content/uploads/sites/132/2021/04/WhatsApp-Image-2021-04-24-at-1.57.10-PM-1024x461.jpeg'),
            const SizedBox(height: 20), // Jarak antara dua kontainer
            _buildPoliContainer(context, 'POLI GIGI', 'https://th.bing.com/th/id/OIP.5NtKV1WDV2AZCxAA3C3mSgAAAA?rs=1&pid=ImgDetMain'),
            const SizedBox(height: 20), // Jarak antara dua kontainer
            _buildPoliContainer(context, 'POLI MATA', 'https://th.bing.com/th/id/OIP.93un6q2DJQkFbIuBhsFOmgAAAA?rs=1&pid=ImgDetMain'),
            const SizedBox(height: 20), // Jarak antara dua kontainer
            _buildPoliContainer(context, 'POLI Kandungan', 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1637547406/attached_image/bagaimana-memilih-dokter-kandungan-yang-tepat.jpg'),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar( 
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(index),
      ),
    );
  }
}

Widget _buildPoliContainer(BuildContext context, String poliName, String imagePath) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imagePath), 
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              poliName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          Positioned(
            // bottom: 10.0,
            right: 10.0,
            child: SizedBox(
              width: 80, // Sesuaikan ukuran tombol
              height: 40, // Sesuaikan ukuran tombol
              child: ElevatedButton(
                onPressed: () {
                  print('Tombol "Pilih" ditekan di $poliName');
                  Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const RegScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), 
                  ),
                ),
                child: const Text(
                  'Pilih',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0, // Sesuaikan ukuran teks
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
