import 'package:flutter/material.dart';

void main() {
  runApp(Task1App());
}

class Task1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // Properties for AnimatedContainer
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  double _borderRadius = 10;

  // Property for AnimatedOpacity
  bool _isTextVisible = true;

  void _changeContainerProperties() {
    setState(() {
      // Toggle size, color, and border radius
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius = _borderRadius == 10 ? 50 : 10;
    });
  }

  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1: Simple Animations'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeContainerProperties,
              child: Text('Animate Container'),
            ),
            SizedBox(height: 40),

            // AnimatedOpacity
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _isTextVisible ? 1.0 : 0.0,
              child: Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleTextVisibility,
              child: Text('Toggle Text Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
