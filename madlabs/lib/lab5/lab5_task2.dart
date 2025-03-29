import 'package:flutter/material.dart';

void main() {
  runApp(Task2App());
}

class Task2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationExample(),
    );
  }
}

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Define a Tween to animate from 0 to 300 (left to right)
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  void _startAnimation() {
    setState(() {
      if (_controller.isAnimating) {
        _controller.stop(); // Stop the animation if it's running
      } else if (_controller.status == AnimationStatus.completed) {
        _controller.reverse(); // Reverse the animation if it's completed
      } else {
        _controller.forward(); // Start the animation
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 2: Explicit Animations'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedBuilder to update the position of the container
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0), // Move horizontally
                  child: child,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _startAnimation,
              child: Text(
                _controller.isAnimating
                    ? 'Stop Animation'
                    : (_controller.status == AnimationStatus.completed
                        ? 'Reverse Animation'
                        : 'Start Animation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
