// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';


class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days =30;
    final dummylist = List.generate(20,(index)=>CatalogModel.items[0]); //CatalogModel is class in catalog.dart under models folder
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
        child: ListView.builder(
          itemCount: dummylist.length ,
          itemBuilder: (context,index){
            return ItemWidget(    //item widget is class made by me in item_widget.dart under wodgets folder
              item: dummylist[index],
            );
          },
        ),
      ),
     drawer: MyDrawer(),
    );
  }
}