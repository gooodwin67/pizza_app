import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdImage extends StatefulWidget {
  final product;
  const DetailedProdImage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailedProdImage> createState() => _DetailedProdImageState();
}

class _DetailedProdImageState extends State<DetailedProdImage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
          top: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding),
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
              tag: widget.product.key,
              child:
                  Image.asset(widget.product.image, height: size.height * 0.4),
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
            child: Stack(
              children: [
                IconButton(
                  splashRadius: 28,
                  onPressed: () {
                    setState(() {
                      context.read<Categories>().setActivePage(1);
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                Text(context.read<Categories>().listInCart.length.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
