import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  const ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 15,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 15,
                      ),
                      child: Text(
                        description, 
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 15,
                      ),
                      child: Text(
                        "\$${price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
