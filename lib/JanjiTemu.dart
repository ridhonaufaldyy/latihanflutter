import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'RatingDokter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janji Temu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JanjiTemu(),
    );
  }
}

class JanjiTemu extends StatefulWidget {
  @override
  _JanjiTemuState createState() => _JanjiTemuState();
}

class _JanjiTemuState extends State<JanjiTemu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Janji Temu Dokter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari dokter...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Placeholder for doctor data, replace with actual data
                  DoctorData(
                    profileImage: 'assets/strawberry.jpg',
                    name: 'dr. Gavi Pablo',
                    profession: 'Dokter Anak',
                    rating: 4.5,
                    price: 'Rp 500.000',
                    onBookAppointment: () {
                      // Handle booking appointment
                    },
                  ),
                  // Add more DoctorData widgets for other doctors
                ],
              ),
            ),
          ),
        ],
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

class DoctorData extends StatelessWidget {
  final String profileImage;
  final String name;
  final String profession;
  final double rating;
  final String price;
  final VoidCallback? onBookAppointment;

  const DoctorData({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.profession,
    required this.rating,
    required this.price,
    this.onBookAppointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(profileImage),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(profession),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text(rating.toString()),
              SizedBox(width: 20),
              Text(price),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman rating dokter
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RatingDokter()),
                  );
                },
                child: Text('Buat Janji'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoctorSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build search results based on query
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as the user types
    final List<String> suggestions = ['Dr. John Doe', 'Dr. Sarah Tan', 'Dr. Mark Johnson']; // Example suggestions
    final List<String> filteredSuggestions = query.isEmpty
        ? suggestions
        : suggestions.where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            close(context, filteredSuggestions[index]);
          },
        );
      },
    );
  }
}
