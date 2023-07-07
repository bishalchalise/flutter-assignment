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
        title: const Text('Product App'),
      ),
      body: Consumer<ProductService>(
        builder: (context, productService, _) {
          if (productService.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3,
              ),
              itemCount: productService.products.length,
              itemBuilder: (context, index) {
                final product = productService.products[index];
                return ProductCard(
                  image: product.image,
                  title: product.title,
                  description: product.description,
                  price: product.price,
                );
              },
            );
          }
        },
      ),
    );
  }
}
