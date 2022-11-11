
import 'dart:convert';

CategoryData categoryDataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  CategoryData({
    this.categories,
    this.status,
    this.messages,
  });

  List<Category>? categories;
  String? status;
  String? messages;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    status: json["status"],
    messages: json["messages"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "status": status,
    "messages": messages,
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.children,
  });

  String? id;
  String? name;
  String? image;
  List<Category>? children;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    children: List<Category>.from(json["children"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "children": List<dynamic>.from(children!.map((x) => x.toJson())),
  };
}
