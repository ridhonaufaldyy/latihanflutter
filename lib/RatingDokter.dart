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
  String _name = 'dr. Gavi Pablo';
  String _profession = 'Dokter Anak';
  String _review = 'Sangat membantu dan ramah dalam penanganan anak.';

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
                    Text(
                      'Deskripsi',
                      style: TextStyle(fontSize: 16),
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
                    Text(
                      'Ulasan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    UserReview(
                      profileImage: 'assets/orange.jpg', // Ganti dengan path foto profil pengulas
                      reviewText: _review,
                      rating: _rating,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman janji temu
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WaktuTemu()),
                        );
                      },
                      child: Text('Pilih Waktu'),
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

class UserReview extends StatelessWidget {
  final String profileImage;
  final String reviewText;
  final double rating;

  const UserReview({
    Key? key,
    required this.profileImage,
    required this.reviewText,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(width: 10),
            Text(
              'Haris',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            RatingBar(rating: rating, size: 16),
          ],
        ),
        SizedBox(height: 5),
        Text(
          reviewText,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
