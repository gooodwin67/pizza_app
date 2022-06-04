import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  final List _listCategories = [
    ListCategories(
        index: 1000,
        active: false,
        text: const Icon(Icons.filter_alt_rounded,
            color: Colors.black, size: 20)),
    ListCategories(
        index: 0,
        active: true,
        text: const Text('Pizza', style: const TextStyle(color: Colors.black))),
    ListCategories(
        index: 1,
        active: false,
        text: const Text('Sushi', style: TextStyle(color: Colors.black))),
    ListCategories(
        index: 2,
        active: false,
        text:
            const Text('Solods', style: const TextStyle(color: Colors.black))),
    ListCategories(
        index: 3,
        active: false,
        text: const Text('Drinks', style: TextStyle(color: Colors.black))),
    ListCategories(
        index: 4,
        active: false,
        text:
            const Text('Snacks', style: const TextStyle(color: Colors.black))),
  ];
  List get listCategories => _listCategories;
  List _activeCategory = [0];
  List get activeCategory => _activeCategory;

  setActive(index) {
    listCategories.forEach((e) => e.active = false);
    listCategories[index].active = true;
    activeCategory[0] = index;
    notifyListeners();
  }
}

class ListCategories {
  var text;
  int index;
  bool active;
  ListCategories(
      {Key? key,
      required this.index,
      required this.active,
      required this.text});
}
