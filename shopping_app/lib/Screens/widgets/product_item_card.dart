import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/ProductsDetail.dart';

class ProductItemCard extends StatelessWidget {
  final title;
  final price;
  final company;
  final image;
  const ProductItemCard(
      {super.key,
      required this.title,
      required this.price,
      required this.company,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Card(
        margin: const EdgeInsets.all(20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
              Center(
                child: Image.asset(
                  image,
                  height: 175,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
