import 'package:ecommerce/widgets/orderHistoryWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/order.dart';
import '../../utils/constants.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

final List<OrderHistory> data = [];

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 236, 242),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: const Text(
          'Order History',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.ellipsis, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: height * 0.77,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, i) {
              return OrderHistoryWidget(
                order: Order(
                    date: DateTime(2022, 9, 10),
                    items: [],
                    quantity: 0,
                    orderNo: 1,
                    amount: 0,
                    state: 'NEW'),
              );
            }),
          ),
        ),
      ),
    );
  }
}
