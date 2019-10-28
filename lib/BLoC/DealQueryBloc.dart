import 'dart:async';

import 'package:couper/DataLayer/couper_client.dart';
import 'package:couper/Models/DealsDto.dart';

import 'bloc.dart';

class DealQueryBloc implements Bloc {
  final _controller = StreamController<List<DealsDto>>();
  final _client = CouperClient();
  Stream<List<DealsDto>> get dealStream => _controller.stream;

  void getCurrentDeals() async {
    // 1
    final results = await _client.getCurrentDeals();
    if(results != null)
    {
        _controller.sink.add(results);
    }
  }

  @override
  void dispose() {
    _controller.close();
  }
}
