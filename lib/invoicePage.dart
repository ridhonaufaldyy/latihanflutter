import 'package:flutter/material.dart';
import 'home_page.dart';
import 'MyBotNavBar.dart';

class NextPage extends StatefulWidget {
  final List<String> orderedMedicines;
  final int totalPrice;

  const NextPage({
    Key? key,
    required this.orderedMedicines,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  late TextEditingController _addressController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _submitAddress(BuildContext context) {
    // Lakukan logika untuk mengirim alamat atau data yang diperlukan
    // setelah alamat di-submit
    // Kembali ke halaman home menggunakan pushReplacement
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Sesuaikan dengan gambar latar belakang yang Anda inginkan
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pesanan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.orderedMedicines.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(widget.orderedMedicines[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Total Harga: ${widget.totalPrice}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Alamat Pengiriman:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: 'Masukkan alamat pengiriman',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitAddress(context),
                child: Text('Submit'),
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
