import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:latihanflutter/login_screen.dart';
import 'register.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healty Ease',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar item carousel: gambar dan teks
  final List<Map<String, String>> carouselItems = [
    {
      'imagePath': 'assets/carousel-on-welcome.png',
      'text1': 'NEAR TO YOU',
      'text2': 'Tulisan gambar pertama',
    },
    {
      'imagePath': 'assets/carousel-on-welcome.png',
      'text1': 'NEAR TO YOU',
      'text2': 'Tulisan gambar pertama',
    },
    {
      'imagePath': 'assets/carousel-on-welcome.png',
      'text1': 'NEAR TO YOU',
      'text2': 'Tulisan gambar pertama',
    }
  ];

  // Indeks slide saat ini
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Tambahkan background image menggunakan BoxDecoration
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/welcome.jpg'), // Sesuaikan jalur gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: buildMainContent(),
        ),
      ),
    );
  }

Widget buildMainContent() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.zero, // Hapus margin di sini
        child: Text(
          'Health Ease',
          style: TextStyle(
            fontSize: 48,
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.White.withOpacity(0.5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCarouselSlider(),
            buildCarouselIndicators(),
            buildGetStartedButton(),
            buildLoginText(),
          ],
        ),
      ),
    ],
  );
}

  // Bangun Carousel Slider
  Widget buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 380,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          setState(() {
            _currentCarouselIndex = index;
          });
        },
      ),
      items: carouselItems.map((item) {
        return buildCarouselItem(item);
      }).toList(),
    );
  }

  // Bangun item dalam carousel
  Widget buildCarouselItem(Map<String, String> item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Gambar pada carousel
        Image.asset(
          item['imagePath']!,
          width: 200,
          height: 180,
        ),
        // Tulisan di bawah gambar
        Padding(
          padding: EdgeInsets.zero,
          child: Text(
            item['text1']!,
            style: TextStyle(
              fontSize: 24,
              color: AppColors.Black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Text(
            item['text2']!,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.Black,
            ),
          ),
        ),
      ],
    );
  }

  // Bangun indikator carousel
  Widget buildCarouselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: carouselItems.asMap().entries.map((entry) {
        int index = entry.key;
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentCarouselIndex = index;
            });
          },
          child: Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentCarouselIndex == index ? AppColors.blue : AppColors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }

  // Bangun tombol "Get Started"
  Widget buildGetStartedButton() {
    return SizedBox(
      height: 30,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          // Navigasi ke halaman berikutnya
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        child: Text('Get Started'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentColor,
          foregroundColor: AppColors.White,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget buildLoginText() {
    return Padding(
      padding: EdgeInsets.only(top:5,bottom: 30),
      child: RichText(
        text: TextSpan(
          text: 'Apakah Anda sudah punya akun? ',
          style: TextStyle(
            color: AppColors.Black,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'Login',
              style: TextStyle(
                color: AppColors.blue, // Warna biru untuk teks "Login"
                fontSize: 14,
              ),
              // Tambahkan GestureRecognizer untuk membuat teks dapat di-klik
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigasi ke halaman login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
