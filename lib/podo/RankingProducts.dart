class RankingProducts {
  int id;
  int viewCount;
  int orderCount;
  int shares;

  RankingProducts({this.id, this.viewCount, this.orderCount, this.shares});

  RankingProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    viewCount = json['view_count'];
    orderCount = json['order_count'];
    shares = json['shares'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['view_count'] = this.viewCount;
    data['order_count'] = this.orderCount;
    data['shares'] = this.shares;
    return data;
  }
}