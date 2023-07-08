import 'package:flutter/material.dart';
import 'package:onlinestore/features/home/services/product_service.dart';
import 'package:onlinestore/features/home/widgets/product_cards.dart';
import 'package:onlinestore/features/product_details/screen/product_details_screen.dart';
import 'package:onlinestore/features/search/screen/search_screen.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  void initState() {
    super.initState();
    Provider.of<ProductService>(context, listen: false).fetchProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: const Text("Online Store"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              onSubmitted: (value) {
                final filteredProducts = productService.products
                    .where((product) => product.title
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
                if (filteredProducts.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    SearchResultsScreen.routeName,
                    arguments: filteredProducts,
                  );
                }
              },
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.teal[300],
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ProductService>(
              builder: (context, productService, _) {
                if (productService.products.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal[300],
                    ),
                  );
                } else {
                  final filteredProducts = productService.products
                      .where((product) => product.title
                          .toLowerCase()
                          .contains(_searchText.toLowerCase()))
                      .toList();
                  return SingleChildScrollView(
                    child: LayoutBuilder(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            crossAxisCount: crossAxisCount,
                          ),
                          shrinkWrap: true,
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return GestureDetector(
                              onTap: () {
                                //navigate to product details screen
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
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
