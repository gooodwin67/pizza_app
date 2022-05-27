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
      height: size.height * 0.25,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        itemCount: listBanners.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          return Container(
            height: size.height * 0.25,
            width: size.width - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: listBanners[index].image,
            ),
          );
        },
      ),
    );
  }
}
