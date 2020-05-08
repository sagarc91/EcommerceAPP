import 'package:ecommerce_app/podo/Tax.dart';
import 'package:ecommerce_app/podo/Variants.dart';

class Products {
  int id;
  String name;
  String dateAdded;
  List<Variants> variants;
  //Tax tax;

  Products({this.id, this.name, this.dateAdded, this.variants});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateAdded = json['date_added'];
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    //tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_added'] = this.dateAdded;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
//    if (this.tax != null) {
//      data['tax'] = this.tax.toJson();
//    }
    return data;
  }
}