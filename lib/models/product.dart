class Product {
  final String? id;
  final String? name;
  final String? description;
  final String? brand;
  final List<dynamic> tags;
  final List<dynamic> imgPaths;
  final int? price;
  final int? discountedPrice;
  final dynamic rating;

  Product(this.id, this.name, this.description, this.brand, this.tags,
      this.imgPaths, this.price, this.discountedPrice, this.rating);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['productId'],
        json["productName"],
        json["productDescription"],
        json["brand"],
        json["productTag"],
        json["productImage"],
        json["productRegularPrice"],
        json["productSalePrice"],
        json["productAverageRatings"]);
  }
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
        json['productId'],
        json["productName"],
        json["productDescription"],
        json["brand"],
        json["productTag"],
        json["productImage"],
        json["productRegularPrice"],
        json["productSalePrice"],
        json["productAverageRatings"]);
  }
}
