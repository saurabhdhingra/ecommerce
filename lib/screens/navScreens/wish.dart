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
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0)
    ]
  },
  {
    "name": "For Kids",
    "list": [
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0),
      Product('', "Authentic Nike Air", '', '', [''], [], 0, 0, 0.0)
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
