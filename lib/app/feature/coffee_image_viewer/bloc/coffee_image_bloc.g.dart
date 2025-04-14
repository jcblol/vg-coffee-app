// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file

part of 'coffee_image_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeImageViewerStateImpl _$$CoffeeImageViewerStateImplFromJson(Map<String, dynamic> json) =>
    _$CoffeeImageViewerStateImpl(
      loadingImage: json['loadingImage'] as bool? ?? false,
      savingImage: json['savingImage'] as bool? ?? false,
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      savedImages: (json['savedImages'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      imageWindow: (json['imageWindow'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toSet() ?? const {},
    );

Map<String, dynamic> _$$CoffeeImageViewerStateImplToJson(_$CoffeeImageViewerStateImpl instance) => <String, dynamic>{
      'loadingImage': instance.loadingImage,
      'savingImage': instance.savingImage,
      'currentPage': instance.currentPage,
      'errorMessage': instance.errorMessage,
      'images': instance.images,
      'savedImages': instance.savedImages,
      'imageWindow': instance.imageWindow.toList(),
    };
