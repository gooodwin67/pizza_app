import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class CategoryTabsWidget extends StatefulWidget {
  final Size size;
  final Function() notifyParent;
  const CategoryTabsWidget(
      {Key? key, required this.size, required this.notifyParent})
      : super(key: key);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  @override
  Widget build(BuildContext context) {
    List list = context.read<Categories>().listCategories;
    onTapCategory(key) {
      //print(list[key].active);
      widget.notifyParent();
      setState(() {
        context.read<Categories>().setActive(key);
      });
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      height: widget.size.height * 0.05 + kDefaultPadding,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemBuilder: (context, index) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  return onTapCategory(index);
                },
                style: ElevatedButton.styleFrom(
                  primary: list[index].active ? kPrimaryColor : Colors.white,
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
                child: list[index].text,
              ),
            );
          }),
    );
  }
}
