import 'package:flutter/material.dart';
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
  String _name = 'dr. Gavi Pablo';
  String _profession = 'Dokter Anak';

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
                    image: AssetImage('assets/strawberry.jpg'), 
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
                        // Text(
                        //   'Rating: ',
                        //   style: TextStyle(fontSize: 16),
                        // ),
                        RatingBar(
                          rating: _rating,
                          onRatingChanged: _onRatingChanged,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          value: 'January', // Nilai default bulan
                          onChanged: (String? newValue) {
                            setState(() {
                              // Handle perubahan bulan
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
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7, // Example days
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100, // Adjust width as needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${index + 1}'), // Example text
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle date selection
                                  },
                                  child: Text('Select'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle time selection
                          },
                          child: Text('09:00'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle time selection
                          },
                          child: Text('10:00'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle time selection
                          },
                          child: Text('11:00'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle time selection
                          },
                          child: Text('12:00'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Buat janji temu
                      },
                      child: Text('Buat Janji Temu'),
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
