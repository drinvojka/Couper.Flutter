import 'package:couper/Models/ProductDto.dart';
import 'package:flutter/material.dart';

class ProductDealCard extends StatelessWidget {
  ProductDealCard(this.product, {Key key, this.index}) : super(key: key);

  final ProductDealDto product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 5,),
          Image(
            image: NetworkImage(product.product.imageUrl, scale: 1.0),
            height: 100,
            width: 100,
          ),
          Text("${product.dealPrice}€ EUR*",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
          Text(product.product.name),
          SizedBox(
            height: 10,
          ),
          Text(
            product.product.description,
            textAlign: TextAlign.center,
          ),
          Container(width: double.infinity, height: 0.3,color: Colors.grey),
          SizedBox(height: 5,),
          Text('add to list +' , style: TextStyle(letterSpacing: 2 , color: Colors.blue , fontSize: 16 , fontWeight: FontWeight.bold,)),
          SizedBox(height: 5,)
        ],
      ),
    );
  }
}
