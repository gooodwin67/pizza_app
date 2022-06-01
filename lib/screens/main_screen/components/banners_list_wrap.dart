import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class Banners_List_Wrap extends StatelessWidget {
  List listBanners;
  Banners_List_Wrap({
    Key? key,
    required this.listBanners,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.20 + kDefaultPadding,
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2,
            top: kDefaultPadding),
        itemCount: listBanners.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          return Container(
            height: size.height * 0.20 + kDefaultPadding,
            width: size.width - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: listBanners[index].image,
            ),
          );
        },
      ),
    );
  }
}
