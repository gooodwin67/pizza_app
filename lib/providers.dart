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
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
          image: 'assets/images/products/pepperoni.jpg',
          name: 'Пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 399.00),
      ListProducts(
          key: 2,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
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
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
          image: 'assets/images/products/double_pepperoni.jpg',
          name: 'Двойная пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 639.00),
      ListProducts(
          key: 4,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
          image: 'assets/images/products/gavai.jpg',
          name: 'Гавайская',
          ingridients: ['ветчина', 'ананасы', 'моцарелла', 'томатный соус'],
          price: 579.00),
      ListProducts(
          key: 5,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
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
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
          image: 'assets/images/products/double_pepperoni.jpg',
          name: 'Двойная пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 639.00),
      ListProducts(
          key: 7,
          active: false,
          options1: ['Тонкая', 'Традиционная'],
          options1Active: 0,
          options2: [21, 26, 31, 45],
          options2Active: 0,
          image: 'assets/images/products/double_pepperoni.jpg',
          name: 'Двойная пепперони',
          ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
          price: 639.00),
    ],
    [
      ListProducts(
          key: 8,
          active: false,
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

  int activePage = 0;

  List listInCart = [];

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

  setActiveOptions(product, index) {
    for (int i = 0; i < listProducts.length; i++) {
      for (int j = 0; j < listProducts[i].length; j++) {
        if (product.key == listProducts[i][j].key) {
          listProducts[i][j].options1Active = index;
        }
      }
    }
    notifyListeners();
  }

  setActiveOptions2(product, index) {
    for (int i = 0; i < listProducts.length; i++) {
      for (int j = 0; j < listProducts[i].length; j++) {
        if (product.key == listProducts[i][j].key) {
          listProducts[i][j].options2Active = index;
        }
      }
    }
    notifyListeners();
  }

  addToCart(name, image, ingridient, price) {
    listInCart.add(ProdInCart(
        name: name, image: image, ingridients: ingridient, price: price));
    notifyListeners();
  }

  orderPrice() {
    double sum = 0;
    listInCart.forEach((element) {
      sum = sum + element.price;
    });
    return sum;
  }

  setActivePage(page) {
    activePage = page;
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

class ListProducts {
  final int key;
  bool active;
  List options1;
  int options1Active;
  List options2;
  int options2Active;
  final String image;
  final String name;
  final List ingridients;
  final double price;

  ListProducts({
    required this.key,
    required this.active,
    this.options1 = const [],
    this.options1Active = 0,
    this.options2 = const [],
    this.options2Active = 0,
    required this.image,
    required this.name,
    required this.ingridients,
    required this.price,
  });
}

class ProdInCart {
  late String name;
  final String image;
  final List ingridients;
  final double price;

  ProdInCart({
    required this.image,
    required this.name,
    required this.ingridients,
    required this.price,
  });
}
