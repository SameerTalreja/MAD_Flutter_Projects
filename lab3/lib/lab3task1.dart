import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Lab',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Lab'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display a local image at the top
            Image.network(
              'https://www.google.com/imgres?q=Nust%20nbc%20image&imgurl=https%3A%2F%2Fnbc.nust.edu.pk%2Fwp-content%2Fuploads%2F2023%2F05%2Fadm-block-scaled.jpg&imgrefurl=https%3A%2F%2Fnbc.nust.edu.pk%2Fabout-us%2F&docid=YMCRc6FTVxwG_M&tbnid=feYXYe9DSYnNTM&vet=12ahUKEwiDp5jsn4yMAxWNgP0HHWrAIlgQM3oECBUQAA..i&w=2560&h=796&hcb=2&ved=2ahUKEwiDp5jsn4yMAxWNgP0HHWrAIlgQM3oECBUQAA',
              height: 150,
            ),
            SizedBox(
                height: 20), // Add some space between the image and the row
            // Row with icons and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Icon(Icons.favorite, color: Colors.black, size: 50),
                    SizedBox(height: 5), // Space between icon and text
                    Text('Favorite', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(width: 20), // Add space between items in the row
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.blue, size: 50),
                    SizedBox(height: 5), // Space between icon and text
                    Text('Share', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Add space between the row and the button
            // Elevated button at the bottom
            ElevatedButton(
              onPressed: () {
                // Action when button is pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello!')),
                );
              },
              child: Text('Press Me'),
            ),
            SizedBox(height: 20), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
