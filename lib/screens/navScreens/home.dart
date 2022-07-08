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
  'https://static.nike.com/a/images/w_1920,c_limit/6ca98205-3a29-4635-b884-4f2f33e26ffe/nike’s-best-golf-shoes-for-traction-stability-and-comfort.jpg',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://media.weddingz.in/images/6af69e2e2b7e3ad76c19fe9f5b2fcf72/bridalportraitspic13.jpg',
];

class _HomeState extends State<Home> {
  List<Product> productdata = [
    Product(
      '',
      "Nike Air",
      '',
      '',
      [''],
      [
        'https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/341e2ed9-9797-4f15-8d4f-265071377068/air-force-1-07-lv8-shoes-BS9f21.png'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "H&M Shorts",
      '',
      '',
      [''],
      [
        'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F43%2F89%2F43898dad7779c5523a7850bb3ee8cbdcbcca2c05.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "Zara Jacket",
      '',
      '',
      [''],
      [
        'https://static.zara.net/photos///2022/V/0/2/p/3918/460/800/2/w/375/3918460800_2_1_1.jpg?ts=1642768291622'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "Muffler",
      '',
      '',
      [''],
      [
        'https://assets.ajio.com/medias/sys_master/root/20201015/292z/5f88841baeb269d563df8142/-473Wx593H-461485121-multi-MODEL.jpg'
      ],
      150,
      200,
      0.0,
    )
  ];
  List<TopCategory> listData = [
    TopCategory(
        imgPath:
            'https://static.zara.net/photos///2022/V/0/2/p/1368/400/800/2/w/1500/1368400800_1_1_1.jpg?ts=1646738230549',
        label: 'T Shirts'),
    TopCategory(
        imgPath:
            'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/13936018/2021/6/14/64fca36c-20fc-418e-97d5-b3961ea8d4bc1623656461279-SASSAFRAS-Women-Shorts-5961623656460440-1.jpg',
        label: 'Shorts'),
    TopCategory(
        imgPath:
            'https://res.cloudinary.com/atoms-shoes/image/upload/c_fill,w_1600,ar_3:2,q_auto,f_auto/v1649178687/products/shoes/model000/black_and_white_000_side_profile_single_-_background_f2f2f2_-_compressed_ytztl9',
        label: 'Shoes')
  ];
  List<Brand> brandData = [];
  List<Product> recommendedData = [
    Product(
      '',
      "Authentic Nike Air",
      '',
      '',
      [''],
      [
        'https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/341e2ed9-9797-4f15-8d4f-265071377068/air-force-1-07-lv8-shoes-BS9f21.png'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "H&M Shorts",
      '',
      '',
      [''],
      [
        'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F43%2F89%2F43898dad7779c5523a7850bb3ee8cbdcbcca2c05.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "Zara Jacket",
      '',
      '',
      [''],
      [
        'https://static.zara.net/photos///2022/V/0/2/p/3918/460/800/2/w/375/3918460800_2_1_1.jpg?ts=1642768291622'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "Muffler",
      '',
      '',
      [''],
      [
        'https://assets.ajio.com/medias/sys_master/root/20201015/292z/5f88841baeb269d563df8142/-473Wx593H-461485121-multi-MODEL.jpg'
      ],
      150,
      200,
      0.0,
    )
  ];
  List<Product> recentlyData = [
    Product(
      '',
      "Authentic Nike Air",
      '',
      '',
      [''],
      [
        'https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/341e2ed9-9797-4f15-8d4f-265071377068/air-force-1-07-lv8-shoes-BS9f21.png'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "H&M Shorts",
      '',
      '',
      [''],
      [
        'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F43%2F89%2F43898dad7779c5523a7850bb3ee8cbdcbcca2c05.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "Zara Jacket",
      '',
      '',
      [''],
      [
        'https://static.zara.net/photos///2022/V/0/2/p/3918/460/800/2/w/375/3918460800_2_1_1.jpg?ts=1642768291622'
      ],
      150,
      200,
      0.0,
    ),
    Product(
      '',
      "Muffler",
      '',
      '',
      [''],
      [
        'https://assets.ajio.com/medias/sys_master/root/20201015/292z/5f88841baeb269d563df8142/-473Wx593H-461485121-multi-MODEL.jpg'
      ],
      150,
      200,
      0.0,
    )
  ];

  bool isLoading = false;

  bool isLoggedIn = true;

  ApiHome apiClient = ApiHome();
  // API not live now so this is deprecated using test data instead
  // Future getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   String token = await getToken();
  //   int userId = await getUserId();
  //   isLoggedIn = await getIsLoggedIn();
  //   if (isLoggedIn) {
  //     recommendedData =
  //         await apiClient.getRecommendedProducts(userId.toString(), token);
  //     recentlyData =
  //         await apiClient.getRecentlyViewed(userId.toString(), token);
  //   }
  //   listData = await apiClient.getTopCategories();
  //   productdata = await apiClient.getTopProducts();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

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
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(35),
                                            ),
                                            child: Image.network(
                                              item,
                                              fit: BoxFit.fill,
                                              width: 1000,
                                            ),
                                          ),
                                        ),
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
                              height: (width * 0.2 * 5 / 3 + width * 0.05) *
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
                                        height: (width * 0.2 * 5 / 3 +
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
                                        height: (width * 0.2 * 5 / 3 +
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
