import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/providers.dart';
import 'package:provider/provider.dart';

class DetailedProdName extends StatefulWidget {
  final product;
  const DetailedProdName({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailedProdName> createState() => _DetailedProdNameState();
}

class _DetailedProdNameState extends State<DetailedProdName> {
  @override
  Widget build(BuildContext context) {
    optionsPressed(index) {
      context.read<Categories>().setActiveOptions(widget.product, index);
    }

    optionsPressed2(index) {
      context.read<Categories>().setActiveOptions2(widget.product, index);
    }

    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            context
                .read<Categories>()
                .getDescription(widget.product.ingridients),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF7C7C7C),
              height: 1.4,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          widget.product.options1.length > 0
              ? LayoutBuilder(builder: (context, constrains) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.product.options1.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: constrains.maxWidth /
                              widget.product.options1.length,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ElevatedButton(
                              style: index == widget.product.options1Active
                                  ? ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor),
                                    )
                                  : ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFEEEEEE)),
                                    ),
                              onPressed: () {
                                setState(() {
                                  optionsPressed(index);
                                });
                              },
                              child: Text(
                                widget.product.options1[index],
                                style: widget.product.options1Active == index
                                    ? TextStyle(
                                        color: Colors.white,
                                      )
                                    : TextStyle(
                                        color: Color.fromARGB(255, 92, 92, 92),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                })
              : Container(),
          SizedBox(height: kDefaultPadding / 2),
          widget.product.options2.length > 0
              ? LayoutBuilder(builder: (context, constrains) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.product.options2.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: constrains.maxWidth /
                              widget.product.options2.length,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ElevatedButton(
                              style: index == widget.product.options2Active
                                  ? ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor),
                                    )
                                  : ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFEEEEEE)),
                                    ),
                              onPressed: () {
                                setState(() {
                                  optionsPressed2(index);
                                });
                              },
                              child: Text(
                                widget.product.options2[index].toString(),
                                style: widget.product.options2Active == index
                                    ? TextStyle(
                                        color: Colors.white,
                                      )
                                    : TextStyle(
                                        color: Color.fromARGB(255, 92, 92, 92),
                                      ),
                              ),
                            ),
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
