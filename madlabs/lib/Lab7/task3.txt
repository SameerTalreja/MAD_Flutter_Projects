import 'package:flutter/material.dart';

void main() => runApp(MyDatabaseApp());

class MyDatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocalDatabaseSimulator(),
    );
  }
}

class LocalDatabaseSimulator extends StatefulWidget {
  @override
  _LocalDatabaseSimulatorState createState() => _LocalDatabaseSimulatorState();
}

class _LocalDatabaseSimulatorState extends State<LocalDatabaseSimulator> {
  List<String>? _data;
  bool _isLoading = true;

  Future<void> _fetchLocalData() async {
    // Simulate a delayed database response
    await Future.delayed(Duration(seconds: 2));
    List<String> fetchedData = [
      'Item A',
      'Item B',
      'Item C',
      'Item D',
      'Item E',
    ];

    setState(() {
      _data = fetchedData;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local DB Query (Simulated)')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: _data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_data![index]),
                  );
                },
              ),
      ),
    );
  }
}

