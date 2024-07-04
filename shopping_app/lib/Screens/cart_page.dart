import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Remove Product',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            content: const Text(
                                'Are you sure you want to remove the product from the cart?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeFromCart(item);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.red),
                                  ))
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          }),
    );
  }
}
