import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'paymentScreen.dart';

class OrderScreen extends StatelessWidget {
  final String category;
  final String name;
  final String phoneNumber;
  final String address;
  final String doctorName;
  final String schedule;
  final String complaint;

  OrderScreen({
    required this.category,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.doctorName,
    required this.schedule,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Pemesanan",
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
            padding: const EdgeInsets.only(top:120.0),
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
                            'Detail Pasien',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Text('Nama Pasien: $name'),
                        const SizedBox(
                          height: 12,
                        ),
                        // Text('Category: $category'),
                        Text('Doctor Name: $doctorName'),
                        const SizedBox(
                          height: 12,
                        ),
                        // Text('Phone Number: $phoneNumber'),
                        Text('Schedule: $schedule'),
                        const SizedBox(
                          height: 62,
                        ),
                        const Center(
                          child: Text(
                            'Tagihan',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Konsultasi dokter'),
                            Text(('$doctorName' == 'Dr. Wafiq Muhaz')
                                ? 'Rp.935000'
                                : ("$doctorName" == 'Dr. John Smith')
                                    ? 'Rp.35000'
                                    : 'Rp.50000'),
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Total'),
                            Text(('$doctorName' == 'Dr. Wafiq Muhaz')
                                ? 'Rp.935000'
                                : ("$doctorName" == 'Dr. John Smith')
                                    ? 'Rp.35000'
                                    : 'Rp.50000'),
                          ],
                        ),
                        // const Text('Total: 35000'),
                        // Text('Address: $address'),
                        // Text('Complaint: $complaint'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          category: category,
                          name: name,
                          phoneNumber: phoneNumber,
                          address: address,
                          doctorName: doctorName,
                          schedule: schedule,
                          // complaint: complaint,
                        ),
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
    );
  }
}
