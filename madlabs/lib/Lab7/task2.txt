import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() => runApp(MyApiApp());

class MyApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostFetcher(),
    );
  }
}

class PostFetcher extends StatefulWidget {
  @override
  _PostFetcherState createState() => _PostFetcherState();
}

class _PostFetcherState extends State<PostFetcher> {
  Map<String, dynamic>? _post;
  bool _isLoading = false;

  Future<void> _fetchPost() async {
    setState(() => _isLoading = true);
    final randomId = Random().nextInt(100) + 1; // Posts 1–100 available
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$randomId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _post = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      setState(() {
        _post = {'title': 'Error', 'body': 'Failed to load post.'};
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPost(); // Fetch on startup
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Post Viewer')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _post == null
                ? Text('No post loaded yet.')
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _post!['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(_post!['body']),
                      ],
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchPost,
        child: Icon(Icons.refresh),
        tooltip: 'Fetch Another Post',
      ),
    );
  }
}

