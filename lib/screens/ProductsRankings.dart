
import 'package:ecommerce_app/podo/Products.dart';
import 'package:ecommerce_app/podo/ProductsData.dart';
import 'package:ecommerce_app/podo/RankingProducts.dart';
import 'package:ecommerce_app/podo/Rankings.dart';
import 'package:ecommerce_app/utils/CommonActionBar.dart';
import 'package:flutter/material.dart';

class ProductRankingScreen extends StatefulWidget {
  final List<RankingProducts> products;
  final int index;

  ProductRankingScreen({@required this.products, this.index});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductRankingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INDEXCLICK ${widget.index}");
  }

  Widget renderText(index){

    if(index == 0){
      return Text(
        "Viewcount : ${widget.products[index].viewCount}",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black),
      );
    }else if(index == 1){
      return Text(
        "Ordercount : ${widget.products[index].orderCount}",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black),
      );
    }else if(index == 2){
      return Text(
        "Shares : ${widget.products[index].shares}",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C202C),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: ActionBar(
            title: "Products Rankings",
          )),
      body: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            print("Categories: ${widget.products[index].viewCount}");
            return GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "ID : ${widget.products[index].id}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),

                          renderText(widget.index),

                          SizedBox(
                            height: 10,
                          ),

                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              onTap: () {
                print("nothing");
              },
            );
          }),// snapshot.data  :- get your object which is pass from your downloadData() function
    );
  }
}
