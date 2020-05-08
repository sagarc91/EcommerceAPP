import 'package:ecommerce_app/Services/getEcomData.dart';
import 'package:ecommerce_app/podo/Categories.dart';
import 'package:ecommerce_app/screens/MostViewProducts.dart';
import 'package:ecommerce_app/screens/ProductsScreen.dart';
import 'package:ecommerce_app/utils/CommonActionBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetCategories httpService = GetCategories();
  Future<List<Categories>> categoriesdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesdata = httpService.getCategories();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecommerce APP"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sagar Chavan"),
              accountEmail: Text("sagarchavan491@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.blue
                    : Colors.white,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Products Ratings"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MostViewProducts()));
              },
            ),

          ],
        ),
        // Populate the Drawer in the next step.
      ),
      backgroundColor: Color(0xff1C202C),

      body: FutureBuilder(
        future: httpService.getCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Categories>> snapshot) {
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
                  print("Categories: ${snapshot.data[index].name}");
                  return Container(
                    height: 100,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: GestureDetector(
                      child: Card(
                        child: Center(
                          child: Text(snapshot.data[index].name),
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
                                      ProductScreen(products: snapshot.data[index].products)));
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
