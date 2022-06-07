import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdImage extends StatelessWidget {
  final product;
  const DetailedProdImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: IconButton(
              splashRadius: 28,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Hero(
              tag: product.key,
              child: Image.asset(product.image),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: IconButton(
              splashRadius: 28,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}
