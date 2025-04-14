// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_image_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoffeeImageViewerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentPage) loadImagesEvent,
    required TResult Function(String url) toggleSaveImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentPage)? loadImagesEvent,
    TResult? Function(String url)? toggleSaveImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentPage)? loadImagesEvent,
    TResult Function(String url)? toggleSaveImageEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadImagesEvent value) loadImagesEvent,
    required TResult Function(ToggleSaveImageEvent value) toggleSaveImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadImagesEvent value)? loadImagesEvent,
    TResult? Function(ToggleSaveImageEvent value)? toggleSaveImageEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadImagesEvent value)? loadImagesEvent,
    TResult Function(ToggleSaveImageEvent value)? toggleSaveImageEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeImageViewerEventCopyWith<$Res> {
  factory $CoffeeImageViewerEventCopyWith(CoffeeImageViewerEvent value,
          $Res Function(CoffeeImageViewerEvent) then) =
      _$CoffeeImageViewerEventCopyWithImpl<$Res, CoffeeImageViewerEvent>;
}

/// @nodoc
class _$CoffeeImageViewerEventCopyWithImpl<$Res,
        $Val extends CoffeeImageViewerEvent>
    implements $CoffeeImageViewerEventCopyWith<$Res> {
  _$CoffeeImageViewerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImagesEventImplCopyWith<$Res> {
  factory _$$LoadImagesEventImplCopyWith(_$LoadImagesEventImpl value,
          $Res Function(_$LoadImagesEventImpl) then) =
      __$$LoadImagesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int currentPage});
}

/// @nodoc
class __$$LoadImagesEventImplCopyWithImpl<$Res>
    extends _$CoffeeImageViewerEventCopyWithImpl<$Res, _$LoadImagesEventImpl>
    implements _$$LoadImagesEventImplCopyWith<$Res> {
  __$$LoadImagesEventImplCopyWithImpl(
      _$LoadImagesEventImpl _value, $Res Function(_$LoadImagesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
  }) {
    return _then(_$LoadImagesEventImpl(
      null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadImagesEventImpl implements LoadImagesEvent {
  const _$LoadImagesEventImpl(this.currentPage);

  @override
  final int currentPage;

  @override
  String toString() {
    return 'CoffeeImageViewerEvent.loadImagesEvent(currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImagesEventImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage);

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImagesEventImplCopyWith<_$LoadImagesEventImpl> get copyWith =>
      __$$LoadImagesEventImplCopyWithImpl<_$LoadImagesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentPage) loadImagesEvent,
    required TResult Function(String url) toggleSaveImageEvent,
  }) {
    return loadImagesEvent(currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentPage)? loadImagesEvent,
    TResult? Function(String url)? toggleSaveImageEvent,
  }) {
    return loadImagesEvent?.call(currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentPage)? loadImagesEvent,
    TResult Function(String url)? toggleSaveImageEvent,
    required TResult orElse(),
  }) {
    if (loadImagesEvent != null) {
      return loadImagesEvent(currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadImagesEvent value) loadImagesEvent,
    required TResult Function(ToggleSaveImageEvent value) toggleSaveImageEvent,
  }) {
    return loadImagesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadImagesEvent value)? loadImagesEvent,
    TResult? Function(ToggleSaveImageEvent value)? toggleSaveImageEvent,
  }) {
    return loadImagesEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadImagesEvent value)? loadImagesEvent,
    TResult Function(ToggleSaveImageEvent value)? toggleSaveImageEvent,
    required TResult orElse(),
  }) {
    if (loadImagesEvent != null) {
      return loadImagesEvent(this);
    }
    return orElse();
  }
}

abstract class LoadImagesEvent implements CoffeeImageViewerEvent {
  const factory LoadImagesEvent(final int currentPage) = _$LoadImagesEventImpl;

