// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoffeeImage _$CoffeeImageFromJson(Map<String, dynamic> json) {
  return _CoffeeImage.fromJson(json);
}

/// @nodoc
mixin _$CoffeeImage {
  String get file => throw _privateConstructorUsedError;

  /// Serializes this CoffeeImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeImageCopyWith<CoffeeImage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeImageCopyWith<$Res> {
  factory $CoffeeImageCopyWith(CoffeeImage value, $Res Function(CoffeeImage) then) =
      _$CoffeeImageCopyWithImpl<$Res, CoffeeImage>;
  @useResult
  $Res call({String file});
}

/// @nodoc
class _$CoffeeImageCopyWithImpl<$Res, $Val extends CoffeeImage> implements $CoffeeImageCopyWith<$Res> {
  _$CoffeeImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeImageImplCopyWith<$Res> implements $CoffeeImageCopyWith<$Res> {
  factory _$$CoffeeImageImplCopyWith(_$CoffeeImageImpl value, $Res Function(_$CoffeeImageImpl) then) =
      __$$CoffeeImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String file});
}

/// @nodoc
class __$$CoffeeImageImplCopyWithImpl<$Res> extends _$CoffeeImageCopyWithImpl<$Res, _$CoffeeImageImpl>
    implements _$$CoffeeImageImplCopyWith<$Res> {
  __$$CoffeeImageImplCopyWithImpl(_$CoffeeImageImpl _value, $Res Function(_$CoffeeImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$CoffeeImageImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeImageImpl implements _CoffeeImage {
  const _$CoffeeImageImpl({required this.file});

  factory _$CoffeeImageImpl.fromJson(Map<String, dynamic> json) => _$$CoffeeImageImplFromJson(json);

  @override
  final String file;

  @override
  String toString() {
    return 'CoffeeImage(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeImageImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeImageImplCopyWith<_$CoffeeImageImpl> get copyWith =>
      __$$CoffeeImageImplCopyWithImpl<_$CoffeeImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeImageImplToJson(
      this,
    );
  }
}

abstract class _CoffeeImage implements CoffeeImage {
  const factory _CoffeeImage({required final String file}) = _$CoffeeImageImpl;

  factory _CoffeeImage.fromJson(Map<String, dynamic> json) = _$CoffeeImageImpl.fromJson;

  @override
  String get file;

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeImageImplCopyWith<_$CoffeeImageImpl> get copyWith => throw _privateConstructorUsedError;
}
