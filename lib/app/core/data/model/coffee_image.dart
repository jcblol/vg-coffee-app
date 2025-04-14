// coverage:ignore-file

import 'package:freezed_annotation/freezed_annotation.dart';
part 'coffee_image.freezed.dart';
part 'coffee_image.g.dart';

@freezed
class CoffeeImage with _$CoffeeImage {
  const factory CoffeeImage({
    required String file,
  }) = _CoffeeImage;
  factory CoffeeImage.fromJson(Map<String, dynamic> json) =>
      _$CoffeeImageFromJson(json);
}
