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
      home: PhoneCallScreen(),
    );
  }
}

class PhoneCallScreen extends StatefulWidget {
  @override
  _PhoneCallScreenState createState() => _PhoneCallScreenState();
}

class _PhoneCallScreenState extends State<PhoneCallScreen> {
  int _selectedIndex = 3; // Indeks halaman profil
  bool isCallConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Phone Call UI'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isCallConnected
                  ? Text(
                      'Connected',
                      style: TextStyle(fontSize: 24),
                    )
                  : Text(
                      'Sedang Memanggil...',
                      style: TextStyle(fontSize: 24),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Sesuaikan dengan dimensi layar
              isCallConnected
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isCallConnected = !isCallConnected;
                        });
                      },
                      child: Text('End Call'),
                    )
                  : Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5, // Sesuaikan dengan lebar layar
                              height: MediaQuery.of(context).size.width * 0.5, // Sesuaikan dengan lebar layar
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 9, 82, 89),
                              ),
                              child: Icon(
                                Icons.phone_forwarded_sharp,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.3, // Sesuaikan dengan lebar layar
                              ),
                            ),
                            Positioned(
                              top: -MediaQuery.of(context).size.width * 0.2, // Sesuaikan dengan lebar layar
                              child: Text(
                                'Ambulans',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.05, // Sesuaikan dengan lebar layar
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.2), // Sesuaikan dengan dimensi layar
                        IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          iconSize: MediaQuery.of(context).size.width * 0.15, // Sesuaikan dengan lebar layar
                          onPressed: () {
                            // Action ketika tombol cancel ditekan
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Navigasi ke halaman Home
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
        // Tidak perlu melakukan navigasi karena sudah berada di halaman Profile
        break;
    }
  }
}
