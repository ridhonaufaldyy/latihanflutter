import 'package:flutter/material.dart';

import '../MyBotNavBar.dart';
import '../home_page.dart';
import 'succesScreen.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  int _selectedRadio = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Metode Pembayaran",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
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
              padding: const EdgeInsets.only(top: 52.0),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRadioButtons(),
                        
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
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  " Silakan lakukan pembayaran",
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Total",
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
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
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessScreen( //PaymentScreen(
                            // category: widget.category,
                            // name: widget.name,
                            // phoneNumber: widget.phoneNumber,
                            // address: widget.address,
                            // doctorName: widget.doctorName,
                            // schedule: widget.schedule,
                            // complaint: complaint,
                          ),
                        ),
                      );

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SuccessScreen(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Bayar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
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

  Widget _buildRadioButtons() {
    return Column(
      children: [
        _buildRadioButton(0, 'DANA', 'assets/dana.png'),
        _buildRadioButton(1, 'OVO', 'assets/ovo.png'),
        _buildRadioButton(2, 'Gopay', 'assets/gopay.png'),
        _buildRadioButton(3, 'ShopeePay', 'assets/shopeepay.png'),
      ],
    );
  }

  Widget _buildRadioButton(int value, String text, String imagePath) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        child: Image.asset(
          imagePath,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Radio<int>(
        value: value,
        groupValue: _selectedRadio,
        onChanged: (int? newValue) {
          setState(() {
            _selectedRadio = newValue!;
          });
        },
      ),
    );
  }
}
