import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/widgets/gradient.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProductListView extends StatefulWidget {
  final String selected;
  final List items;
  final int index;
  final Function(String) onTap;
  const ProductListView(
      {super.key,
      required this.selected,
      required this.items,
      required this.index,
      required this.onTap});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return widget.selected == widget.items[widget.index]
        ? GradientMask(
            child: GestureDetector(
              onTap: () => widget.onTap(widget.items[widget.index]),
              child: Container(
                height: height * 0.075,
                width: width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                      color: Colors.grey,
                      width: width * 0.005,
                      style: BorderStyle.solid),
                ),
                child: Center(
                  child: Text(
                    widget.items[widget.index],
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                ),
              ),
            ),
          )
        : DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            dashPattern: const [10, 10],
            color: Colors.grey,
            strokeWidth: width * 0.005,
            child: GestureDetector(
              onTap: () => widget.onTap(widget.items[widget.index]),
              child: Container(
                height: height * 0.075,
                width: width * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.items[widget.index],
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                ),
              ),
            ),
          );
  }
}
