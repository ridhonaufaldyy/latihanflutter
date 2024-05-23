import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'orderScreen.dart';

// import '../widgets/RegistrationButtonWidget.dart';
// import '../widgets/radioButtonWidget.dart';
// import 'orderScreen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  int _selectedTimeSlot = 0;
  String? _selectedCategory;
  String? _selectedDoctor;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _dataSelectedDoctor = _selectedDoctor ?? "";
    String _dataSelectedCategory = _selectedCategory ?? "";
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Pendaftaran',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Kategori Daftar",
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: const Color.fromRGBO(9, 82, 89, 1),
                                ),
                                child: DropdownButtonFormField<String>(
                                  iconEnabledColor: Colors.white,
                                  value: _selectedCategory,
                                  decoration: const InputDecoration(
                                    labelText: 'Kategori Daftar',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    labelStyle: TextStyle(
                                        color: Colors
                                            .grey), // Set label text color
                                    hintStyle: TextStyle(
                                        color:
                                            Colors.grey), // Set hint text color
                                  ),
                                  items: ['Umum', 'BPJS', 'Asuransi']
                                      .map((label) => DropdownMenuItem(
                                            value: label,
                                            child: Text(
                                              label,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCategory = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Nama",
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: const Color.fromRGBO(9, 82, 89, 1),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "No. Telpon",
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: const Color.fromRGBO(9, 82, 89, 1),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  controller: _phoneController,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    labelText: '+628xxx',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Alamat",
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: const Color.fromRGBO(9, 82, 89, 1),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  controller: _addressController,
                                  decoration: const InputDecoration(
                                    labelText: 'Alamat',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        12,
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Nama Dokter",
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: const Color.fromRGBO(9, 82, 89, 1),
                                ),
                                child: DropdownButtonFormField<String>(
                                  iconEnabledColor: Colors.white,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama Dokter',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    labelStyle: TextStyle(
                                        color: Colors
                                            .grey), // Set label text color
                                    hintStyle: TextStyle(
                                        color:
                                            Colors.grey), // Set hint text color
                                  ),
                                  value: _selectedDoctor,
                                  items: [
                                    'Dr. Ridho Naufaldy',
                                    'Dr. Wafiq Muhaz',
                                    'Dr. John Smith'
                                  ]
                                      .map((label) => DropdownMenuItem(
                                            value: label,
                                            child: Text(
                                              label,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedDoctor = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Center(
                          child: Text(
                            'Pilih Jadwal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RadioList(
                          selectedTimeSlot: _selectedTimeSlot,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedTimeSlot = value!;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Keluhan",
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: const Color.fromRGBO(9, 82, 89, 1),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  controller: _complaintController,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    labelText: '......',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          12,
                                        ),
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
                RegistrationNext(
                  selectedCategory: _dataSelectedCategory,
                  name: _nameController.text,
                  phoneNumber: _phoneController.text,
                  address: _addressController.text,
                  doctorName: _dataSelectedDoctor,
                  schedule: timeSlots[_selectedTimeSlot],
                  complaint: _complaintController.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationNext extends StatelessWidget {
  final String selectedCategory;
  final String name;
  final String phoneNumber;
  final String address;
  final String doctorName;
  final String schedule;
  final String complaint;

  const RegistrationNext({
    Key? key,
    required this.selectedCategory,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.doctorName,
    required this.schedule,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderScreen(
              category: selectedCategory,
              name: name,
              phoneNumber: phoneNumber,
              address: address,
              doctorName: doctorName,
              schedule: schedule,
              complaint: complaint,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Center(
          child: Card(
            child: Container(
              width: 111,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                color: Color.fromRGBO(9, 82, 89, 1),
              ),
              child: const Center(
                child: Text(
                  "Daftar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Kadwa',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioList extends StatelessWidget {
  final int selectedTimeSlot;
  final ValueChanged<int?>? onChanged;

  const RadioList({
    Key? key,
    required this.selectedTimeSlot,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: timeSlots.length,
          itemBuilder: (BuildContext context, int index) {
            final timeSlot = timeSlots[index];
            return RadioListTile<int>(
              value: index,
              title: Text(timeSlot),
              groupValue: selectedTimeSlot,
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}

List<String> timeSlots = [
  "Senin : 09:00 - 11:00",
  "Senin : 13:00 - 15:00",
  "Senin : 16:00 - 19:00",
];
