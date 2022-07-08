import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/api/apiCart.dart';
import 'package:ecommerce/screens/productPages/reviews.dart';
import 'package:ecommerce/widgets/gradient.dart';
import 'package:ecommerce/widgets/productListView.dart';
import 'package:ecommerce/widgets/starRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../utils/constants.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

//testing data
final List<String> imgList = [
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f1f5485e-2c96-4d1b-a6d3-5014e468a4ab/air-jordan-1-zoom-cmft-shoes-mDxHSk.png',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bd5c9b7d-b289-4e4f-a00d-8420438bff49/air-jordan-1-zoom-cmft-shoes-mDxHSk.png',
];
final List<String> sizeList = ['S', 'M', 'L', 'XL'];
final List<String> colorList = ['Red', 'Blue', 'Green', 'Yellow'];

class _ProductPageState extends State<ProductPage> {
  String selectedColor = "";
  String selectedSize = "";

  bool isLoading = false;
  Product product = Product(
    '',
    "Authentic Nike Air",
    '',
    '',
    [''],
    [
      'https://5.imimg.com/data5/ANDROID/Default/2020/11/VA/ML/XT/28747158/product-jpeg-500x500.jpg'
    ],
    150,
    200,
    0.0,
  );

  int _current = 0;

  ApiCart apiCart = ApiCart();

  final CarouselController _controller = CarouselController();

  // Future getProductData(String productId) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   product = await apiCart.getProductInformation(productId);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getProductData(widget.productId);
  // }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    //  widget.productId == 'error'? true: false;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF403F3C),
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left,
                    size: 38, color: Colors.black87),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.share,
                      size: 30, color: Colors.black87),
                ),
              ],
            ),
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: width,
                    height: height * 0.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(210, 255, 255, 255),
                          Colors.transparent
                        ],
                        stops: [0.15, 0.6],
                      ),
                    ),
                    child: CarouselSlider(
                      carouselController: _controller,
                      items: imgList
                          .map(
                            (item) => Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 244, 244, 244),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.contain,
                                    width: 1000,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 0.6,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: width,
                    height: height * 0.55,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.01),
                        Row(
                          children: [
                            StarRating(rating: 4.5, size: width * 0.052),
                            Text(
                              '(11)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.04,
                              ),
                            ),
                            SizedBox(width: width * 0.3),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const Reviews()),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "View all reviews",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: width * 0.035),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: width * 0.05,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          product.name ?? 'Product',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.14,
                              child: Text(
                                '\$${product.discountedPrice}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            SizedBox(
                              width: width * 0.12,
                              child: Text(
                                '\$${product.price}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.55,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3.0,
                                      spreadRadius: 2.0,
                                      color: Colors.black12)
                                ],
                              ),
                              width: width * 0.1,
                              height: width * 0.1,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.heart,
                                      size: 24, color: Colors.black87),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1, height: 15),
                        const Text(
                          'Colour',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        selectedColor != ''
                            ? GradientMask(
                                child: Text(
                                  selectedColor,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : const Text(
                                "Select Colour",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          width: width * 0.94,
                          height: height * 0.08,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: colorList.length,
                            itemBuilder: ((context, index) => ProductListView(
                                  selected: selectedColor,
                                  items: colorList,
                                  index: index,
                                  onTap: (String value) => setState(
                                    () => selectedColor = value,
                                  ),
                                )),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: width * 0.02),
                          ),
                        ),
                        const Divider(thickness: 1, height: 15),
                        SizedBox(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  selectedSize != ''
                                      ? SizedBox(
                                          width: width * 0.24,
                                          child: GradientMask(
                                            child: Text(
                                              selectedSize,
                                              style: TextStyle(
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          width: width * 0.24,
                                          child: Text(
                                            "Select Size",
                                            style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(width: width * 0.4),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "View Size chart",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.035),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: width * 0.05,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        SizedBox(
                          width: width * 0.94,
                          height: height * 0.08,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeList.length,
                            itemBuilder: ((context, index) => ProductListView(
                                  selected: selectedSize,
                                  items: sizeList,
                                  index: index,
                                  onTap: (String value) => setState(
                                    () => selectedSize = value,
                                  ),
                                )),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: width * 0.02),
                          ),
                        ),
                        SizedBox(height: height * 0.015),
                        Center(
                          child: GestureDetector(
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
                                  "Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
