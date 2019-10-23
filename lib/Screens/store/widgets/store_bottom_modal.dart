import 'package:flutter/material.dart';
class StoreBottomModal extends StatefulWidget {

  StoreBottomModal({Key key , this.noStore , this.storeListAvailable , this.storeInformationAvailable }) : super(key: key);

  final bool noStore;
  final bool storeListAvailable;
  final bool storeInformationAvailable;
  @override
  _StoreBottomModalState createState() => _StoreBottomModalState();
}

class _StoreBottomModalState extends State<StoreBottomModal> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.5,
      maxChildSize: 0.25,
      minChildSize: 0.25,
      builder: (BuildContext context, ScrollController scrollController) => Container(
       padding: EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          color: Color(0xFFFDFDFD),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: _getModalInfo(),
        )
    );
  }

  Widget _getModalInfo(){

      if(widget.noStore){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text('set my store' , style:TextStyle(color: Colors.green , fontSize: 15)),
                    SizedBox(width: 15,),
                    Icon(Icons.add_shopping_cart , size: 15 ,color: Colors.green)
                  ],)
                ],
            ),
          );
      }
      else if(widget.storeListAvailable){

      }
      else if(widget.storeInformationAvailable)
      {
        
      }
    
  }
}