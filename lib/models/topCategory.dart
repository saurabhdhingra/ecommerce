class TopCategory {
  final String imgPath;
  final String label;

  TopCategory({required this.imgPath, required this.label});

  factory TopCategory.fromJson(Map<String, dynamic> json) {
    return TopCategory(imgPath: "", label: json["name"]);
  }
  factory TopCategory.fromMap(Map<String, dynamic> json) {
    return TopCategory(imgPath: "", label: json["name"]);
  }
}
