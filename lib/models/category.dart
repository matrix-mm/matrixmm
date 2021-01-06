class Category {
  int categoryId;
  String categoryName;
  String categoryDesc;
  int parent;
  Images image;

  Category({
    this.categoryId,
    this.categoryName,
    this.categoryDesc,
    this.image,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'];
    categoryName = json['name'];
    categoryDesc = json['description'];
    parent = json['parent'];
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
  }
}

class Images {
  String url;

  Images({
    this.url,
  });

  Images.fromJson(Map<String, dynamic> json) {
    url = json['src'];
  }
}
