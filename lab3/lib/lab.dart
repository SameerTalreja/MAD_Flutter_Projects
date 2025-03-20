/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Inventory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Inventory')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((product) {
              return ListTile(
                title: Text(product['name']),
                subtitle: Text("Price: \$${product['price']}"),
                trailing: Text("Stock: ${product['stock']}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProductPage(product)));
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProductPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddProductPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  void addProduct() {
    FirebaseFirestore.instance.collection('products').add({
      'name': nameController.text,
      'price': double.parse(priceController.text),
      'stock': int.parse(stockController.text),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: stockController,
              decoration: InputDecoration(labelText: 'Stock'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addProduct();
                Navigator.pop(context);
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProductPage extends StatelessWidget {
  final DocumentSnapshot product;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController stockController;

  EditProductPage(this.product)
      : nameController = TextEditingController(text: product['name']),
        priceController =
        TextEditingController(text: product['price'].toString()),
        stockController =
        TextEditingController(text: product['stock'].toString());

  void updateProduct() {
    FirebaseFirestore.instance.collection('products').doc(product.id).update({
      'name': nameController.text,
      'price': double.parse(priceController.text),
      'stock': int.parse(stockController.text),
    });
  }

  void deleteProduct() {
    FirebaseFirestore.instance.collection('products').doc(product.id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: stockController,
              decoration: InputDecoration(labelText: 'Stock'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProduct();
                Navigator.pop(context);
              },
              child: Text('Update Product'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteProduct();
                Navigator.pop(context);
              },
              child: Text('Delete Product'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
*/
