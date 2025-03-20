import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Container'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.purple,
              Colors.pink,
              const Color.fromARGB(255, 4, 61, 107),
              Colors.black
            ])
                //borderRadius: BorderRadius.circular(12)
                ),
            child: Text("Hello Pakistan"),
          ),
        ));
  }
}
