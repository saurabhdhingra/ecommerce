class Order {
  final DateTime date;
  final List<Map> items;
  final int quantity;
  final int orderNo;
  final int amount;
  final String state;

  Order({
    required this.date,
    required this.items,
    required this.quantity,
    required this.orderNo,
    required this.amount,
    required this.state,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        date: DateTime.parse(json["date"]),
        items: json["items"],
        quantity: json["quantity"],
        orderNo: json["orderNo"],
        amount: json["amount"],
        state: json["state"]);
  }
  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
        date: DateTime.parse(json["date"]),
        items: json["items"],
        quantity: json["quantity"],
        orderNo: json["orderNo"],
        amount: json["amount"],
        state: json["state"]);
  }
}
