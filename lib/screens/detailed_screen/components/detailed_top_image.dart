import 'package:flutter/material.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdImage extends StatelessWidget {
  const DetailedProdImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a;
    for (int i = 0; i < context.read<Categories>().listProducts.length; i++) {
      for (int j = 0;
          j < context.read<Categories>().listProducts[i].length;
          j++) {
        // if (context.read<Categories>().listProducts[i][j].active = true) {
        //   print(i);
        //   print(j);
        // } else {
        //   print('none');
        // }

      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        Text('data'),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
