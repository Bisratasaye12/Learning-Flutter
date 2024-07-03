import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              product['title'],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(product['image']),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 239, 241, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                product['price'].toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        ));
  }
}
