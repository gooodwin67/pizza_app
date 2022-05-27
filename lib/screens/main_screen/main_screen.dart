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

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Banners_List_Wrap(size: size, listBanners: listBanners),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text('asdasdasd');
              },
            ),
          ),
        ],
      )),
    );
  }
}
