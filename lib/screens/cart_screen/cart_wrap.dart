import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:pizza_app/screens/detailed_screen/detailed_prod.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderSum = context.read<Categories>().orderPrice().toString();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.1,
              child: Center(
                child: Text(
                  'Корзина',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: context.read<Categories>().listInCart.length,
                  itemBuilder: (context, index) {
                    return BlockInCart(size: size, index: index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  bottom: kDefaultPadding,
                  right: kDefaultPadding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding / 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Оформить заказ на ',
                            style: TextStyle(color: Colors.white)),
                        Text(orderSum, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlockInCart extends StatefulWidget {
  final int index;
  final Size size;
  const BlockInCart({Key? key, required this.size, required this.index})
      : super(key: key);

  @override
  State<BlockInCart> createState() => _BlockInCartState();
}

class _BlockInCartState extends State<BlockInCart> {
  @override
  Widget build(BuildContext context) {
    var product = context.read<Categories>().listInCart;
    return Container(
      width: double.infinity,
      height: widget.size.height * 0.20,
      margin: const EdgeInsets.only(
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 206, 206, 206)),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding / 2,
            ),
            width: 115,
            height: 115,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child:
                  Image.asset(product[widget.index].image, fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 3,
                  vertical: kDefaultPadding / 1.5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product[widget.index].name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          context.read<Categories>().getDescription(
                              product[widget.index].ingridients),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF7C7C7C),
                            height: 1.3,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
              child: Text(
                product[widget.index].price.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
