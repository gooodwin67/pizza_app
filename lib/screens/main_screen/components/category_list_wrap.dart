import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';

class CategoryTabsWidget extends StatelessWidget {
  const CategoryTabsWidget(
      {Key? key, required this.size, required this.listCategories})
      : super(key: key);

  final Size size;
  final List listCategories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      height: size.height * 0.05 + kDefaultPadding,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          itemCount: listCategories.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemBuilder: (context, index) {
            return Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(color: Color(0xFFCACACA)),
                  minimumSize: Size(30, 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: listCategories[index].text,
              ),
            );
          }),
    );
  }
}
