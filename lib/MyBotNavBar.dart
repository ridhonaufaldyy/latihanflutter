import 'package:flutter/material.dart';
import 'package:latihanflutter/JanjiTemu.dart';
import 'package:latihanflutter/home_page.dart';
import 'package:latihanflutter/obat.dart';
import 'package:latihanflutter/profilePage.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final int userId;
  final String token;

  MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.userId,
    required this.token,
  });

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
          icon: Icon(Icons.shopping_cart, size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.medical_services, size: 35),
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
      onTap: (index) async {
        widget.onItemTapped(index);

        // Navigasi ke halaman baru sesuai dengan index yang ditekan
        switch (index) {
          case 0:
            // Navigasi ke HomeScreen, pastikan untuk meneruskan userId dan token
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(userId: widget.userId, token: widget.token)),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicineSalesPage(
              userId: widget.userId,
              token: widget.token
              )),
            );
            break;
          case 2:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => JanjiTemuPage()),
            // );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(userId: widget.userId, token: widget.token)),
            );
            break;
        }
      },
    );
  }
}
