import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

import 'components/banners_list_wrap.dart';

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
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(30, 30)),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 0),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    child: const Text(
                      'data',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 20,
                        color: Colors.red,
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                },
                childCount: 100, // 1000 list items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
