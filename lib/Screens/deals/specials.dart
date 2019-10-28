import 'package:couper/BLoC/DealQueryBloc.dart';
import 'package:couper/Models/DealsDto.dart';
import 'package:couper/Screens/deals/special_details.dart';
import 'package:couper/Screens/deals/widgets/deal_card.dart';
import 'package:couper/configs/AppColors.dart';
import 'package:flutter/material.dart';

class Specials extends StatefulWidget {
  Specials({Key key}) : super(key: key);

  @override
  _SpecialsState createState() => _SpecialsState();
}

class _SpecialsState extends State<Specials> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = DealQueryBloc();
    bloc.getCurrentDeals();
    return Scaffold(
      body: SafeArea(
        top: true,
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 150.0,
                    floating: false,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Aksionet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Container(
                        decoration: BoxDecoration(color: AppColors.indigo),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "momentale"),
                          Tab(text: "se shpejti"),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: _buildResults(bloc)),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   // final bloc = DealQueryBloc();
  //   // bloc.getCurrentDeals();

  //   // return SafeArea(
  //   //     child: Scaffold(
  //   //   body: _buildResults(bloc),
  //   // ));
  // }

  Widget _buildResults(DealQueryBloc bloc) {
    return StreamBuilder<List<DealsDto>>(
        stream: bloc.dealStream,
        builder: (context, snapshot) {
          final results = snapshot.data;
          if (results == null) {
            return Center(child: CircularProgressIndicator());
          }
          if (results.isEmpty) {
            return Center(
              child: Text('Nuk ka aksione !'),
            );
          }
          return Flex(
            direction: Axis.vertical,
            children: <Widget>[_buildDealResults(results)],
          );
        });
  }

  Widget _buildDealResults(List<DealsDto> results) {
    return Expanded(
      flex: 1,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        itemCount: results.length,
        itemBuilder: (context, index) => DealCard(
          results[index],
          index: index,
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SpecialDetails(results[index])));
          },
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
