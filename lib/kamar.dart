import 'package:flutter/material.dart';
// import 'MyBotNavBar.dart';
// import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FASILITAS KAMAR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: DashBoardScreenKamar(),
    );
  }
}

class DashBoardScreenKamar extends StatefulWidget {
  @override
  _DashBoardScreenKamarState createState() => _DashBoardScreenKamarState();
}

class _DashBoardScreenKamarState extends State<DashBoardScreenKamar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_selectedIndex) {
      case 0:
        currentPage = FasilitasScreen();
        break;
      case 1:
        currentPage = SearchScreen();
        break;
      case 2:
        currentPage = ProfileScreen();
        break;
      default:
        currentPage = FasilitasScreen();
    }

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            label: 'Obat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 226, 243, 33),
        onTap: _onItemTapped,
      ),
    );
  }
}

class FasilitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              Row(
                children: [
                  SizedBox(height: 40.0),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width
                      : 80.0),
                  Text(
                    'Kamar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Kadwa',
                      fontWeight: FontWeight.w700,
                      height: 0.05,
                      letterSpacing: -0.08,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                ],
              ),
              SizedBox(height: 50.0),
              buildKamarItem(
                  context, "assets/img 3.png", "   kelas 1\nNone BPJS"),
              SizedBox(height: 5.0),
              buildKamarItem(
                  context, "assets/img 2.png", "   kelas 2\nBPJS 45%"),
              SizedBox(height: 5.0),
              buildKamarItem(
                  context, "assets/img 1.png", "   kelas 3\nFull BPJS"),
              SizedBox(height: 5.0), // Adding space between images
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKamarItem(BuildContext context, String imageAsset, String text) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(text)),
        );
      },
      child: Container(
        height: 172,
        width: double.infinity,
        padding: EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Black background with 80% opacity
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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

class NextPage extends StatelessWidget {
  final String text;

  NextPage(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman untuk $text',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ini adalah Halaman Search',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ini adalah Halaman Profile',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
