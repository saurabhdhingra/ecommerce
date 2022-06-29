class CartItem {
  final int? cartId;
  final String? productId;
  final int? quantity;
  final String? name;
  final int? productPrice;

  CartItem(
      {required this.cartId,
      required this.productId,
      required this.quantity,
      required this.name,
      required this.productPrice});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        cartId: json["cartId"],
        productId: json["productId"],
        name: json["productNmae"],
        productPrice: json["productPrice"],
        quantity: json["quantity"]);
  }
  factory CartItem.fromMap(Map<String, dynamic> json) {
    return CartItem(
        cartId: json["cartId"],
        productId: json["productId"],
        name: json["productNmae"],
        productPrice: json["productPrice"],
        quantity: json["quantity"]);
  }
}
