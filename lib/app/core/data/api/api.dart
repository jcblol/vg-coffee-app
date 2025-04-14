import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vg_coffee_app/app/core/data/api/endpoints.dart';
import 'package:vg_coffee_app/app/core/data/api/rest_client.dart';

@singleton
class API {
  API(this._client);
  final RestClient _client;

  Future<Response<dynamic>> getCoffeeImageUrl() async {
    return _client.get(
      Endpoints.randomCoffee,
      apiType: ApiType.public,
    );
  }
}
