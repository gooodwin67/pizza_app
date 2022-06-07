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
  List _activeCategory = [1];
  List get activeCategory => _activeCategory;

  setActive(index) {
    listCategories.forEach((e) => e.active = false);
    listCategories[index].active = true;
    index < listCategories.length - 2
        ? activeCategory[0] = index
        : activeCategory[0] = 0;
    notifyListeners();
  }

  final List _listProducts = [
    [],
    [
      ListProducts(
          key: 1,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/pepperoni.jpg',
          name: 'Пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 399.00),
      ListProducts(
          key: 2,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/foursesons.jpg',
          name: '4 Сезона',
          ingridients: [
            'моцарелла',
            'ветчина',
            'пикантная пепперони',
            'брынза',
            'томаты',
            'шампиньоны',
            'итальянские травы',
            'томатный соус'
          ],
          price: 579.00),
      ListProducts(
          key: 3,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/double_pepperoni.jpg',
          name: 'Двойная пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 639.00),
      ListProducts(
          key: 4,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/gavai.jpg',
          name: 'Гавайская',
          ingridients: ['ветчина', 'ананасы', 'моцарелла', 'томатный соус'],
          price: 579.00),
      ListProducts(
          key: 5,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/myasnaya.jpg',
          name: 'Мясная',
          ingridients: [
            'цыпленок',
            'ветчина',
            'пикантная пепперони',
            'острая чоризо',
            'моцарелла',
            'томатный соус'
          ],
          price: 429.00),
      ListProducts(
          key: 6,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/double_pepperoni.jpg',
          name: 'Двойная пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 639.00),
      ListProducts(
          key: 7,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          image: 'assets/images/products/double_pepperoni.jpg',
          name: 'Двойная пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 639.00),
    ],
    [
      ListProducts(
          key: 8,
          active: false,
          options1: [],
          image: 'assets/images/products/kalif.jpg',
          name: 'Калифорния',
          ingridients: [
            'Икра Масаго',
            'имитация краба',
            'сливочный сыр',
            'огурец',
            'рис',
            'нори'
          ],
          price: 29.00),
      ListProducts(
          key: 9,
          active: false,
          options1: [],
          image: 'assets/images/products/fil.jpg',
          name: 'Филадельфия Люкс',
          ingridients: [
            'Лосось слабосоленый',
            'икра масаго',
            'огурец',
            'сливочный сыр',
            'рис',
            'нори'
          ],
          price: 43.00),
      ListProducts(
          key: 10,
          active: false,
          options1: [],
          image: 'assets/images/products/bansay.jpg',
          name: 'Бансай',
          ingridients: [
            'Бекон',
            'сливочный сыр',
            'огурец',
            'кунжут',
            'рис',
            'нори'
          ],
          price: 29.00),
      ListProducts(
          key: 11,
          active: false,
          options1: [],
          image: 'assets/images/products/alaska.jpg',
          name: 'Аляска',
          ingridients: [
            'Лосось терияки',
            'сливочный сыр',
            'огурец',
            'кунжут',
            'рис',
            'нори'
          ],
          price: 32.00),
    ],
    [],
    [],
    [],
  ];
  List get listProducts => _listProducts;
  String listToDesc(ingridients) {
    return ingridients.join(', ');
  }

  setActiveProd(a, b) {
    for (int i = 0; i < listProducts.length; i++) {
      for (int j = 0; j < listProducts[i].length; j++) {
        listProducts[i][j].active = false;
      }
    }
    listProducts[a][b].active = true;
    notifyListeners();
  }

  getDescription(ingridients) {
    return ingridients.join(', ')[0].toUpperCase() +
        ingridients.join(', ').substring(1);
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

class ListProducts {
  final int key;
  bool active;
  final List options1;
  final String image;
  final String name;
  final List ingridients;
  final double price;

  ListProducts({
    required this.key,
    required this.active,
    required this.options1,
    required this.image,
    required this.name,
    required this.ingridients,
    required this.price,
  });
}
