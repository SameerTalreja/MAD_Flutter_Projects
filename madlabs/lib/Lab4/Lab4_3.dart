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
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text(
            'Lab4 Task3',
            style: TextStyle(fontSize: 25, color: Colors.purple),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // Plain white background
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Text(
              'Hello, World!', // Placeholder text
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            Padding(
                padding: const EdgeInsets.all(10.5),
                child: Column(children: <Widget>[
                  Icon(Icons.snowmobile, size: 250, color: Colors.blue),
                  Icon(Icons.share, size: 250, color: Colors.red),
                  Icon(Icons.star, size: 250, color: Colors.yellow),
                  Icon(Icons.wallet, size: 250, color: Colors.deepOrange),
                  Icon(Icons.mobile_off, size: 250, color: Colors.green),
                  Icon(Icons.watch, size: 250, color: Colors.purple),
                ]))
          ]),
        ),
      ),
    );
  }
}
