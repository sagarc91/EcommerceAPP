class Variants {
  int id;
  String color;
  int size;
  int price;

  Variants({this.id, this.color, this.size, this.price});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'] as String == null ? "" : json['color'];
    size = json['size'] as int == null ? 0 : json['size'];
    price = json['price'] as int == null ? 0 : json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['size'] = this.size;
    data['price'] = this.price;
    return data;
  }
}