import 'package:auto_size_text/auto_size_text.dart';
import 'package:couper/Models/DealsDto.dart';
import 'package:flutter/material.dart';

class DealCard extends StatelessWidget {
  DealCard(this.deal, {@required this.index, this.onPress, Key key})
      : super(key: key);

  final int index;
  final Function onPress;
  final DealsDto deal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: NetworkImage(deal.imageUrl),
          ),
          AutoSizeText(
            deal.dealTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          AutoSizeText(
            deal.dealDescription,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          ),
          AutoSizeText("")
        ],
      ),
    );
  }
}
