import 'package:flutter/material.dart';
import 'screen/regScreen.dart';

enum Poli {
  UMUM,
  GIGI,
  MATA,
  KANDUNGAN,
}

class DaftarPoli extends StatefulWidget {
  final int userId;
  final String token;

  DaftarPoli({
    required this.userId,
    required this.token,
  });

  @override
  State<DaftarPoli> createState() => _DaftarPoliState();
}

class _DaftarPoliState extends State<DaftarPoli> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
                        offset: Offset(1.0, 1.0),
                        blurRadius: 10.0,
                        color: Color.fromARGB(121, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildPoliContainer(
                context,
                'POLI UMUM',
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpuskpolowijen.malangkota.go.id%2Fpoli-umum%2F&psig=AOvVaw0382UumgLGPLyTUobFUufg&ust=1715688688577000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIDwhtLMioYDFQAAAAAdAAAAABAE',
                Poli.UMUM),
            const SizedBox(height: 20),
            _buildPoliContainer(
                context,
                'POLI GIGI',
                'https://th.bing.com/th/id/OIP.5NtKV1WDV2AZCxAA3C3mSgAAAA?rs=1&pid=ImgDetMain',
                Poli.GIGI),
            const SizedBox(height: 20),
            _buildPoliContainer(
                context,
                'POLI MATA',
                'https://th.bing.com/th/id/OIP.93un6q2DJQkFbIuBhsFOmgAAAA?rs=1&pid=ImgDetMain',
                Poli.MATA),
            const SizedBox(height: 20),
            _buildPoliContainer(
                context,
                'POLI Kandungan',
                'https://res.cloudinary.com/dk0z4ums3/image/upload/v1637547406/attached_image/bagaimana-memilih-dokter-kandungan-yang-tepat.jpg',
                Poli.KANDUNGAN),
          ],
        ),
      ),
    );
  }

  Widget _buildPoliContainer(
    BuildContext context, String poliName, String imagePath, Poli poliValue) {
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
                right: 10.0,
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Tombol "Pilih" ditekan di $poliName');
                      // Tentukan nilai sesuai poli yang dipilih
                      int poliId;
                      switch (poliValue) {
                        case Poli.UMUM:
                          poliId = 1;
                          break;
                        case Poli.GIGI:
                          poliId = 2;
                          break;
                        case Poli.MATA:
                          poliId = 3;
                          break;
                        case Poli.KANDUNGAN:
                          poliId = 4;
                          break;
                        default:
                          poliId = 0; // Default jika tidak ada poli yang dipilih
                      }

                      // Navigasi ke layar RegScreen dengan menyediakan userId, token, dan poliId
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegScreen(
                          userId: widget.userId, // Menggunakan poliId sebagai userId
                          token: widget.token, // Menggunakan poliName sebagai token
                          poliId: poliId,
                        )),
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
                        fontSize: 12.0,
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
}
