
import 'package:ecommerce_app/podo/Products.dart';
import 'package:ecommerce_app/utils/CommonActionBar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final List<Products> products;

  ProductScreen({@required this.products});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C202C),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: ActionBar(
            title: "Products",
          )),
      body: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            print("Categories: ${widget.products[index].name}");
            return GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.products[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          widget.products[index].variants.isEmpty ? Center(child: Text("No Data Found"),) :
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Colors",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Row(
                                    children: widget.products[index].variants
                                        .toList()
                                        .map(
                                          (value) => Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        color: Colors.teal,
                                        child: Text('${value.color}', style: TextStyle(fontSize: 16, color: Colors.white),),
                                      ),
                                    )
                                        .toList()),

                                Text(
                                  "Size",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Row(
                                    children: widget.products[index].variants
                                        .toList()
                                        .map(
                                          (value) => Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff000000),
                                              width: 2,
                                            )),
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        child: Text('${value.size}'),
                                      ),
                                    )
                                        .toList()),

                                Text(
                                  "Price",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Row(
                                    children: widget.products[index].variants
                                        .toList()
                                        .map(
                                          (value) => Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                        ),
                                        child: Text('INR ${value.price}'),
                                      ),
                                    )
                                        .toList())
                              ],
                            ),
                          ) ,



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
          }), // snapshot.data  :- get your object which is pass from your downloadData() function
    );
  }
}
