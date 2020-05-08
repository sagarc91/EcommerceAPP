import 'package:ecommerce_app/podo/Categories.dart';
import 'package:ecommerce_app/podo/Rankings.dart';

class ProductsData {
  List<Categories> categories;
  List<Rankings> rankings;

  ProductsData({this.categories, this.rankings});

  ProductsData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['rankings'] != null) {
      rankings = new List<Rankings>();
      json['rankings'].forEach((v) {
        rankings.add(new Rankings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.rankings != null) {
      data['rankings'] = this.rankings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}