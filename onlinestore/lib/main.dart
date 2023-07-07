import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/home/screens/home_page.dart';
import 'features/home/services/product_service.dart';

void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductService(),
      child: MaterialApp(
        title: 'Product App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
