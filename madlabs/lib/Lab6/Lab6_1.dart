import 'package:flutter/material.dart';

void main() {
  runApp(Lab6App());
}

class Lab6App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveGridScreen(),
    );
  }
}

class ResponsiveGridScreen extends StatelessWidget {
  // List of valid network image URLs
  final List<String> imageUrls = [
    'https://via.placeholder.com/150/FF0000', // Red
    'https://via.placeholder.com/150/00FF00', // Green
    'https://via.placeholder.com/150/0000FF', // Blue
    'https://via.placeholder.com/150/FFFF00', // Yellow
    'https://via.placeholder.com/150/FF00FF', // Magenta
    'https://via.placeholder.com/150/00FFFF', // Cyan
    'https://via.placeholder.com/150/000000', // Black
    'https://via.placeholder.com/150/FFFFFF', // White
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the number of columns based on screen width
    final crossAxisCount = screenWidth > 600 ? 4 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid Layout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Number of columns
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.error, color: Colors.red, size: 50),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
