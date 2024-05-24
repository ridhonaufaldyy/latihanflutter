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

  String _name = 'Dr. Afriyan Wahyudhi, Sp.A, M.Kes';
  String _profession = 'Dokter Anak';

  void _onRatingChanged(double newRating) {
    setState(() {
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
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 157, 186, 199).withOpacity(0.5),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_name, style: TextStyle(fontSize: 25)),
                          SizedBox(height: 15),
                          Text(_profession, style: TextStyle(fontSize: 18)),
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
                          SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromARGB(255, 241, 237, 237),
                              ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Dr. Afriyan Wahyudhi, Sp.A, M.Kes adalah seorang dokter anak berpengalaman yang berdedikasi untuk memberikan perawatan kesehatan terbaik bagi anak-anak. Dr. Afriyan Wahyudhi, Sp.A, M.Kes memiliki keahlian dalam menangani berbagai kondisi kesehatan anak, mulai dari penyakit umum hingga masalah kesehatan yang lebih kompleks.',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(height: 1, color: Colors.black),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ulasan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Tambahkan navigasi ke halaman 'see all' di sini
                                },
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blue,
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
                                buildReview(
                                  context,
                                  "Ahmad",
                                  'assets/ahmad.png',
                                  3.5,
                                  "12 Sep 2021",
                                  "Dr. Afriyan sangat baik dan Penjelasannya selalu mudah dipahami. Hanya saja ruang tunggu agak ramai, mungkin karena banyak yang tahu tentang kehebatan dokter ini.",
                                ),
                                SizedBox(height: 16.0),
                                buildReview(
                                  context,
                                  "Anita",
                                  'assets/anita.png',
                                  4.5,
                                  "06 Jun 2021",
                                  "Pengalaman yang menyenangkan dengan Dr. Afriyan. Dokter sangat profesional dan ramah terhadap anak-anak. Anak saya yang biasanya takut dengan dokter, kali ini bisa tenang dan tidak rewel.",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 16.0,
                                left: 16.0,
                                right: 16.0,
                                bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 200,
                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Navigasi ke halaman janji temu
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => WaktuTemu()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0A535A),
                                          foregroundColor: Colors.white,
                                        ),
                                        child: Text('Buat Janji temu'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dokterAnak.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
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

  Widget buildReview(BuildContext context, String name, String image, double rating, String date, String review) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
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
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  name,
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
                rating: rating,
                size: 20.0,
                color: Color(0xFF095259),
                borderColor: Color(0xFF095259),
              ),
              SizedBox(width: 8.0),
              Text(
                date,
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
              review,
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
    );
  }
}

// class RatingBar extends StatelessWidget {
//   final double rating;
//   final double size;
//   final ValueChanged<double>? onRatingChanged;

//   const RatingBar({
//     Key? key,
//     required this.rating,
//     this.size = 30,
//     this.onRatingChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(5, (index) {
//         return IconButton(
//           onPressed: onRatingChanged != null ? () => onRatingChanged!(index + 1.0) : null,
//           icon: Icon(
//             index < rating ? Icons.star : Icons.star_border,
//             color: Colors.yellow,
//             size: size,
//           ),
//         );
//       }),
//     );
//   }
// }

// class SmoothStarRating extends StatelessWidget {
//   final double rating;
//   final double size;
//   final Color color;
//   final Color borderColor;

//   const SmoothStarRating({
//     Key? key,
//     required this.rating,
//     this.size = 30,
//     this.color = Colors.yellow,
//     this.borderColor = Colors.yellow,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(5, (index) {
//         double ratingValue = index + 1.0;
//         IconData iconData;
//         if (ratingValue <= rating) {
//           iconData = Icons.star;
//         } else if (ratingValue - rating < 1.0) {
//           iconData = Icons.star_half;
//         } else {
//           iconData = Icons.star_border;
//         }
//         return Icon(
//           iconData,
//           color: ratingValue <= rating ? color : borderColor,
//           size: size,
//         );
//       }),
//     );
//   }
// }
