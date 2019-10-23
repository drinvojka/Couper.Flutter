
import 'dart:async';
import 'dart:convert' show json;
import 'package:couper/Models/StoreDto.dart';
import 'package:couper/configs/APIEndpoints.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CouperClient {

  Future<List<StoreDto>> fetchStores(String query) async {
    if(query == "")
      return null;
    final results = await request(path: 'search', parameters: {
      'parameter' : query
    });

    final stores = results
        .map<StoreDto>((json) => StoreDto.fromJson(json))
        .toList(growable: false);

    return stores;
  }

  Future<dynamic> request(
      {@required String path, Map<String, String> parameters}) async {
    final uri = Uri.http(APIEndpoints.devServer, '/api/store/search' , parameters);
    final results = await http.get(uri);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {'Accept': 'application/json'};
}


