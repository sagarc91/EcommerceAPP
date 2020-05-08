import 'package:ecommerce_app/podo/Products.dart';

class Categories {
  int id;
  String name;
  List<Products> products;
  //List<int> childCategories;

//  Categories({this.id, this.name, this.products, this.childCategories});
  Categories({this.id, this.name, this.products});
  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    //childCategories = json['child_categories'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    //data['child_categories'] = this.childCategories;
    return data;
  }
}