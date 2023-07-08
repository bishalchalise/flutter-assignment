import 'package:flutter/material.dart';
import 'package:onlinestore/features/product_details/screen/product_details_screen.dart';
import 'package:onlinestore/features/search/screen/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ProductDetailsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const ProductDetailsScreen());
    case SearchResultsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SearchResultsScreen());

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Text("The Screen Doesn't Exists"),
        ),
      );
  }
}
