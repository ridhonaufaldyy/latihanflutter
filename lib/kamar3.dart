// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kamar 3',
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
//     Widget currentPage;
//     switch (_selectedIndex) {
//       case 0:
//         currentPage = Kamar3Screen();
//         break;
//       case 1:
//         currentPage = SearchScreen();
//         break;
//       case 2:
//         currentPage = ProfileScreen();
//         break;
//       default:
//         currentPage = Kamar3Screen();
//     }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: currentPage,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.medical_services_outlined),
//             label: 'Obat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: const Color.fromARGB(255, 226, 243, 33),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class Kamar3Screen extends StatelessWidget {
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
//                     'Kamar 3',
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
//                               imagePath: "assets/images/fullbpjs_1.jpg",
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildImageWithText(
//                         context,
//                         "assets/images/fullbpjs_1.jpg",
//                         "Bougenville",
//                         "4 kamar",
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailScreen(
//                               imagePath: "assets/images/fullbpjs_2.jpg",
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildImageWithText(
//                         context,
//                         "assets/images/fullbpjs_2.jpg",
//                         "Kenanga",
//                         "3 kamar",
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailScreen(
//                               imagePath: "assets/images/fullbpjs_3.jpg",
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildImageWithText(
//                         context,
//                         "assets/images/fullbpjs_3.jpg",
//                         "Lavender",
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
//             borderRadius: BorderRadius.circular(8.0),
//             color: Colors.black.withOpacity(0.5),
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

// Widget buildStack(String text, IconData iconData, double iconSize) {
//   return Container(
//     margin: EdgeInsets.all(5.0),
//     decoration: BoxDecoration(
//       color: Color(0xFF095259),
//       borderRadius: BorderRadius.circular(10),
//       boxShadow: [
//         BoxShadow(
//           color: Color(0x3F000000),
//           blurRadius: 4,
//           offset: Offset(0, 4),
//           spreadRadius: 0,
//         ),
//       ],
//     ),
//     child: Stack(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: Icon(
//             iconData,
//             color: Colors.white,
//             size: iconSize,
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 10,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
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

class Kamar3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamar 3'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman Kamar 3',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
