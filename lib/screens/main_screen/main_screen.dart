import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/screens/main_screen/components/banners_list_wrap.dart';
import 'package:pizza_app/screens/main_screen/components/category_list_wrap.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  var scrollController = ScrollController();
  double newOpacity = 1;
  void _onScrollEvent() {
    final extentOpacity;
    extentOpacity = scrollController.position.extentBefore;
    if (extentOpacity < 150) {
      newOpacity = (150.0 - extentOpacity) / 150;
    } else {
      newOpacity = 0;
    }
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              titleSpacing: 0,
              backgroundColor: Colors.white,
              title: Opacity(
                opacity: newOpacity,
                child: Banners_List_Wrap(size: size, listBanners: listBanners),
              ),
              toolbarHeight: size.height * 0.20 + kDefaultPadding,
            ),
            SliverAppBar(
              titleSpacing: 0,
              toolbarHeight: size.height * 0.08 + kDefaultPadding,
              backgroundColor: Colors.white,
              title: CategoryTabsWidget(
                  size: size, listCategories: listCategories),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.20,
                        margin: const EdgeInsets.only(
                            left: kDefaultPadding / 2,
                            right: kDefaultPadding / 2,
                            bottom: kDefaultPadding / 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 206, 206, 206)),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: kDefaultPadding / 2,
                                bottom: kDefaultPadding / 2,
                              ),
                              width: 115,
                              height: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(listProducts[index].image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding / 4,
                                    vertical: kDefaultPadding / 1),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listProducts[index].name,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('asd'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 12),
                                child: Text(
                                  listProducts[index].price.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                },
                childCount: listProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List listProducts = <ListProducts>[
  ListProducts(
      image: 'assets/images/products/pepperoni.jpg',
      name: 'Пепперони',
      ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
      price: 399.00),
  ListProducts(
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
      image: 'assets/images/products/double_pepperoni.jpg',
      name: 'двойная пепперони',
      ingridients: ['пикантная пепперони', 'моцарелла', 'томатный соус'],
      price: 639.00),
  ListProducts(
      image: 'assets/images/products/gavai.jpg',
      name: 'Гавайская',
      ingridients: ['ветчина', 'ананасы', 'моцарелла', 'томатный соус'],
      price: 579.00),
  ListProducts(
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
];

List listBanners = <ListBanners>[
  ListBanners(
      image: Image.asset('assets/images/banner1.jpg', fit: BoxFit.cover)),
  ListBanners(
      image: Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover)),
  ListBanners(
      image: Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover)),
];

List listCategories = <ListCategories>[
  ListCategories(
      text: Icon(Icons.filter_alt_rounded, color: Colors.black, size: 20)),
  ListCategories(text: Text('Pizza', style: TextStyle(color: Colors.black))),
  ListCategories(text: Text('Snacks', style: TextStyle(color: Colors.black))),
  ListCategories(text: Text('Solods', style: TextStyle(color: Colors.black))),
  ListCategories(text: Text('Drinks', style: TextStyle(color: Colors.black))),
  ListCategories(text: Text('Sushi', style: TextStyle(color: Colors.black))),
];

class ListProducts {
  final String image;
  final String name;
  final List ingridients;
  final double price;

  ListProducts({
    required this.image,
    required this.name,
    required this.ingridients,
    required this.price,
  });

  String listToDesc() {
    return ingridients.join(', ');
  }
}

class ListCategories {
  final text;

  ListCategories({required this.text});
}

class ListBanners {
  final Image image;
  ListBanners({required this.image});
}
