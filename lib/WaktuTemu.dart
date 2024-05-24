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

  String _name = 'Dr. Afriyan Wahyudhi, Sp.A, M.Kes';
  String _profession = 'Dokter Anak';

  // DateTime _selectedDate = DateTime.now();
  // TimeOfDay _selectedTime = TimeOfDay.now();
  String selectedMonth = 'May'; 
  int selectedYear = DateTime.now().year; 
  int selectedMonthIndex = 0; 
  int selectedTimeIndex = 0;

  TextEditingController _notesController = TextEditingController();

  void _onRatingChanged(double newRating) {
    setState(() {
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
                        SmoothStarRating(
                          rating: 5,
                          size: 20.0,
                          color: Color(0xFF095259),
                          borderColor: Color(0xFF095259),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 230, // Tinggi yang cukup untuk memuat elemen-elemen di dalam Stack
                          decoration: BoxDecoration(
                            color: Color(0xFF5790AB), // Warna hijau untuk background stack
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_left),
                                    onPressed: () {
                                      setState(() {
                                        int currentIndex = months.indexOf(selectedMonth);
                                        if (currentIndex > 0) {
                                          selectedMonth = months[currentIndex - 1];
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    selectedMonth,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_right),
                                    onPressed: () {
                                      setState(() {
                                        int currentIndex = months.indexOf(selectedMonth);
                                        if (currentIndex < months.length - 1) {
                                          selectedMonth = months[currentIndex + 1];
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 50,
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
                                          color: index == selectedMonthIndex ? Color.fromARGB(255, 83, 191, 201) : Colors.white,
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

                              
                              SizedBox(height: 10),
                              Container(
                                height: 60,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    bool isSelected = selectedTimeIndex == index;
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedTimeIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: isSelected ? Color.fromARGB(255, 83, 191, 201) : Colors.white,
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
                                            "${index + 6}:00 PM",
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
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 80,
                      child: TextField(
                        controller: _notesController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 230, 224, 224),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Isi keluhan...',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                            backgroundColor: Color(0xFF0A535A), 
                            foregroundColor: Colors.white,  
                          ),
                          child: Text('Buat Janji Temu'),
                        ),
                      ),
                    ),
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

  final List<String> months = [
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
    'December'
  ];
}


class SmoothStarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final Color borderColor;

  const SmoothStarRating({
    Key? key,
    required this.rating,
    this.size = 30,
    this.color = Colors.yellow,
    this.borderColor = Colors.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        double ratingValue = index + 1.0;
        IconData iconData;
        if (ratingValue <= rating) {
          iconData = Icons.star;
        } else if (ratingValue - rating < 1.0) {
          iconData = Icons.star_half;
        } else {
          iconData = Icons.star_border;
        }
        return Icon(
          iconData,
          color: ratingValue <= rating ? color : borderColor,
          size: size,
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
