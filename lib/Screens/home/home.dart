import 'package:couper/Screens/checkout/checkout.dart';
import 'package:couper/Screens/deals/specials.dart';
import 'package:couper/Screens/profile/profile.dart';
import 'package:couper/Screens/store/store.dart';
import 'package:couper/configs/AppColors.dart';
import 'package:couper/widgets/bottom_app_bar.dart';
import 'package:couper/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _selectedTab(int index) {
    print(index);
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Checkout()),
          );
          break;
        case 1: 
          Navigator.push(context , MaterialPageRoute(builder: (context) => Store()));
          break;
        case 2:
          Navigator.push(context , MaterialPageRoute(builder: (context) => Profile()));
          break;
           case 3:
          Navigator.push(context , MaterialPageRoute(builder: (context) => Specials()));
          break;
          
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      child: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Scaffold(
            body: SafeArea(
              top: true,
              left: true,
              right: true,
              bottom: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Search Bar
                      SizedBox(
                        height: 20,
                      ),
                      //Info and shop description
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Tung Drini !',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.local_mall,
                                  color: Colors.grey[500],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Dyqani mbyllet ne oren 20:00')
                              ],
                            )
                          ],
                        ),
                      ),
                      // Navigation box
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0),
                        child: Container(
                            width: double.infinity,
                            height: 300.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.search,
                                          color: AppColors.red, size: 30),
                                      Text('kerko produkte',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Icon(Icons.keyboard_arrow_right,
                                          size: 30),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: 0.3,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.card_giftcard,
                                          color: AppColors.red, size: 30),
                                      Text('kuponat',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Icon(Icons.keyboard_arrow_right, size: 30)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: 0.3,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.favorite,
                                          color: AppColors.red, size: 30),
                                      Text('produktet tuaja',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Icon(Icons.keyboard_arrow_right, size: 30)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: 0.3,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.account_box,
                                          color: AppColors.red, size: 30),
                                      Text('kerko produkte',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Icon(Icons.keyboard_arrow_right, size: 30)
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      //Info for featured products
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Top Produkte',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Prej dates 30 Tetor')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildFeaturedProducts(),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: FABBottomAppBar(
              color: Colors.grey,
              selectedColor: Colors.blue,
              onTabSelected: _selectedTab,
              items: [
                FABBottomAppBarItem(iconData: Icons.home, text: ''),
                FABBottomAppBarItem(iconData: Icons.bookmark, text: ''),
                FABBottomAppBarItem(iconData: Icons.notifications, text: ''),
                FABBottomAppBarItem(iconData: Icons.person, text: ''),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              top: true,
              child: Container(
                child: SearchBar(hint: 'Kerko produkte ...'),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 20.0, spreadRadius: 0.0)
                ]),
              )),
        )
      ]),
    );
  }

  Widget _buildFeaturedProducts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 380,
            width: double.infinity,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: <Widget>[
                Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://images.ctfassets.net/u41cm62nxtp7/bppK2QmIwzXouAzmpiMwk/eba6aadcdb38ea29e22614e105484d0f/Lidl_Grocery_Store_FreshDeals_4119_SpecialsTile_SalmonFillets.jpg'),
                ),
                Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Thinly sliced for convenience lorem ipsum loreconvenience lorem ipsum lorem ipsum lorem ipsum ipsum lorconvenience lorem ipsum lorem ipsum lorem ipsum ipsum lorem ipsconvenience lorem ipsum lorem ipsum lorem ipsum ipsum lorem ipsem ipsconvenience lorem ipsum lorem ipsum lorem ipsum ipsum lorem ipsm ipsum lorem ipsum ipsum lorem ipsum convenience lorem ipsum lorem ipsum lorem ipsum ipsum lorem ips ipsum lorem ipsum ipsum lorem ipsum ipsum lorem ipsum',
                          style: TextStyle(fontSize: 15),
                          maxLines: 5),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
