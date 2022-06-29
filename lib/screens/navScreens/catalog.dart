import 'package:ecommerce/api/apiCatalog.dart';
import 'package:ecommerce/widgets/catalogItem.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  late List catalogdata;
  bool isLoading = false;

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    ApiCatalog networkHelper = ApiCatalog();
    catalogdata = await networkHelper.getCategories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String search = "";
  int selectedCategoryIndex = 15;
  late TextEditingController searchController;

  // List<Category> catalogdata = [
  //   Category('1', 'jeans', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('2', 'jacket', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('3', 'tshirts', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('4', 'hats', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('1', 'jewelry', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('1', 'bottles', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('1', 'plates', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('1', 'jeans', 'jeans', 'jeans', 'assets/icon.png'),
  //   Category('1', 'jeans', 'jeans', 'jeans', 'assets/icon.png'),
  // ];

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
              title: const Text('What we offer at Navyat',
                  style: TextStyle(color: Colors.black)),
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
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: (width * 0.07 * 4 / 3 + width * 0.05) *
                        catalogdata.length *
                        0.5.ceil(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          width * 0.05, 0, width * 0.05, 0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: width * 0.4,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemCount: catalogdata.length,
                          itemBuilder: (context, i) {
                            return CatalogItem(
                              imgPath: catalogdata[i].imgPath,
                              label: catalogdata[i].name,
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: height / 10),
                ],
              ),
            ),
          );
  }
}
