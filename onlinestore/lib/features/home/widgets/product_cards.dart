import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String rating;
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    rating,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3,),
            Text(
              "Price: \$${price.toStringAsFixed(2)}",
              maxLines: 2,
              style: const TextStyle(
                color: Colors.red,
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
