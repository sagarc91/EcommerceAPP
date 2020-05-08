import 'dart:convert';
import 'package:ecommerce_app/podo/Categories.dart';
import 'package:http/http.dart';

class GetCategories {

  Future<List<Categories>> getCategories() async {
    final uri = 'https://stark-spire-93433.herokuapp.com/json';
    print("URI $uri");

    final res = await get(uri);
    //print("RES ${jsonDecode(res.body)}");

    Map<String, dynamic> map = jsonDecode(res.body);
    //print('RESPONSEDATA: $map');

    List<dynamic> resbody = map["categories"];
     print('RESPONSEBODY: $resbody');

    List<Categories> categorydata = resbody
        .map(
          (dynamic item) => Categories.fromJson(item),
    )
        .toList();

    return categorydata;
  }
}
