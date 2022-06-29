import 'package:ecommerce/screens/productPages/productPage.dart';
import 'package:ecommerce/widgets/starRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/constants.dart';

class ProductGridView extends StatefulWidget {
  final Product product;
  const ProductGridView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(productId: widget.product.id ?? 'error')),);
      },
      child: Container(
        height: height * 0.3,
        width: width * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: width * 0.02),
                Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: width * 0.38,
                        width: width * 0.38,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 235, 236, 242),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        // child: Image.asset(
                        //   widget.product.imgPaths[0],
                        // ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 3, 0, 0),
                  child: Text(
                    widget.product.name ?? 'Product',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                StarRating(rating: 0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                          child: Text(
                            '\$${widget.product.discountedPrice}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                          child: Text(
                            '\$${widget.product.price}',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(CupertinoIcons.heart),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: width * 0.1,
                height: width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.bag_badge_plus),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
