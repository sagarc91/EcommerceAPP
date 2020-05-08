import 'package:ecommerce_app/Services/getRankingsData.dart';
import 'package:ecommerce_app/podo/Rankings.dart';
import 'package:ecommerce_app/screens/ProductsRankings.dart';
import 'package:flutter/material.dart';

class MostViewProducts extends StatefulWidget {
  @override
  _MostViewProductsState createState() => _MostViewProductsState();
}

class _MostViewProductsState extends State<MostViewProducts> {
  final GetRankings httpService = GetRankings();
  Future<List<Rankings>> rankingdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rankingdata = httpService.getRankings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rankings"),
      ),
      body: FutureBuilder(
        future: httpService.getRankings(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Rankings>> snapshot) {
          print("SNAPSHOTDATA:  ${snapshot.data}");

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data?.isEmpty ?? true)
              return Center(
                  child: Text(
                    'No data found',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ));
            else
              print("ItemCOUNT ${snapshot.data.length}");
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: GestureDetector(
                      child: Card(
                        child: Center(
                          child: Text("${snapshot.data[index].ranking}"),
                        ),
                      ),
                      onTap: (){
                        print(snapshot.data[index].products);
                        if(snapshot.data[index].products.isEmpty){
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Oops! No Data Found",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            backgroundColor: Colors.red,
                          ));
                        }else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductRankingScreen(products: snapshot.data[index].products, index: index)));
                        }
                      },
                    ),
                  );
                }); // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        },
      ),
    );
  }
}
