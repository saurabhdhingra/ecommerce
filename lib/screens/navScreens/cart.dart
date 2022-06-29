import 'package:ecommerce/api/apiCart.dart';
import 'package:ecommerce/screens/navscreen.dart';
import 'package:ecommerce/utils/functions.dart';
import 'package:ecommerce/widgets/cartProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/cartItem.dart';
import '../../models/product.dart';
import '../../utils/constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

// final List<CartProduct> cartproductdata = [
//   CartProduct(
//       1, Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0)),
//   CartProduct(2, Product('', "H&M Shorts", '', '', [''], [], 0, 0, 0.0)),
//   CartProduct(4, Product('', "Air Jordans", '', '', [''], [], 0, 0, 0.0)),
//   CartProduct(1, Product('', "", '', '', [''], [], 0, 0, 0.0)),
//   CartProduct(
//       1, Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0)),
// ];

class _CartState extends State<Cart> {
  late List<CartItem> cart;
  late bool isLoggedIn;

  bool isLoading = false;
  ApiCart apiClient = ApiCart();

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    String token = await getToken();
    int userId = await getUserId();
    isLoggedIn = await getIsLoggedIn();
    if (isLoggedIn) {
      cart = await apiClient.getCart(token, userId.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF403F3C),
            ),
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 235, 236, 242),
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Cart',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              actions: [
                IconButton(
                  icon:
                      const Icon(CupertinoIcons.ellipsis, color: Colors.black),
                  onPressed: () {},
                )
              ],
            ),
            body: SafeArea(
              child: isLoggedIn
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.71,
                            child: ListView.builder(
                              itemCount: cart.length,
                              itemBuilder: ((context, i) {
                                return CartProductWidget(item: cart[i]);
                              }),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                  Radius.circular(15),
                                ),
                              ),
                              height: height * 0.05,
                              width: width * 0.9,
                              child: const Center(
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You are not logged in.',
                            style: TextStyle(
                                color: Colors.black54, fontSize: width * 0.06),
                          ),
                          TextButton(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: width * 0.04,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const NavScreen(currentIndex: 4)),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          );
  }
}
