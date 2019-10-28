import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Checkout extends StatefulWidget {
  Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'skano këtë kod te arka',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500),
                  maxLines: 2,
                ),
                QrImage(
                  data: "1234567890",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text('skanoni këtë kod te arka për të fituar kupona dhe pikë',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.redAccent)),
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('kuponat dhe piket',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent),
                              child: Center(
                                  child: Text(
                                '4',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ))),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _goBack,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              top: true,
              child: Container(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 10, spreadRadius: 1)
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }

  _goBack(){
    Navigator.pop(context);
  }
}
