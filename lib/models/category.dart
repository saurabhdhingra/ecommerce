class Category {
  final String? categoryId;
  final String? name;
  final String? slug;
  final String? parent;
  final String? imgPath;

  Category(this.categoryId, this.name, this.slug, this.parent, this.imgPath);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(json['categoriesId'], json["name"], json["slug"],
        json["parrentCategory"], json["thumbnail"]);
  }
  factory Category.fromMap(Map<String, dynamic> json) {
    return Category(json['categoriesId'], json["name"], json["slug"],
        json["parrentCategory"], json["thumbnail"]);
  }
}
