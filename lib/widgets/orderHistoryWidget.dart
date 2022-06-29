import 'dart:math';

import 'package:flutter/material.dart';

import '../models/order.dart';
import '../utils/constants.dart';

class OrderHistoryWidget extends StatefulWidget {
  final Order order;
  const OrderHistoryWidget({super.key, required this.order});

  @override
  State<OrderHistoryWidget> createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
              'Order from ${months[widget.order.date.month.toString()]} widget.order.date.day.toString(), widget.order.date.year.toString()'),
          Row(
            children: [
              Container(
                width: width * 0.75,
                padding: EdgeInsets.fromLTRB(width * 0.075, 0, 0, 0),
                child: ListView.builder(
                  itemCount: min(widget.order.items.length, 7),
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Image.network(
                          widget.order.items[i]["imagePath"] == ''
                              ? 'https://thumbs.dreamstime.com/b/cardboard-icon-flat-vector-template-design-trendy-simple-isolated-illustration-signage-180812088.jpg'
                              : widget.order.items[i]["imagePath"],
                          fit: BoxFit.fitHeight),
                    );
                  },
                ),
              ),
              Container(
                  width: width * 0.1,
                  child: widget.order.items.length > 7
                      ? Text('+${widget.order.items.length - 7}')
                      : null)
            ],
          )
        ],
      ),
    );
  }
}
