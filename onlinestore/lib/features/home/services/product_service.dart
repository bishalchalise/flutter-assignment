import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestore/models/product.dart';
import 'dart:convert';

class ProductService with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      final List<dynamic> responseData = jsonDecode(response.body);
      _products = responseData
          .map((data) => Product.fromJson(data))
          .toList()
          .cast<Product>();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
    notifyListeners();
  }
}