  int get currentPage;

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImagesEventImplCopyWith<_$LoadImagesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleSaveImageEventImplCopyWith<$Res> {
  factory _$$ToggleSaveImageEventImplCopyWith(_$ToggleSaveImageEventImpl value,
          $Res Function(_$ToggleSaveImageEventImpl) then) =
      __$$ToggleSaveImageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$ToggleSaveImageEventImplCopyWithImpl<$Res>
    extends _$CoffeeImageViewerEventCopyWithImpl<$Res,
        _$ToggleSaveImageEventImpl>
    implements _$$ToggleSaveImageEventImplCopyWith<$Res> {
  __$$ToggleSaveImageEventImplCopyWithImpl(_$ToggleSaveImageEventImpl _value,
      $Res Function(_$ToggleSaveImageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$ToggleSaveImageEventImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleSaveImageEventImpl implements ToggleSaveImageEvent {
  const _$ToggleSaveImageEventImpl(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'CoffeeImageViewerEvent.toggleSaveImageEvent(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSaveImageEventImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSaveImageEventImplCopyWith<_$ToggleSaveImageEventImpl>
      get copyWith =>
          __$$ToggleSaveImageEventImplCopyWithImpl<_$ToggleSaveImageEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentPage) loadImagesEvent,
    required TResult Function(String url) toggleSaveImageEvent,
  }) {
    return toggleSaveImageEvent(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentPage)? loadImagesEvent,
    TResult? Function(String url)? toggleSaveImageEvent,
  }) {
    return toggleSaveImageEvent?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentPage)? loadImagesEvent,
    TResult Function(String url)? toggleSaveImageEvent,
    required TResult orElse(),
  }) {
    if (toggleSaveImageEvent != null) {
      return toggleSaveImageEvent(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadImagesEvent value) loadImagesEvent,
    required TResult Function(ToggleSaveImageEvent value) toggleSaveImageEvent,
  }) {
    return toggleSaveImageEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadImagesEvent value)? loadImagesEvent,
    TResult? Function(ToggleSaveImageEvent value)? toggleSaveImageEvent,
  }) {
    return toggleSaveImageEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadImagesEvent value)? loadImagesEvent,
    TResult Function(ToggleSaveImageEvent value)? toggleSaveImageEvent,
    required TResult orElse(),
  }) {
    if (toggleSaveImageEvent != null) {
      return toggleSaveImageEvent(this);
    }
    return orElse();
  }
}

abstract class ToggleSaveImageEvent implements CoffeeImageViewerEvent {
  const factory ToggleSaveImageEvent(final String url) =
      _$ToggleSaveImageEventImpl;

  String get url;

  /// Create a copy of CoffeeImageViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleSaveImageEventImplCopyWith<_$ToggleSaveImageEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CoffeeImageViewerState _$CoffeeImageViewerStateFromJson(
    Map<String, dynamic> json) {
  return _CoffeeImageViewerState.fromJson(json);
}

/// @nodoc
mixin _$CoffeeImageViewerState {
  bool get loadingImage => throw _privateConstructorUsedError;
  bool get savingImage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get savedImages => throw _privateConstructorUsedError;
  Set<int> get imageWindow => throw _privateConstructorUsedError;

  /// Serializes this CoffeeImageViewerState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeImageViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeImageViewerStateCopyWith<CoffeeImageViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeImageViewerStateCopyWith<$Res> {
  factory $CoffeeImageViewerStateCopyWith(CoffeeImageViewerState value,
          $Res Function(CoffeeImageViewerState) then) =
      _$CoffeeImageViewerStateCopyWithImpl<$Res, CoffeeImageViewerState>;
  @useResult
  $Res call(
      {bool loadingImage,
      bool savingImage,
      int currentPage,
      String? errorMessage,
      List<String> images,
      List<String> savedImages,
      Set<int> imageWindow});
}

