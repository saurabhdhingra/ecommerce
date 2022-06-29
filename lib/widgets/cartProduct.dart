import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/cartItem.dart';
import '../screens/productPages/productPage.dart';
import '../utils/constants.dart';

class CartProductWidget extends StatefulWidget {
  final CartItem item;

  const CartProductWidget({super.key, required this.item});

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(width * 0.02, width * 0.02, width * 0.02, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                      productId: widget.item.productId ?? 'error')));
        },
        child: Container(
          width: width * 0.8,
          height: height * 0.16,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(width: height * 0.01),
                  Container(
                    height: height * 0.14,
                    width: height * 0.14,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 236, 242),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    // child: Image.asset(
                    //   widget.product.imgPaths[0],
                    // ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.4,
                                child: Text(
                                  widget.item.name ?? 'product',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Text(
                                'Size : L | Colour : Blue',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              SizedBox(height: height * 0.06),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.heart),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width * 0.26,
                    height: height * 0.05,
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.grey),
                          left: BorderSide(width: 1, color: Colors.grey),
                          right: BorderSide(width: 1, color: Colors.grey),
                          bottom: BorderSide(width: 1, color: Colors.grey)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: width * 0.08,
                            height: width * 0.08,
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
                              ),
                            )),
                        SizedBox(
                          width: width * 0.08,
                          height: width * 0.08,
                          child: Center(
                            child: Text(
                              widget.item.quantity.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.08,
                          height: width * 0.08,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromARGB(255, 55, 70, 253),
                                Color.fromARGB(255, 122, 35, 160),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.add,
                                  size: 15, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.22, 0.85),
                child: Text(
                  '\$${widget.item.productPrice}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
