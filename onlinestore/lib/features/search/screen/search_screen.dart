import 'package:flutter/material.dart';
import 'package:onlinestore/features/home/widgets/product_cards.dart';
import 'package:onlinestore/features/product_details/screen/product_details_screen.dart';
import 'package:onlinestore/models/product.dart';

class SearchResultsScreen extends StatelessWidget {
  static const routeName = '/search-result';

  const SearchResultsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<Product>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: const Text("Search Result"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              final screenSize = MediaQuery.of(context).size.width;
              int crossAxisCount;

              if (screenSize < 300) {
                crossAxisCount = 1;
              } else if (screenSize >= 300 && screenSize < 1000) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 4;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: crossAxisCount,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProductDetailsScreen.routeName,
                        arguments: product,
                      );
                    },
                    child: ProductCard(
                      image: product.image,
                      title: product.title,
                      price: product.price,
                      rating: product.rating.rate.toString(),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
