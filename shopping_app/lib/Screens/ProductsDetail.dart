import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Providers/cart_provider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var _selected = 0;

  @override
  void initState() {
    _selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    void onTap() {
      if (_selected != 0) {
        Provider.of<CartProvider>(context, listen: false).addToCart({
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'size': _selected,
          'company': widget.product['company'],
          'image': widget.product['image']
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Product added to Cart')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Please select a size!')));
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Details'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Text(
                widget.product['title'],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(widget.product['image']),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 230,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(237, 239, 241, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.product['sizes'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selected = widget.product['sizes'][index];
                                  });
                                },
                                child: Chip(
                                    backgroundColor: _selected ==
                                            widget.product['sizes'][index]
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    label: Text(widget.product['sizes'][index]
                                        .toString())),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
