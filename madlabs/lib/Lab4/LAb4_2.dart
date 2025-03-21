import 'package:flutter/material.dart';

void main() {
  runApp(Myhome());
}

class Myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 4),
            child: Text(
              'Lab4 Task2',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                Text(
                  'Welcome to the App!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Icon Row Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.account_balance_wallet,
                            size: 50, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Wallet'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.attach_money, size: 50, color: Colors.green),
                        SizedBox(height: 5),
                        Text('Money'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.credit_card, size: 50, color: Colors.purple),
                        SizedBox(height: 5),
                        Text('Card'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.add_circle, size: 50, color: Colors.orange),
                        SizedBox(height: 5),
                        Text('Top Up'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Bar Chart Section (Mocked with Containers)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(height: 100, width: 20, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Mon'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(height: 80, width: 20, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Tue'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(height: 120, width: 20, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Wed'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(height: 60, width: 20, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Thu'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(height: 90, width: 20, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Fri'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Toggle Buttons Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'CLICK HERE',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'MORE INFO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Option Cards Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Option A
                    Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock, size: 40, color: Colors.purple),
                          SizedBox(height: 5),
                          Text(
                            'OPTION A',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Lock',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    // Option B
                    Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, size: 40, color: Colors.purple),
                          SizedBox(height: 5),
                          Text(
                            'OPTION B',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Star',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    // Option C
                    Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, size: 40, color: Colors.purple),
                          SizedBox(height: 5),
                          Text(
                            'OPTION C',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