/// @nodoc
class _$CoffeeImageViewerStateCopyWithImpl<$Res,
        $Val extends CoffeeImageViewerState>
    implements $CoffeeImageViewerStateCopyWith<$Res> {
  _$CoffeeImageViewerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeImageViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingImage = null,
    Object? savingImage = null,
    Object? currentPage = null,
    Object? errorMessage = freezed,
    Object? images = null,
    Object? savedImages = null,
    Object? imageWindow = null,
  }) {
    return _then(_value.copyWith(
      loadingImage: null == loadingImage
          ? _value.loadingImage
          : loadingImage // ignore: cast_nullable_to_non_nullable
              as bool,
      savingImage: null == savingImage
          ? _value.savingImage
          : savingImage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedImages: null == savedImages
          ? _value.savedImages
          : savedImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageWindow: null == imageWindow
          ? _value.imageWindow
          : imageWindow // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeImageViewerStateImplCopyWith<$Res>
    implements $CoffeeImageViewerStateCopyWith<$Res> {
  factory _$$CoffeeImageViewerStateImplCopyWith(
          _$CoffeeImageViewerStateImpl value,
          $Res Function(_$CoffeeImageViewerStateImpl) then) =
      __$$CoffeeImageViewerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loadingImage,
      bool savingImage,
      int currentPage,
      String? errorMessage,
      List<String> images,
      List<String> savedImages,
      Set<int> imageWindow});
}

/// @nodoc
class __$$CoffeeImageViewerStateImplCopyWithImpl<$Res>
    extends _$CoffeeImageViewerStateCopyWithImpl<$Res,
        _$CoffeeImageViewerStateImpl>
    implements _$$CoffeeImageViewerStateImplCopyWith<$Res> {
  __$$CoffeeImageViewerStateImplCopyWithImpl(
      _$CoffeeImageViewerStateImpl _value,
      $Res Function(_$CoffeeImageViewerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeImageViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingImage = null,
    Object? savingImage = null,
    Object? currentPage = null,
    Object? errorMessage = freezed,
    Object? images = null,
    Object? savedImages = null,
    Object? imageWindow = null,
  }) {
    return _then(_$CoffeeImageViewerStateImpl(
      loadingImage: null == loadingImage
          ? _value.loadingImage
          : loadingImage // ignore: cast_nullable_to_non_nullable
              as bool,
      savingImage: null == savingImage
          ? _value.savingImage
          : savingImage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedImages: null == savedImages
          ? _value._savedImages
          : savedImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageWindow: null == imageWindow
          ? _value._imageWindow
          : imageWindow // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeImageViewerStateImpl implements _CoffeeImageViewerState {
  const _$CoffeeImageViewerStateImpl(
      {this.loadingImage = false,
      this.savingImage = false,
      this.currentPage = 0,
      this.errorMessage,
      final List<String> images = const [],
      final List<String> savedImages = const [],
      final Set<int> imageWindow = const {}})
      : _images = images,
        _savedImages = savedImages,
        _imageWindow = imageWindow;

  factory _$CoffeeImageViewerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeImageViewerStateImplFromJson(json);

  @override
  @JsonKey()
  final bool loadingImage;
  @override
  @JsonKey()
  final bool savingImage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  final String? errorMessage;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _savedImages;
  @override
  @JsonKey()
  List<String> get savedImages {
    if (_savedImages is EqualUnmodifiableListView) return _savedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedImages);
  }

  final Set<int> _imageWindow;
  @override
  @JsonKey()
  Set<int> get imageWindow {
    if (_imageWindow is EqualUnmodifiableSetView) return _imageWindow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_imageWindow);
  }

  @override
  String toString() {
    return 'CoffeeImageViewerState(loadingImage: $loadingImage, savingImage: $savingImage, currentPage: $currentPage, errorMessage: $errorMessage, images: $images, savedImages: $savedImages, imageWindow: $imageWindow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeImageViewerStateImpl &&
            (identical(other.loadingImage, loadingImage) ||
                other.loadingImage == loadingImage) &&
            (identical(other.savingImage, savingImage) ||
                other.savingImage == savingImage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._savedImages, _savedImages) &&
            const DeepCollectionEquality()
                .equals(other._imageWindow, _imageWindow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingImage,
      savingImage,
      currentPage,
      errorMessage,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_savedImages),
      const DeepCollectionEquality().hash(_imageWindow));

  /// Create a copy of CoffeeImageViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeImageViewerStateImplCopyWith<_$CoffeeImageViewerStateImpl>
      get copyWith => __$$CoffeeImageViewerStateImplCopyWithImpl<
          _$CoffeeImageViewerStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeImageViewerStateImplToJson(
      this,
    );
  }
}

abstract class _CoffeeImageViewerState implements CoffeeImageViewerState {
  const factory _CoffeeImageViewerState(
      {final bool loadingImage,
      final bool savingImage,
      final int currentPage,
      final String? errorMessage,
      final List<String> images,
      final List<String> savedImages,
      final Set<int> imageWindow}) = _$CoffeeImageViewerStateImpl;

  factory _CoffeeImageViewerState.fromJson(Map<String, dynamic> json) =
      _$CoffeeImageViewerStateImpl.fromJson;

  @override
  bool get loadingImage;
  @override
  bool get savingImage;
  @override
  int get currentPage;
  @override
  String? get errorMessage;
  @override
  List<String> get images;
  @override
  List<String> get savedImages;
  @override
  Set<int> get imageWindow;

  /// Create a copy of CoffeeImageViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeImageViewerStateImplCopyWith<_$CoffeeImageViewerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
