import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              product['title'],
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ));
  }
}
