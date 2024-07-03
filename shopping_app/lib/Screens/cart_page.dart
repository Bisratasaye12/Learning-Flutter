import 'package:flutter/material.dart';
import 'package:shopping_app/dummyData.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final item = (cart as List)[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(item['image']),
                radius: 40,
              ),
              title: Text(
                item['title'] as String,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text('Size: ${item['size']}'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          }),
    );
  }
}
