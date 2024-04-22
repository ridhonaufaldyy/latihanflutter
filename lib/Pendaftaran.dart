import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MyBotNavBar.dart';
import 'DaftarPoli.dart';

class Pendaftaran extends StatefulWidget {
  const Pendaftaran({super.key});

  @override
  State<Pendaftaran> createState() => _PendaftaranState();
}

class _PendaftaranState extends State<Pendaftaran> {
  
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
          image: const AssetImage('assets/background.png'), // Ganti dengan path ke asset Anda
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                child: Text(
                  'Pendaftaran',
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
              _FormDaftar(context), // masuk ke form
              SizedBox(height:80),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 380.0), 
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 200, 
                height: 30, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.greenAccent,
                ),
                child: Center( 
                  child: Text(
                    'Total: ',
                    style: TextStyle(color: Colors.white,),
                    ), // pasang berapa total dari harga disini
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 490.0), 
            child: Center(
              child: SizedBox(
                height: 50,
                width: 165,
                child: ElevatedButton(
                  onPressed: () {
                    // Add the function to be executed when the button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 39, 126, 167),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), 
                    ),
                  ),
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: MyBottomNavigationBar(
      selectedIndex: _selectedIndex,
      onItemTapped: (index) => _onItemTapped(index),
    ),
  );
}



Widget _FormDaftar(BuildContext context){
  final _formKey = GlobalKey<FormState>();
  return Center(
    child: Container(
      width: 370,
      height: 350,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.circular(10),
      ), 
      child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Table(
                columnWidths: {
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 13),
                    child: Text('Gejala :'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Container(
                      height: 33,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF5790AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Usia :'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 33,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF5790AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Tinggi Badan :'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 33,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF5790AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Berat Badan :'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 33,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF5790AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}