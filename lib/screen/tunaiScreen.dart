import 'package:flutter/material.dart';

import '../MyBotNavBar.dart';
import '../home_page.dart';
import 'choseeScreen.dart';

class TunaiScreen extends StatefulWidget {
  const TunaiScreen({super.key});

  @override
  State<TunaiScreen> createState() => _TunaiScreenState();
}

class _TunaiScreenState extends State<TunaiScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                                color: Colors.grey,
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Pembayaran Tunai',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Image.asset(
                                'assets/barcode.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          // Text('Category: $category'),
                          // Text('Doctor Name: ${widget.doctorName}'),
                          const SizedBox(
                            height: 12,
                          ),
                          // Text('Phone Number: $phoneNumber'),
                          // Text('Schedule: ${widget.schedule}'),
                          const SizedBox(
                            height: 62,
                          ),
                          const Center(
                            child: Text(
                              'Total Pembayaran',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                                color: Colors.greenAccent,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "35.000",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const Text('Konsultasi dokter: 35000'),
                          const SizedBox(
                            height: 22,
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Silakan pilih metode pembayaran berikut :",
                              ),
                              Text(
                                "1. Tunjukan Bill Pembayaran Ke Administrasi",
                              ),
                              Text(
                                "2. Bayar Sesuai Dengan Bill Pembayaran Ke Administrasi",
                              ),
                              Text(
                                "3. Pembayaran Telah Selesai",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(9, 82, 89, 1),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PaymentScreen(
                      //       category: widget.category,
                      //       name: widget.name,
                      //       phoneNumber: widget.phoneNumber,
                      //       address: widget.address,
                      //       doctorName: widget.doctorName,
                      //       schedule: widget.schedule,
                      //       // complaint: complaint,
                      //     ),
                      //   ),
                      // );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Lanjutkan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Navigasi ke halaman Home
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
