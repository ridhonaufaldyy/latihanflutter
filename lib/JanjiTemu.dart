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
        primarySwatch: Colors.teal,
      ),
      home: JanjiTemu(),
    );
  }
}

class JanjiTemu extends StatefulWidget {
  const JanjiTemu({Key? key}) : super(key: key);

  @override
  _JanjiTemuState createState() => _JanjiTemuState();
}

class _JanjiTemuState extends State<JanjiTemu> {
  int _selectedIndex = 0;
  KategoriDokter? _selectedCategory;

  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  void _onCategorySelected(KategoriDokter category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Janji Temu Dokter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Cari dokter...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _KategoriDokter(onCategorySelected: _onCategorySelected),
            SizedBox(height: 24.0),
            _buildPilihDokter(),
            SizedBox(height: 24.0),
          ],
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

  // Fungsi untuk membangun widget Pilih Dokter dengan kategori yang dipilih
  Widget _buildPilihDokter() {
    final List<Dokter> filteredDoctors = Dokter.sampleDoctors
        .where((doctor) =>
            (_selectedCategory == null ||
                doctor.category == _selectedCategory) &&
            (doctor.category.name
                    .toLowerCase()
                    .contains(_searchText.toLowerCase()) ||
                doctor.name.toLowerCase().contains(_searchText.toLowerCase())))
        .toList();

    return Column(
      children: [
        SectionTitle(
          title: 'Pilih Dokter',
          action: 'See all',
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              height: 24.0,
              color: Colors.teal,
            );
          },
          itemCount: filteredDoctors.length,
          itemBuilder: (context, index) {
            final doctor = filteredDoctors[index];
            return DoctorListTile(doctor: doctor);
          },
        ),
      ],
    );
  }
}

class DoctorListTile extends StatelessWidget {
  const DoctorListTile({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  final Dokter doctor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30.0,
        backgroundColor: colorScheme.background,
        backgroundImage: AssetImage(doctor.profileImage),
      ),
      title: Text(
        doctor.name,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctor.category.name,
            style: textTheme.bodyMedium!.copyWith(
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Color(0xFF095259),
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                doctor.rating.toString(),
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                doctor.price,
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RatingDokter(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0A535A),
        ),
        child: const Text(
          'Buat Janji',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _KategoriDokter extends StatelessWidget {
  final Function(KategoriDokter) onCategorySelected;

  const _KategoriDokter({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Kategori',
          action: 'See all',
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: KategoriDokter.values
              .take(5)
              .map(
                (category) => Expanded(
                  child: GestureDetector(
                    onTap: () => onCategorySelected(category),
                    child: TextLabel(
                      label: category.name,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.action,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String? action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        if (action != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              action!,
              style: textTheme.bodyMedium!.copyWith(
                decoration: TextDecoration.underline,
                color: colorScheme.secondary,
              ),
          ),
        ),
      ],
    );
  }
}

class TextLabel extends StatelessWidget {
  const TextLabel({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Definisi kelas Dokter
class Dokter {
  final String name;
  final String profileImage;
  final KategoriDokter category;
  final double rating;
  final String price;

  Dokter({
    required this.name,
    required this.profileImage,
    required this.category,
    required this.rating,
    required this.price,
  });

  static List<Dokter> sampleDoctors = [
    Dokter(
      name: "Dr. Felix Firyanto Widjaja, Sp.PD",
      profileImage: 'assets/dokterUmum.png',
      category: KategoriDokter.dokterUmum,
      rating: 3.5,
      price: "Rp. 40.000",
    ),
    Dokter(
      name: "Dr. Afriyan Wahyudhi, Sp.A, M.Kes",
      profileImage: 'assets/dokterAnak.png',
      category: KategoriDokter.dokterAnak,
      rating: 4.5,
      price: "Rp. 50.000",
    ),
    Dokter(
      name: "Drg. Sylviana Hardanti",
      profileImage: 'assets/dokterGigi.png',
      category: KategoriDokter.dokterGigi,
      rating: 4.0,
      price: "Rp. 65.000",
    ),
    // Tambahkan dokter lainnya di sini
  ];
}

// Definisi enum KategoriDokter
enum KategoriDokter {
  dokterUmum,
  dokterAnak,
  dokterKandungan,
  dokterGigi,
  dokterMata,
  // Tambahkan kategori lainnya di sini
}

extension KategoriDokterExtension on KategoriDokter {
  String get name {
    switch (this) {
      case KategoriDokter.dokterUmum:
        return "Dokter Umum";
      case KategoriDokter.dokterAnak:
        return "Dokter Anak";
      case KategoriDokter.dokterKandungan:
        return "Dokter Kandungan";
      case KategoriDokter.dokterGigi:
        return "Dokter Gigi";
      case KategoriDokter.dokterMata:
        return "Dokter Mata";
      // Tambahkan kasus untuk kategori lainnya di sini
      default:
        return "";
    }
  }
}
