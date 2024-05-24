import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double circleAv = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: CircleAvatar(
                backgroundColor:  Colors.blueAccent,
                maxRadius: circleAv,
                child: Text("Success", style: TextStyle(
                  color: Colors.white, 
                  fontSize: 36,
                  fontWeight: FontWeight.w600
                ),),
              ),
            ),
            // Text(
            //   'Success',
            //   style: Theme.of(context).textTheme.headline6,
            // ),
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
