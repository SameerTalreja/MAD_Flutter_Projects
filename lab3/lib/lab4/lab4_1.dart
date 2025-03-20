import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhiteScreen(),
    );
  }
}

class WhiteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Plain white background
      body: Center(
        child: Text(
          'Hello, World!', // Placeholder text
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
