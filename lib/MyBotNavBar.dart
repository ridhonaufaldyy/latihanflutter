import 'package:flutter/material.dart';
import 'package:latihanflutter/JanjiTemu.dart';
import 'package:latihanflutter/home_page.dart';
import 'package:latihanflutter/obat.dart';
import 'profilePage.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MyBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 35),
          label: '',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.add_shopping_cart, size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.medical_services_sharp, size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.person, size: 35),
          label: '',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Color(0xFFFFD700), // Yellow color
      unselectedItemColor: Colors.white,
      onTap: (index) {
        // Panggil fungsi onTap yang disediakan oleh widget parent
        widget.onItemTapped(index);
        
        // Navigasi ke halaman baru sesuai dengan index yang ditekan
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()), // Panggil constructor ProfilePage
            );            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicineSalesPage()), // Panggil constructor ProfilePage
            );            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JanjiTemu()), // Panggil constructor ProfilePage
            );            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()), // Panggil constructor ProfilePage
            );
            break;
          default:
            break;
        }
      },
    );
  }
}
