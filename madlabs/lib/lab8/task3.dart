import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product(this.name, this.price, this.imageUrl);
}

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}

class ProductListPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  ProductListPage({Key? key}) : super(key: key);

  final List<Product> products = [
    Product('Apple', 1.5,
        'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg'),
    Product('Banana', 0.8,
        'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg'),
    Product('Orange', 1.2,
        'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg'),
    Product('Grapes', 2.0,
        'https://upload.wikimedia.org/wikipedia/commons/3/36/Kyoho-grape.jpg'),
    Product('Laptop', 1200.0,
        'https://upload.wikimedia.org/wikipedia/commons/3/3a/Modern-Laptop.jpg'),
    Product('Smartphone', 800.0,
        'https://upload.wikimedia.org/wikipedia/commons/3/3e/Smartphone.jpg'),
    Product('Headphones', 150.0,
        'https://upload.wikimedia.org/wikipedia/commons/4/4e/Headphones.jpg'),
    Product('Smartwatch', 200.0,
        'https://upload.wikimedia.org/wikipedia/commons/3/3e/Smartwatch.jpg'),
    Product('T-shirt', 20.0,
        'https://upload.wikimedia.org/wikipedia/commons/8/8e/T-shirt.jpg'),
    Product('Shoes', 50.0,
        'https://upload.wikimedia.org/wikipedia/commons/8/88/Shoes.jpg'),
    Product('Backpack', 40.0,
        'https://upload.wikimedia.org/wikipedia/commons/3/3e/Backpack.jpg'),
    Product('Book', 15.0,
        'https://upload.wikimedia.org/wikipedia/commons/1/1d/Book.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartPage(), transition: Transition.rightToLeft);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            cartController.addToCart(product);
                          },
                          child: Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Text(
              'Your cart is empty.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: ListTile(
                      leading: Image.network(
                        product.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          cartController.removeFromCart(product);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${cartController.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  'Order Placed',
                  'Your order has been placed successfully!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.teal,
                  colorText: Colors.white,
                );
              },
              child: Text('Checkout'),
            ),
          ],
        );
      }),
    );
  }
}
