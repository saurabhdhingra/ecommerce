import 'package:ecommerce/widgets/starRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/productPages/productPage.dart';
import '../utils/constants.dart';

class WishListProduct extends StatefulWidget {
  final Product product;
  const WishListProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<WishListProduct> createState() => _WishListProductState();
}

class _WishListProductState extends State<WishListProduct> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductPage(productId: widget.product.id ?? 'error')));
        },
        child: Container(
          height: height * 0.24,
          width: width * 0.34,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 15.0,
                spreadRadius: 5.0,
              )
            ],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * 0.02, width * 0.02, width * 0.02, width * 0.02),
                    child: Container(
                      height: width * 0.3,
                      width: width * 0.3,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 235, 236, 242),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.network(
                            widget.product.imgPaths[0],
                            fit: BoxFit.fill,
                            width: 1000,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: SizedBox(
                      height: height * 0.04,
                      child: Text(
                        widget.product.name ?? 'product',
                        style: TextStyle(
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  StarRating(
                    rating: 0,
                    size: width * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: Text(
                      '\$${widget.product.discountedPrice}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
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
                  width: width * 0.08,
                  height: width * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.bag_badge_plus, size: 16),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
