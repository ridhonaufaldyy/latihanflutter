import 'package:flutter/material.dart';
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
          icon: Icon(Icons.medical_services, size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.message, size: 35),
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
    Navigator.pushNamed(context, '/home');
    break;
  case 1:
    Navigator.pushNamed(context, '/medical_services');
    break;
  case 2:
    Navigator.pushNamed(context, '/healing');
    break;
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
