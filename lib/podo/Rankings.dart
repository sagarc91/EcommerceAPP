import 'package:ecommerce_app/podo/RankingProducts.dart';

class Rankings {
  String ranking;
  List<RankingProducts> products;

  Rankings({this.ranking, this.products});

  Rankings.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    if (json['products'] != null) {
      products = new List<RankingProducts>();
      json['products'].forEach((v) {
        products.add(new RankingProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ranking'] = this.ranking;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}