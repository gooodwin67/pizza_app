import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ListView.builder(
          itemCount: context.read<Categories>().listInCart.length,
          itemBuilder: (context, index) {
            return context.read<Categories>().listInCart[index].name;
          }),
    );
  }
}
