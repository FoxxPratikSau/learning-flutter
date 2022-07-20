// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'dart:convert';
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/CatalogHeader.dart';
import '../widgets/home_widgets/CatalogList.dart';

//import 'package:flutter_application_1/widgets/item_widget.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    loadData(); //new method
  }
  loadData() async {
      await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/File/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    


  }

  @override
  Widget build(BuildContext context) {
    int days =30;
    
    //final dummylist = List.generate(20,(index)=>CatalogModel.items[0]); //CatalogModel is class in catalog.dart under models folder
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.DarkBluishCOlor,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to make the text from left
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               CatalogHeader(),
               if(CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)
                CatalogList().py32().expand() //to take full screen
               else 
                  CircularProgressIndicator().centered().expand(),
                 
                
      
            ]
            ),
        ),
      ),
//       appBar: AppBar(
//         // backgroundColor: Colors.white,
//         // elevation: 0.0,
//         //iconTheme: IconThemeData(color: Colors.deepPurple),
        
//         title: Text("Catalog App"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null )
//         ? 
// //FOR LIST VIEW

//         // ListView.builder(
//         //   itemCount: CatalogModel.items?.length ,
//         //   itemBuilder: (context,index) => ItemWidget(    //item widget is class made by me in item_widget.dart under wodgets folder
//         //       item: CatalogModel.items![index],
//         //     ),
          
//         // )


// //FOR GRID VIEW
//         GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             ), 
//           itemBuilder: (context,index){
//             final item= CatalogModel.items![index];
//             return Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15)),
//               child: GridTile(
//                 header: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                   ),
//                   padding: EdgeInsets.all(12),
//                   child: Text(item.name, style: TextStyle(color: Colors.white),)
//                 ),
//                 child: Image.network(
//                   item.image,
//                   ),
//                 footer: Container(
//                   child: Text(
//                     item.price.toString(),
//                     style: TextStyle(color: Colors.white),
//                     ),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                     ),
//                 ),
//               )
//             );
//           },
//           itemCount: CatalogModel.items?.length ,
//           )
//         :Center(
//           child:CircularProgressIndicator(),
//         )
//       ),
//      drawer: MyDrawer(),
    );
  }
}