import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'WaktuTemu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RatingDokter(),
    );
  }
}

class RatingDokter extends StatefulWidget {
  @override
  _RatingDokterState createState() => _RatingDokterState();
}

class _RatingDokterState extends State<RatingDokter> {
  int _selectedIndex = 0;

  double _rating = 0;
  String _name = 'Dr. Afriyan Wahyudhi, Sp.A, M.Kes';
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
        title: Text('Rating Dokter'),
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
                    SizedBox(height: 20),
                    Text(
                      'Deskripsi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod suscipit augue, et ultrices odio efficitur sit amet.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ulasan',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            // Tambahkan navigasi ke halaman 'see all' di sini
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue, // Warna dapat disesuaikan
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Kolom untuk username pertama
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey, // Ubah warna garis sesuai kebutuhan
                                        width: 1.0, // Ubah ketebalan garis sesuai kebutuhan
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: AssetImage('assets/orange.jpg'),
                                          ),
                                          SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              "Username 1",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          SmoothStarRating(
                                            rating: 3.5,
                                            size: 20.0,
                                            color: Colors.yellow,
                                            borderColor: Colors.yellow,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "12 Sep 2021",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum...",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.0), // Beri jarak antara kolom
                                // Kolom untuk username kedua
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey, // Ubah warna garis sesuai kebutuhan
                                        width: 1.0, // Ubah ketebalan garis sesuai kebutuhan
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: AssetImage('assets/pepaya.jpg'),
                                          ),
                                          SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              "Username 2",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          SmoothStarRating(
                                            rating: 4.5,
                                            size: 20.0,
                                            color: Colors.yellow,
                                            borderColor: Colors.yellow,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "06 Jun 2021",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum...",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],

                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 200, // Ubah nilai ini untuk menyesuaikan panjang tombol
                        padding: EdgeInsets.symmetric(vertical: 10.0), // Menambahkan padding vertikal
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman janji temu
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WaktuTemu()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0A535A), // Warna latar belakang tombol
                            foregroundColor: Colors.white,  
                          ),
                          child: Text('Konsultasi'),
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
