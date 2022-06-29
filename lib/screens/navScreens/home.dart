import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/api/apiHomePage.dart';
import 'package:ecommerce/widgets/category.dart';
import 'package:ecommerce/widgets/productGridView.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/constants.dart';
import '../../models/brand.dart';
import '../../models/topCategory.dart';
import '../../models/product.dart';
import '../../utils/functions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

class _HomeState extends State<Home> {
  List<Product> productdata = [];
  List<TopCategory> listData = [];
  List<Brand> brandData = [];
  List<Product> recommendedData = [];
  List<Product> recentlyData = [];

  bool isLoading = false;

  bool isLoggedIn = false;

  ApiHome apiClient = ApiHome();

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    String token = await getToken();
    int userId = await getUserId();
    isLoggedIn = await getIsLoggedIn();
    if (isLoggedIn) {
      recommendedData =
          await apiClient.getRecommendedProducts(userId.toString(), token);
      recentlyData =
          await apiClient.getRecentlyViewed(userId.toString(), token);
    }
    listData = await apiClient.getTopCategories();
    productdata = await apiClient.getTopProducts();
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: height / 5,
                          width: width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromARGB(255, 55, 70, 253),
                                Color.fromARGB(255, 122, 35, 160),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            SizedBox(
                                height: height * 0.06,
                                child: Row(
                                  children: [
                                    SizedBox(width: width * 0.01),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.288,
                                    ),
                                    const Text(
                                      "Navyat",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: width * 0.298,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.notifications,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: width,
                              height: height * 0.22,
                              child: CarouselSlider(
                                items: imgList
                                    .map(
                                      (item) => Container(
                                        decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, 3.0),
                                                blurRadius: 3.0,
                                                spreadRadius: 8.0)
                                          ],
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        // child: Center(
                                        //   child: ClipRRect(
                                        //     borderRadius: const BorderRadius.all(
                                        //       Radius.circular(35),
                                        //     ),
                                        //     child: Image.network(
                                        //       item,
                                        //       fit: BoxFit.contain,
                                        //       width: 1000,
                                        //     ),
                                        //   ),
                                        // ),
                                      ),
                                    )
                                    .toList(),
                                options: CarouselOptions(
                                  pageViewKey: const PageStorageKey("carousel"),
                                  autoPlay: true,
                                  aspectRatio: 2.5,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: true,
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            SizedBox(
                              height: height * 0.12,
                              child: ListView.builder(
                                key: const PageStorageKey("categories"),
                                scrollDirection: Axis.horizontal,
                                itemCount: listData.length,
                                itemBuilder: (context, i) => Category(
                                    label: listData[i].label,
                                    imgPath: listData[i].imgPath),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                              child: Row(
                                children: [
                                  SizedBox(width: width * 0.05),
                                  SizedBox(
                                    width: width * 0.4,
                                    child: Text(
                                      "New Collections",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.048,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.33),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "show all",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.038,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: (width * 0.27 * 5 / 3 + width * 0.05) *
                                  productdata.length *
                                  0.5.ceil(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    width * 0.05, 0, width * 0.05, 0),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  key: const PageStorageKey("New Collections"),
                                  shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: width * 0.4,
                                          childAspectRatio: 3 / 5,
                                          crossAxisSpacing: width * 0.05,
                                          mainAxisSpacing: width * 0.05),
                                  itemCount: min(productdata.length, 4),
                                  itemBuilder: (context, i) => ProductGridView(
                                    product: productdata[i],
                                  ),
                                ),
                              ),
                            ),
                            isLoggedIn && recommendedData.isNotEmpty
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.05,
                                        child: Row(
                                          children: [
                                            SizedBox(width: width * 0.05),
                                            SizedBox(
                                              width: width * 0.4,
                                              child: Text(
                                                "Recommended",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: width * 0.048,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(width: width * 0.33),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "show all",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: width * 0.038,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: (width * 0.27 * 5 / 3 +
                                                width * 0.05) *
                                            recommendedData.length *
                                            0.5.ceil(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  width * 0.05,
                                                  0,
                                                  width * 0.05,
                                                  0),
                                          child: GridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            key: const PageStorageKey(
                                                "Recommended"),
                                            shrinkWrap: true,
                                            // physics: const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent:
                                                        width * 0.4,
                                                    childAspectRatio: 3 / 5,
                                                    crossAxisSpacing:
                                                        width * 0.05,
                                                    mainAxisSpacing:
                                                        width * 0.05),
                                            itemCount:
                                                min(recommendedData.length, 4),
                                            itemBuilder: (context, i) =>
                                                ProductGridView(
                                              product: recommendedData[i],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                            isLoggedIn && recentlyData.isNotEmpty
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.05,
                                        child: Row(
                                          children: [
                                            SizedBox(width: width * 0.05),
                                            SizedBox(
                                              width: width * 0.4,
                                              child: Text(
                                                "Recently",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: width * 0.048,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(width: width * 0.33),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "show all",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: width * 0.038,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: (width * 0.27 * 5 / 3 +
                                                width * 0.05) *
                                            recentlyData.length *
                                            0.5.ceil(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  width * 0.05,
                                                  0,
                                                  width * 0.05,
                                                  0),
                                          child: GridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            key: const PageStorageKey(
                                                "Recommended"),
                                            shrinkWrap: true,
                                            // physics: const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent:
                                                        width * 0.4,
                                                    childAspectRatio: 3 / 5,
                                                    crossAxisSpacing:
                                                        width * 0.05,
                                                    mainAxisSpacing:
                                                        width * 0.05),
                                            itemCount:
                                                min(recentlyData.length, 4),
                                            itemBuilder: (context, i) =>
                                                ProductGridView(
                                              product: recommendedData[i],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(height: height / 10),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
