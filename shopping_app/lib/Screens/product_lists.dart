import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Providers/product_provider.dart';
import 'package:shopping_app/Screens/ProductsDetail.dart';
import 'package:shopping_app/Screens/widgets/product_item_card.dart';

class ProductLists extends StatefulWidget {
  const ProductLists({super.key});

  @override
  State<ProductLists> createState() => _ProductListsState();
}

class _ProductListsState extends State<ProductLists> {
  final filters = const ['all', "Adidas", "Nike", "Yeezy", "New Balance"];
  late var _selected;

  @override
  void initState() {
    _selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Shoes \nCollection',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]!),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onChanged: (value) {
                      productProvider.setSearchQuery(value);
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = filters[index];
                          });
                        },
                        child: Chip(
                          backgroundColor: _selected == filters[index]
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          side: const BorderSide(
                              color: Color.fromARGB(255, 236, 235, 235)),
                          label: Text(
                            filters[index],
                          ),
                          labelStyle: const TextStyle(fontSize: 16),
                          padding: const EdgeInsets.all(15),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(27),
                                  right: Radius.circular(27))),
                        ),
                      ),
                    );
                  })),
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, provider, child) {
                final products = provider.Products;
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetail(product: products[index])));
                        },
                        child: ProductItemCard(
                          title: products[index]['title'] as String,
                          price: products[index]['price'] as double,
                          image: products[index]['image'] as String,
                          company: products[index]['company'] as String,
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
