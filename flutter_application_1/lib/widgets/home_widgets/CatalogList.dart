
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home_detail_page.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/CatalogImage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../widgets/themes.dart';



class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //to stop listview take full screen
      itemCount: CatalogModel.items?.length ,
      itemBuilder: (context,index){
        final catalog= CatalogModel.items![index];
        return InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(
            catalog: catalog
            )
          )
        ), //pushed name can not be done, need argument so push is used
          child: CatalogItem(catalog:catalog));
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
         Hero( //for animations
          tag: Key(catalog.id.toString()) ,
           child: CatalogImage(
              image: catalog.image,
            ),
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