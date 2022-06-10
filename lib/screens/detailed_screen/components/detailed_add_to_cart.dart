import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdAddToCart extends StatefulWidget {
  final product;
  Function refresh;
  DetailedProdAddToCart(
      {Key? key, required this.product, required this.refresh})
      : super(key: key);

  @override
  State<DetailedProdAddToCart> createState() => _DetailedProdAddToCartState();
}

class _DetailedProdAddToCartState extends State<DetailedProdAddToCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kDefaultPadding,
          bottom: kDefaultPadding,
          right: kDefaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              context.read<Categories>().addToCart(widget.product.name);
              widget.refresh();
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: const Center(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 1.5),
              child: Text('Add to cart', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
