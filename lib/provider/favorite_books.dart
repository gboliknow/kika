import 'package:flutter/material.dart';

class FavoriteBooks {
  final String title;
  final String subtitle;
  final String description;
  final String image;

  FavoriteBooks({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });
}

class Cart with ChangeNotifier {
  final List<FavoriteBooks> _items = [];

  List<FavoriteBooks> get items {
    return [..._items];
  }

  void addItem(FavoriteBooks book) {
    _items.add(book);
    notifyListeners();
  }

  void removeItem(FavoriteBooks book) {
    _items.remove(book);
    notifyListeners();
  }
}
