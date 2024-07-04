import 'package:flutter/material.dart';
import 'package:shopping_app/dummyData.dart';

class ProductProvider with ChangeNotifier {
  final _products = products;

  String _searchQuery = '';

  List<Map<String, dynamic>> get Products {
    if (_searchQuery.isEmpty) {
      return _products;
    } else {
      return _products
          .where((product) => (product['title'] as String)
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
