import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:pizza_app/screens/detailed_screen/detailed_prod.dart';
import 'package:pizza_app/screens/main_screen/components/banners_list_wrap.dart';
import 'package:pizza_app/screens/main_screen/components/category_list_wrap.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  var scrollController = ScrollController();

  double newOpacity = 1;
  List activeList = [];
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

    activeList = context
        .read<Categories>()
        .listProducts[context.read<Categories>().activeCategory[0]];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    refresh() {
      scrollController.animateTo(140,
          duration: new Duration(milliseconds: 500), curve: Curves.ease);
      setState(() {});
    }

    activeList = context
        .read<Categories>()
        .listProducts[context.read<Categories>().activeCategory[0]];

    getDescription(ingridients) {
      return ingridients.join(', ')[0].toUpperCase() +
          ingridients.join(', ').substring(1);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                titleSpacing: 0,
                backgroundColor: Colors.white,
                title: Opacity(
                  opacity: newOpacity,
                  child:
                      Banners_List_Wrap(size: size, listBanners: listBanners),
                ),
                toolbarHeight: size.height * 0.20 + kDefaultPadding,
              ),
              SliverAppBar(
                titleSpacing: 0,
                toolbarHeight: size.height * 0.08 + kDefaultPadding,
                backgroundColor: Colors.white,
                title: CategoryTabsWidget(
                  size: size,
                  notifyParent: refresh,
                ),
                floating: true,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            var a =
                                context.read<Categories>().activeCategory[0];
                            var b = index;
                            context.read<Categories>().setActiveProd(a, b);
                            // print(context
                            //     .read<Categories>()
                            //     .listProducts[a][b]
                            //     .active);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailedProdScreen()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: size.height * 0.20,
                            margin: const EdgeInsets.only(
                                left: kDefaultPadding / 2,
                                right: kDefaultPadding / 2,
                                bottom: kDefaultPadding / 2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206)),
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
                                  height: 115,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Hero(
                                      tag: activeList[index].key,
                                      child: Image.asset(
                                          activeList[index].image,
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding / 3,
                                        vertical: kDefaultPadding / 1.5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            activeList[index].name,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 3),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Text(
                                                context
                                                    .read<Categories>()
                                                    .getDescription(
                                                        activeList[index]
                                                            .ingridients),
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Color(0xFF7C7C7C),
                                                  height: 1.3,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 12),
                                    child: Text(
                                      activeList[index].price.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    );
                  },
                  childCount: activeList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List listBanners = <ListBanners>[
  ListBanners(
      image: Image.asset('assets/images/banner1.jpg', fit: BoxFit.cover)),
  ListBanners(
      image: Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover)),
  ListBanners(
      image: Image.asset('assets/images/banner3.jpg', fit: BoxFit.cover)),
];

class ListBanners {
  final Image image;
  ListBanners({required this.image});
}
