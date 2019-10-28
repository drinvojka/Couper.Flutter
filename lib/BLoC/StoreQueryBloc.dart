import 'dart:async';

import 'package:couper/DataLayer/couper_client.dart';
import 'package:couper/Models/StoreDto.dart';

import 'bloc.dart';

class StoreQueryBloc implements Bloc {
  final _controller = StreamController<List<StoreDto>>();
  final _client = CouperClient();
  Stream<List<StoreDto>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 1
    final results = await _client.fetchStores(query);
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
