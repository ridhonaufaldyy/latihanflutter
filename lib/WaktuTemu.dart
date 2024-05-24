import 'package:flutter/material.dart';
import 'package:latihanflutter/home_page.dart';
import 'MyBotNavBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janji Temu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaktuTemu(),
    );
  }
}

class WaktuTemu extends StatefulWidget {
  @override
  _WaktuTemuState createState() => _WaktuTemuState();
}

class _WaktuTemuState extends State<WaktuTemu> {
  int _selectedIndex = 0;

  double _rating = 0;
  String _name = 'Dr. Afriyan Wahyudhi, Sp.A, M.Kes';
  String _profession = 'Dokter Anak';

  // DateTime _selectedDate = DateTime.now();
  // TimeOfDay _selectedTime = TimeOfDay.now();
  String selectedMonth = 'May'; 
  int selectedYear = DateTime.now().year; 
  int selectedMonthIndex = 0; 
  int selectedTimeIndex = 0;

  TextEditingController _notesController = TextEditingController(); // Controller untuk TextField

  void _onRatingChanged(double newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Jadwal Temu Dokter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'), // Gunakan gambar background yang sama
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/dokterAnak.png'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$_name', style: TextStyle(fontSize: 25)),
                    SizedBox(height: 15),
                    Text('$_profession', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        RatingBar(
                          rating: _rating,
                          onRatingChanged: _onRatingChanged,
                          size: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Bulan",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        DropdownButton<String>(
                          value: selectedMonth,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMonth = newValue!;
                            });
                          },
                          items: <String>[
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Tahun",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        DropdownButton<int>(
                          value: selectedYear,
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedYear = newValue!;
                            });
                          },
                          items: List.generate(6, (index) => DateTime.now().year + index)
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedMonthIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                              decoration: BoxDecoration(
                                color: index == selectedMonthIndex ? Color(0xFF0A535A) : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 4,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${index + 8}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: index == selectedMonthIndex ? Colors.white : Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Booking Time",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index){
                          bool isSelected = selectedTimeIndex == index;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedTimeIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFF0A535A) : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 4,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 6}: 00 PM",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected ? Colors.white : Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Catatan",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tambahkan catatan...',
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: Container(
                        width: 200, // Ubah nilai ini untuk menyesuaikan panjang tombol
                        padding: EdgeInsets.symmetric(vertical: 10.0), // Menambahkan padding vertikal
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman ....
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()), // ganti bukan ke page waktuTemu
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0A535A), // Warna latar belakang tombol
                            foregroundColor: Colors.white,  
                          ),
                          child: Text('Buat Janji Temu'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final ValueChanged<double>? onRatingChanged;

  const RatingBar({
    Key? key,
    required this.rating,
    this.size = 30,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: onRatingChanged != null ? () => onRatingChanged!(index + 1.0) : null,
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
            size: size,
          ),
        );
      }),
    );
  }
}

// Future<void> _selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: _selectedDate,
//     firstDate: DateTime.now(),
//     lastDate: DateTime(2101),
//   );
//   if (picked != null && picked != _selectedDate) {
//     setState(() {
//       _selectedDate = picked;
//     });
//   }
// }

// Future<void> _selectTime(BuildContext context) async {
//   final TimeOfDay? picked = await showTimePicker(
//     context: context,
//     initialTime: _selectedTime,
//   );
//   if (picked != null && picked != _selectedTime) {
//     setState(() {
//       _selectedTime = picked;
//     });
//   }
// }
