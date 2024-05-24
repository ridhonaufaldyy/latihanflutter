import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double circleAv = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                maxRadius: circleAv,
                child: Icon(
                  Icons.check,
                  size: 150,
                  color: Colors.greenAccent,
                ),
                // Column(
                //   children: [
                //     Icon(Icons.fork_right,),
                //     Text("Pembayaran Berhasil", style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 22,
                //       fontWeight: FontWeight.w600
                //     ),),
                //   ],
                // ),
              ),
            ),
            // Text(
            //   'Success',
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            SizedBox(height: 20),
            Container(
              child: Padding(
                padding: EdgeInsets.all(
                  12,
                ),
                child: Text(
                  "Pembayaran Berhasil",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
