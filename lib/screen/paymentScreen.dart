import 'package:flutter/material.dart';
import 'package:latihanflutter/MyBotNavBar.dart';
import '../DaftarPoli.dart';

class PaymentScreen extends StatefulWidget {
  final String category;
  final String name;
  final String phoneNumber;
  final String address;
  final String doctorName;
  final String schedule;
  // final String complaint;

  PaymentScreen({
    required this.category,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.doctorName,
    required this.schedule,
    // required this.complaint,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on index
    if (index == 0) {
      // Navigate to Home
    } else if (index == 1) {
      // Navigate to another page, if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    print("doctorName = ${widget.doctorName}");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Pembayaran",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Health Ease',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          children: [
                            const Text('Poli'),
                            const SizedBox(
                              width: 12,
                            ),
                            Text((widget.doctorName == 'Dr. Wafiq Muhaz')
                                ? 'Mata'
                                : (widget.doctorName == 'Dr. John Smith')
                                    ? 'Gigi'
                                    : 'Umum'),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text('Doctor Name: ${widget.doctorName}'),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text('Tanggal Rujukan: 12 - 5 - 2024'),
                        const SizedBox(
                          height: 36,
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Center(
                          child: Text(
                            'Nomor Antrean',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Center(
                          child: Text(
                            'Poliklinik',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Center(
                          child: Text(
                            '08',
                            style: TextStyle(
                                fontSize: 72, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                    category: widget.category,
                                    name: widget.name,
                                    phoneNumber: widget.phoneNumber,
                                    address: widget.address,
                                    doctorName: widget.doctorName,
                                    schedule: widget.schedule,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Check In'),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarPoli(
                                    title: 'Daftar Poli',
                                  ),
                                ),
                              );
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
}
