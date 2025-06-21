import 'package:flutter/material.dart';

void main() => runApp(MyTimerApp());

class MyTimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerHome(),
    );
  }
}

class TimerHome extends StatefulWidget {
  @override
  _TimerHomeState createState() => _TimerHomeState();
}

class _TimerHomeState extends State<TimerHome> {
  int _initialTime = 10;
  int _timeRemaining = 10;
  bool _isRunning = false;
  bool _stopRequested = false;

  void _startTimer() async {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
      _stopRequested = false;
    });

    while (_timeRemaining > 0 && !_stopRequested) {
      await Future.delayed(Duration(seconds: 1));
      if (_stopRequested) break;
      setState(() => _timeRemaining--);
    }

    setState(() => _isRunning = false);
  }

  void _stopTimer() {
    setState(() {
      _stopRequested = true;
      _isRunning = false;
    });
  }

  void _restartTimer() {
    setState(() {
      _timeRemaining = _initialTime;
      _stopRequested = true;
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer with Stop & Restart')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_timeRemaining',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text('Start'),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: _stopTimer,
              child: Text('Stop'),
            ),
              SizedBox(height:20),
            ElevatedButton(
              onPressed: _restartTimer,
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
