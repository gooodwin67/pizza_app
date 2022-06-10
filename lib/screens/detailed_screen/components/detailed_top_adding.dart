import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdAdding extends StatelessWidget {
  const DetailedProdAdding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Container(
        height: 120,
        color: Color.fromARGB(255, 196, 196, 196),
      ),
    );
  }
}
