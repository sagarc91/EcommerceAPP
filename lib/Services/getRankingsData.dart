import 'dart:convert';
import 'package:ecommerce_app/podo/Rankings.dart';
import 'package:http/http.dart';

class GetRankings {

  Future<List<Rankings>> getRankings() async {
    final uri = 'https://stark-spire-93433.herokuapp.com/json';

    final res = await get(uri);
    //print("RES ${jsonDecode(res.body)}");

    Map<String, dynamic> map = jsonDecode(res.body);

    List<dynamic> resbody = map["rankings"];
    print('RANKINGS: $resbody');

    List<Rankings> categorydata = resbody
        .map(
          (dynamic item) => Rankings.fromJson(item),
    )
        .toList();

    return categorydata;
  }
}
