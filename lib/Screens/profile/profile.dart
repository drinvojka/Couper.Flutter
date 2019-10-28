import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Collapsing Toolbar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
              background: Image.network(
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: _buildProfileInfo(),
    ));
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 3,
            width: 10,
            color: Colors.red,
          ),
          Text('my coupons',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.content_cut,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'View coupons',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right, size: 30)
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top:5.0,left:15.0 , right:15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.content_cut,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'View coupons',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right, size: 30)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(width: double.infinity, height: 0.5, color: Colors.grey,),
          SizedBox(height: 20,),
            Container(
            height: 3,
            width: 10,
            color: Colors.red,
          ),
          Text('about me',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(children: <Widget>[
              Container(width: 40 , height: 40, child:Icon(Icons.filter_1 , color: Colors.white, ),decoration: BoxDecoration(color: Colors.orange , shape:BoxShape.circle),),
              SizedBox(width: 30),
              Text('Drin Vojka' , style:TextStyle(fontWeight: FontWeight.w300) )
            ],),
          ),
          SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(children: <Widget>[
              Container(width: 40 , height: 40, child:Icon(Icons.filter_1 , color: Colors.white, ),decoration: BoxDecoration(color: Colors.orange , shape:BoxShape.circle),),
              SizedBox(width: 30),
              Text('Drin Vojka' , style:TextStyle(fontWeight: FontWeight.w300) )
            ],),
          )
        ],
      ),
    );
  }
}
