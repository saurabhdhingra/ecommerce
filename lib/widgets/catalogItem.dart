import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  final String label;
  final String imgPath;
  const CatalogItem({Key? key, required this.label, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    return Row(
      children: [
        SizedBox(
          width: width / 20,
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                print('Pressed');
              },
              child: Container(
                width: width / 5,
                height: width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgPath), fit: BoxFit.cover),
                  // color: const Color.fromARGB(255, 235, 236, 242),
                  // border: Border.all(
                  //     color: Colors.white,
                  //     width: width / 100,
                  //     style: BorderStyle.solid),
                  // borderRadius: const BorderRadius.all(
                  //   Radius.circular(20),
                  // ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
