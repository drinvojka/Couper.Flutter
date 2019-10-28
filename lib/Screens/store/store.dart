import 'dart:async';
import 'package:couper/BLoC/StoreQueryBloc.dart';
import 'package:couper/Models/StoreDto.dart';
import 'package:couper/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Store extends StatefulWidget {
  Store({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  GoogleMapController mapController ;
  Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};
  static const LatLng _center = const LatLng(42.662220, 21.157846);
  GlobalKey _slidePanelSizeKey = GlobalKey();
  Size _slidePanelSize = Size(0, 0);
  bool hasStores = false;
  

  @override
  void initState() {
    hasStores = false;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);
  }

  _onBuildCompleted(_) {
    _getSlidePanelSize();
  }

  _getSlidePanelSize() {
    final RenderBox slideRenderBox =
        _slidePanelSizeKey.currentContext.findRenderObject();
    final slidePanelSize = slideRenderBox.size;
    setState(() {
      _slidePanelSize = slidePanelSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = StoreQueryBloc();
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: GoogleMap(

                  initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 5,
                ),
                markers: _markers.values.toSet(),
                onMapCreated: (GoogleMapController controller){
                  mapController = controller;
                }),
          ),
          SafeArea(
            top: false,
            child: Stack(
              children: <Widget>[
                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey[300].withOpacity(1.0),
                            Colors.grey[300].withOpacity(1.0),
                            Colors.grey[300].withOpacity(0.9),
                            Colors.grey[300].withOpacity(0.8),
                            Colors.grey[300].withOpacity(0.1),
                          ],
                          stops: [
                            0.0,
                            0.5,
                            0.7,
                            0.8,
                            1.0
                          ]),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(width: 20, height: 5, color: Colors.red),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Emona Markets',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ))),
                Container(
                  transform: Matrix4.translationValues(0, 100, 0),
                  child: SearchBar(
                    hint: 'Kerko lokacione ... ',
                    suffixIcon: Icons.my_location,
                    onChanged: (query) => bloc.submitQuery(query),
                  ),
                ),
                SlidingUpPanel(
                    key: _slidePanelSizeKey,
                    minHeight: 200,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0)),
                    panel: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                          child: Container(
                            width: 30,
                            height: 3,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(child: _buildResults(bloc))
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getNoStoreSelected() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('set my store',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.add_shopping_cart, size: 20, color: Colors.green)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Prices vary but location - set a default store for personailzed pricing and specials',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text('zgjidh lokacion',
                      style: TextStyle(color: Colors.blue, fontSize: 18)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.keyboard_arrow_right, color: Colors.blue, size: 18)
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildResults(StoreQueryBloc bloc) {
    return StreamBuilder<List<StoreDto>>(
        stream: bloc.locationStream,
        builder: (context, snapshot) {
          final results = snapshot.data;
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data == null) {
                
            return CircularProgressIndicator();
          }
          if (results == null) {
            _markers.clear();
            return _getNoStoreSelected();
          }
          if (results.isEmpty) {
            return Center(child: Text('nuk ka resultate'));
          }

        
          

          _addMarkers(results);

          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(List<StoreDto> results) {
    // 2
      mapController.animateCamera(
              CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(
                results.first.longitude , results.first.latitude
              ) , zoom:  20.0))
            );
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView.separated(
        itemCount: results.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
          final location = results[index];
          return Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(location.storeName,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(location.address,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200)),
                    Text("${location.city} , ${location.zipCode}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200)),
                    Text('hapur nga 7am - 10pm',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('zgjidh dyqanin',
                    style: TextStyle(color: Colors.green, fontSize: 20))
              ],
            ),
          ));
        },
      ),
    );
  }

  void _addMarkers(List<StoreDto> results) {
    _markers.clear();
    for (final office in results) {
      final marker = Marker(
        markerId: MarkerId(office.storeId.toString()),
        position: LatLng(office.longitude, office.latitude),
        infoWindow: InfoWindow(
          title: office.storeName,
          snippet: office.address,
        ),
      );
      _markers[office.storeName] = marker;
    }
  }
}

class _onBuildCompleted {}
