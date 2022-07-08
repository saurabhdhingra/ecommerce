import 'package:ecommerce/widgets/wishlistProduct.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../utils/constants.dart';

class Wish extends StatefulWidget {
  const Wish({Key? key}) : super(key: key);

  @override
  State<Wish> createState() => _WishState();
}

final List<Map> lists = [
  {
    "name": "Favourites",
    "list": [
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
    ]
  },
  {
    "name": "For Kids",
    "list": [
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
    ]
  }
];

class _WishState extends State<Wish> {
  String search = "";
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        // title: Container(
        //   width: width * 0.85,
        //   height: height * 0.05,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(25),
        //     border: Border.all(
        //       color: Colors.grey.shade400,
        //     ),
        //   ),
        //   child: Center(
        //     child: Row(
        //       children: [
        //         SizedBox(width: width * 0.02),
        //         const Icon(Icons.search, color: Colors.black),
        //         SizedBox(
        //           width: width * 0.68,
        //           height: height * 0.05,
        //           child: Padding(
        //             padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        //             child: TextField(
        //               controller: searchController,
        //               onChanged: (value) {
        //                 setState(() {
        //                   search = value.trim();
        //                 });
        //               },
        //               decoration: const InputDecoration(
        //                 hintText: 'Search',
        //                 enabledBorder: UnderlineInputBorder(
        //                   borderSide: BorderSide(
        //                     color: Color(0x00000000),
        //                     width: 1,
        //                   ),
        //                   borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(4.0),
        //                     topRight: Radius.circular(4.0),
        //                   ),
        //                 ),
        //                 focusedBorder: UnderlineInputBorder(
        //                   borderSide: BorderSide(
        //                     color: Color(0x00000000),
        //                     width: 1,
        //                   ),
        //                   borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(4.0),
        //                     topRight: Radius.circular(4.0),
        //                   ),
        //                 ),
        //               ),
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.w300, color: Colors.grey),
        //               keyboardType: TextInputType.text,
        //             ),
        //           ),
        //         ),
        //         const Icon(Icons.mic, color: Colors.black),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            ListTile(
              title: const Text("Create a shopping List"),
              trailing: IconButton(
                icon: const Icon(Icons.add, color: Colors.grey),
                onPressed: () {},
              ),
            ),
            // ListTile(
            //   title: Stack(
            //     children: [
            //       const Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             "Favourites",
            //             style: TextStyle(fontWeight: FontWeight.w600),
            //           )),
            //       Align(
            //         alignment: Alignment.centerRight,
            //         child: Container(
            //           width: width * 0.08,
            //           height: height * 0.03,
            //           decoration: BoxDecoration(
            //             color: Colors.grey[300],
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(height * 0.015),
            //             ),
            //           ),
            //           child: const Center(child: Text('12')),
            //         ),
            //       )
            //     ],
            //   ),
            //   trailing: IconButton(
            //     icon: const Icon(Icons.chevron_right, color: Colors.grey),
            //     onPressed: () {},
            //   ),
            // ),
            // ListTile(
            //   title: Stack(
            //     children: [
            //       const Align(
            //           alignment: Alignment.centerLeft,
            //           child: SizedBox(
            //             child: Text(
            //               "For Kids",
            //               style: TextStyle(fontWeight: FontWeight.w600),
            //             ),
            //           )),
            //       Align(
            //         alignment: Alignment.centerRight,
            //         child: Container(
            //           width: width * 0.08,
            //           height: height * 0.03,
            //           decoration: BoxDecoration(
            //             color: Colors.grey[300],
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(height * 0.015),
            //             ),
            //           ),
            //           child: const Center(child: Text('1')),
            //         ),
            //       )
            //     ],
            //   ),
            //   trailing: IconButton(
            //     icon: const Icon(Icons.chevron_right, color: Colors.grey),
            //     onPressed: () {},
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: lists.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.35,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            lists[index]["name"],
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          trailing: TextButton(
                              onPressed: () {},
                              child: Text("show all",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.grey[700]))),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0.04, 0, 0, 0),
                          child: SizedBox(
                            height: height * 0.275,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: lists[index]['list'].length,
                              itemBuilder: ((context, i) {
                                return WishListProduct(
                                    product: lists[index]['list'][i]);
                              }),
                              separatorBuilder: ((context, index) => SizedBox(
                                    width: width * 0.02,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.06,
            )
          ],
        ),
      ),
    );
  }
}
