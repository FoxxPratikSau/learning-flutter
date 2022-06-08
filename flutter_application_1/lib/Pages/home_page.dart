// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';


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
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        //iconTheme: IconThemeData(color: Colors.deepPurple),
        
        title: Text("Catalog App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        ? ListView.builder(
          itemCount: CatalogModel.items.length ,
          itemBuilder: (context,index) => ItemWidget(    //item widget is class made by me in item_widget.dart under wodgets folder
              item: CatalogModel.items[index],
            ),
          
        )
        :Center(
          child:CircularProgressIndicator(),
        )
      ),
     drawer: MyDrawer(),
    );
  }
}