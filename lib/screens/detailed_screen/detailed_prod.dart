import 'package:flutter/material.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_add_to_cart.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_top_adding.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_top_image.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_top_name.dart';
import 'package:provider/provider.dart';

import '../../providers.dart';

class DetailedProdScreen extends StatefulWidget {
  const DetailedProdScreen({Key? key}) : super(key: key);

  @override
  State<DetailedProdScreen> createState() => _DetailedProdScreenState();
}

class _DetailedProdScreenState extends State<DetailedProdScreen> {
  @override
  Widget build(BuildContext context) {
    var product;
    refresh() {
      setState(() {});
    }

    for (int i = 0; i < context.read<Categories>().listProducts.length; i++) {
      for (int j = 0;
          j < context.read<Categories>().listProducts[i].length;
          j++) {
        if (context.read<Categories>().listProducts[i][j].active == true) {
          product = context.read<Categories>().listProducts[i][j];
        }
      }
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailedProdImage(product: product),
                DetailedProdName(product: product),
                DetailedProdAdding(),
                DetailedProdAddToCart(product: product, refresh: refresh),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
