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
        backgroundColor: Colors.amberAccent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text(
            'Lab4 Task1',
            style: TextStyle(fontSize: 25, color: Colors.purple),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // Plain white background
      body: Center(
        child: Column(children: <Widget>[
          Text(
            'Hello, World!', // Placeholder text
            style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.w700,
                backgroundColor: Colors.grey),
          ),
          Padding(
              padding: const EdgeInsets.all(10.5),
              child: Column(children: <Widget>[
                Icon(Icons.share_arrival_time, size: 250, color: Colors.blue),
                Icon(Icons.directions_car, size: 250, color: Colors.deepOrange),
              ]))
        ]),
      ),

      floatingActionButton: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 650),
        child: FloatingActionButton(
          onPressed: () {},
          child: Center(
              child: Text(
            'Press ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.purple),
          )),
          backgroundColor: const Color.fromARGB(255, 136, 215, 227),
        ),
      )),
    );
  }
}
