import 'package:flutter/material.dart';
import 'MyBotNavBar.dart';
import 'invoicePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjualan Obat-obatan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicineSalesPage(
        userId: 1, // Contoh userId
        token: 'your_token', // Contoh token
      ),
    );
  }
}

class MedicineSalesPage extends StatefulWidget {
  final int userId;
  final String token;

  MedicineSalesPage({
    required this.userId,
    required this.token,
  });

  @override
  _MedicineSalesPageState createState() => _MedicineSalesPageState();
}

class _MedicineSalesPageState extends State<MedicineSalesPage> {
  int _selectedIndex = 0;
  int _totalPrice = 0;
  List<String> _orderedMedicines = [];

  void _addToCart(int price, String medicineName) {
    setState(() {
      _totalPrice += price;
      _orderedMedicines.add(medicineName);
    });
  }

  void _placeOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(
          orderedMedicines: _orderedMedicines,
          totalPrice: _totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjualan Obat-obatan'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            MedicineItem(
              name: 'Obat A',
              price: 5000,
              addToCart: _addToCart,
            ),
            MedicineItem(
              name: 'Obat B',
              price: 8000,
              addToCart: _addToCart,
            ),
            MedicineItem(
              name: 'Obat C',
              price: 12000,
              addToCart: _addToCart,
            ),
            MedicineItem(
              name: 'Obat D',
              price: 20000,
              addToCart: _addToCart,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _placeOrder,
              child: Text('Pesan'),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromRGBO(117, 158, 161, 1),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(10),
              color: Color.fromRGBO(117, 158, 161, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invoice Pesanan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Obat yang Dipesan:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _orderedMedicines.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        _orderedMedicines[index],
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Total Harga: $_totalPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
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
        userId: widget.userId,
        token: widget.token,
      ),
    );
  }
}

class MedicineItem extends StatelessWidget {
  final String name;
  final int price;
  final Function(int, String) addToCart;

  const MedicineItem({
    Key? key,
    required this.name,
    required this.price,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(name),
        subtitle: Text('Harga: $price'),
        trailing: ElevatedButton(
          onPressed: () => addToCart(price, name),
          child: Text('Tambah ke Keranjang'),
        ),
      ),
    );
  }
}
