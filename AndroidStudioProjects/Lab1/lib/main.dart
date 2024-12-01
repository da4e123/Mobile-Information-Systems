import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Jeans',
      description: 'Blue Jeans',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-vHxIicGk5g94f4Ue5LJ3s3p1WPT8Ou7RQw&s',
      price: 59.99,

    ),
    Product(
      name: 'Sneakers',
      description: 'Nike Air Max Terrascape 90',
      imageUrl: 'data:image/jpeg;base64,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',
      price: 99.99,
    ),
    Product(
      name: 'T-shirt',
      description: 'Black T-shirt',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVUiAXqebFGhhyfNxBFz1QWw9BMxEkrMjckw&s',
      price: 19.99,
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('204005'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount : products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(product : product),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.5),
                    child: Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: Text('\$${product.price}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product{
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            const SizedBox(height: 15),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7.5,),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 15),
            Text(
              product.description,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}








