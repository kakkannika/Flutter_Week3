
import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/bla_button.dart';

class TestBlaButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Test Primary Button with Icon
            SizedBox(
              width: double.infinity,
              child: BlaButton(
                label: 'Request Chating ',
                icon: Icons.chat_bubble,
                isPrimary: true,
                hasIcon: true,
                color: Colors.blue,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  print('Primary with Icon Pressed');
                },
              ),
            ),
            SizedBox(height: 20),

            // Test Primary Button without Icon
            SizedBox(
              width: double.infinity,
              child: BlaButton(
                label: 'Request Bus',
                icon: Icons.bus_alert,
                isPrimary: true,
                hasIcon: false,
                color: Colors.blue,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  print('Primary without Icon Pressed');
                },
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Test Secondary Button with Icon
            SizedBox(
              width: double.infinity,
              child: BlaButton(
                label: 'Cancel',
                icon: Icons.cancel,
                isPrimary: false,
                hasIcon: true,
                color: Colors.grey,
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  print('Secondary with Icon Pressed');
                },
              ),
            ),
            SizedBox(height: 20),

            // Test Secondary Button without Icon
            SizedBox(
              width: double.infinity,
              child: BlaButton(
                label: 'Cancel',
                icon: Icons.cancel,
                isPrimary: false,
                hasIcon: false,
                color: Colors.grey,
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  print('Secondary without Icon Pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestBlaButtonScreen(),
    );
  }
}
