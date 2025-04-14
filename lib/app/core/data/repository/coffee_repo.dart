import 'package:injectable/injectable.dart';
import 'package:vg_coffee_app/app/core/data/api/api.dart';
import 'package:vg_coffee_app/app/core/data/model/coffee_image.dart';

@lazySingleton
class CoffeeRepo {
  CoffeeRepo(this._api);
  final API _api;

  Future<CoffeeImage> getCoffeeImage() async {
    final response = await _api.getCoffeeImageUrl();
    return CoffeeImage.fromJson(response.data as Map<String, dynamic>);
  }
}
