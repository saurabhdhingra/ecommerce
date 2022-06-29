import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  final String category;
  const CategoryProducts({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
    );
  }
}
