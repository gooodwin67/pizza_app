import 'package:flutter/material.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_top_image.dart';
import 'package:pizza_app/screens/detailed_screen/components/detailed_top_name.dart';
import 'package:provider/provider.dart';

import '../../providers.dart';

class DetailedProdScreen extends StatelessWidget {
  const DetailedProdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product;
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
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailedProdImage(product: product),
              DetailedProdName(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
