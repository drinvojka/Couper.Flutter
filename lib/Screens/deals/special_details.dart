import 'package:couper/Models/DealsDto.dart';
import 'package:couper/Models/ProductDto.dart';
import 'package:couper/Screens/deals/widgets/product_deal_card.dart';
import 'package:flutter/material.dart';

class SpecialDetails extends StatelessWidget {
  SpecialDetails(this.deal, {Key key}) : super(key: key);

  final DealsDto deal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 15,),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(deal.imageUrl))),
            ),
            SizedBox(width:15),
            Column(
              children: <Widget>[
                Text(deal.dealTitle),
                Text(deal.dealTitle),
                Text(deal.dealTitle),
              ],
            )
          ],
        ),
        Expanded(
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                itemCount: deal.dealProducts.length,
                itemBuilder: (context, index) => ProductDealCard(
                   deal.dealProducts[index],
                   index: index,
                ))),
      ],
    ));
  }
}
