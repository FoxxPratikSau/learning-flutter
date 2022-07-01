// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

import 'package:velocity_x/velocity_x.dart';
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
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to make the text from left
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               CatalogHeader(),
               if(CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)
                CatalogList().expand()
               else 
                Center(
                  child: CircularProgressIndicator(),
                ) 
                
      
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to make the text from left
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               "Catalog App".text.xl5.bold.color(MyTheme.DarkBluishCOlor).make(),
               "Trending products".text.xl2.make(),
      
            ]
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //to stop listview take full screen
      itemCount: CatalogModel.items?.length ,
      itemBuilder: (context,index){
        final catalog= CatalogModel.items![index];
        return CatalogItem(catalog:catalog);
      },
      
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : assert(catalog!=null),
   super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         CatalogImage(
            image: catalog.image,
          ),
          Expanded(child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to start text from left  <------> left right
            mainAxisAlignment: MainAxisAlignment.center,// up-down alignment
            children: [
              catalog.name.text.lg.bold.color(MyTheme.DarkBluishCOlor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween, //to get max dist between two horizontal thing
                //buttonPadding: Vx.mOnly(right: 16),
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.DarkBluishCOlor,
                      ),

                      shape: MaterialStateProperty.all(
                        StadiumBorder(), 
                      )
                    ),
                    child: "Buy".text.make()
                  )
                ],
              ).pOnly(right: 8.0),
            ],
            )
          )
        ],
      ),
    ).white.roundedLg.square(150).make().p16();
  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) :super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Image.network(
            //catalog.image
            image,
          ).box.color(MyTheme.creamColor).make().p16().w32(context);
          //w is width, p is padding
  }
}
