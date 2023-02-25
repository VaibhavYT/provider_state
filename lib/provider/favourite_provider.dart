import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(value) {
    _selectedItem.remove(value);
    notifyListeners();
  }
}
