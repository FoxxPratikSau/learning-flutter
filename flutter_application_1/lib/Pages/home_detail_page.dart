// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween, //to get max dist between two horizontal thing
                  //buttonPadding: Vx.mOnly(right: 16),
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red800.make(),
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
                    ).wh(100,50)
                  ],
                ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()) ,
            child: Image.network(catalog.image)
          ).p16().px32().h32(context),//padding given here to make it look good
          Expanded(
            child: VxArc(// making container arced
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.color(MyTheme.DarkBluishCOlor).make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                  ]).py64(),
              ),
            ))
        ]
        ),
      ),//Safe area leaves the top area of phone
    );
  }
}
