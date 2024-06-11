import 'package:flutter/material.dart';
import 'package:latihanflutter/MyBotNavBar.dart';

// class SuccessScreen extends StatelessWidget {
//   const SuccessScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double circleAv = MediaQuery.of(context).size.width * 0.4;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: CircleAvatar(
//                 backgroundColor: Colors.blueAccent,
//                 maxRadius: circleAv,
//                 child: Icon(
//                   Icons.check,
//                   size: 150,
//                   color: Colors.greenAccent,
//                 ),
//                 // Column(
//                 //   children: [
//                 //     Icon(Icons.fork_right,),
//                 //     Text("Pembayaran Berhasil", style: TextStyle(
//                 //       color: Colors.white,
//                 //       fontSize: 22,
//                 //       fontWeight: FontWeight.w600
//                 //     ),),
//                 //   ],
//                 // ),
//               ),
//             ),
//             // Text(
//             //   'Success',
//             //   style: Theme.of(context).textTheme.headline6,
//             // ),
//             SizedBox(height: 20),
//             Container(
//               child: Padding(
//                 padding: EdgeInsets.all(
//                   12,
//                 ),
//                 child: Text(
//                   "Pembayaran Berhasil",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Back'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/sukses.png',
                height: 200, // Sesuaikan dengan ukuran gambar
              ),
              SizedBox(height: 20),
              Text(
                'Pembayaran Berhasil',
                style: TextStyle(
                  fontSize: 28, // Ukuran teks sedikit besar
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Data pembayaran sudah berhasil diproses',
                style: TextStyle(
                  fontSize: 16, // Ukuran teks kecil
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     // Ganti dengan navigasi ke halaman yang sesuai
              //   },
              //   child: Text('Lihat Antrian'), // Ubah teks tombol
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
