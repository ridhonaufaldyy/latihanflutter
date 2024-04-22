// import 'package:flutter/material.dart';
// import 'MyBotNavBar.dart'; // Import MyBottomNavigationBar

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kamar 1',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: DashboardScreen(),
//     );
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: _selectedIndex == 0 ? Kamar1Screen() : Container(), // Change currentPage to display Kamar1Screen only
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }

// class Kamar1Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/background.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 50.0),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back_ios_new_rounded),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   SizedBox(width: 80.0),
//                   Text(
//                     'Kamar 1',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 23,
//                       fontFamily: 'Kadwa',
//                       fontWeight: FontWeight.w700,
//                       height: 0.05,
//                       letterSpacing: -0.08,
//                     ),
//                   ),
//                   SizedBox(width: MediaQuery.of(context).size.width * 0.3),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailScreen(
//                               imagePath: "assets/images/kelas1,1.png",
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildImageWithText(
//                         context,
//                         "assets/images/kelas1,1.png",
//                         "Melati",
//                         "2 kamar",
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailScreen(
//                               imagePath: "assets/images/kelas1,2.png",
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildImageWithText(
//                         context,
//                         "assets/images/kelas1,2.png",
//                         "Mawar",
//                         "2 kamar",
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailScreen(
//                               imagePath: "assets/images/kelas1,3.png",
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildImageWithText(
//                         context,
//                         "assets/images/kelas1,3.png",
//                         "Raflesia",
//                         "1 kamar",
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildImageWithText(BuildContext context, String imagePath,
//       String textAbove, String textBelow) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.2,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               color: Colors.black.withOpacity(0.5),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 10.0,
//           left: 10.0,
//           child: Text(
//             textAbove,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20.0,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 10.0,
//           right: 10.0,
//           child: Text(
//             textBelow,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   final String imagePath;

//   DetailScreen({required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Kamar'),
//       ),
//       body: Center(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.5,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Ini adalah Halaman Search',
//         style: TextStyle(fontSize: 24.0),
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Ini adalah Halaman Profile',
//         style: TextStyle(fontSize: 24.0),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Kamar1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamar 1'),
      ),
      body: Center(
        child: Text(
'tes',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
