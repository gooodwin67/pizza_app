import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdName extends StatelessWidget {
  final product;
  const DetailedProdName({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            context.read<Categories>().getDescription(product.ingridients),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF7C7C7C),
              height: 1.4,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          product.options1.length > 0
              ? LayoutBuilder(builder: (context, constrains) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 204, 204),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: product.options1.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: constrains.maxWidth / product.options1.length,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 204, 204, 204)),
                                ),
                                onPressed: () {},
                                child: Text(product.options1[index])),
                          ),
                        );
                      },
                    ),
                  );
                })
              : Container(),
        ],
      ),
    );
  }
}
