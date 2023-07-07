import 'package:flutter/material.dart';
import 'package:onlinestore/features/home/services/product_service.dart';
import 'package:onlinestore/features/home/widgets/product_cards.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the screen is initialized
    Provider.of<ProductService>(context, listen: false).fetchProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined),
        title: const Text('Online Store'),
        backgroundColor: Colors.teal[300],
      ),
      body: Consumer<ProductService>(
        builder: (context, productService, _) {
          if (productService.products.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal[300],
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                ),
                itemCount: productService.products.length,
                itemBuilder: (context, index) {
                  final product = productService.products[index];
                  return ProductCard(
                    image: product.image,
                    title: product.title,
                    price: product.price,
                    rating: product.rating.count,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
