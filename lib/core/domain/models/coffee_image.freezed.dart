// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoffeeImage _$CoffeeImageFromJson(Map<String, dynamic> json) {
  return _CoffeeImage.fromJson(json);
}

/// @nodoc
mixin _$CoffeeImage {
  @JsonKey(name: 'file')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeImageCopyWith<CoffeeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeImageCopyWith<$Res> {
  factory $CoffeeImageCopyWith(
          CoffeeImage value, $Res Function(CoffeeImage) then) =
      _$CoffeeImageCopyWithImpl<$Res, CoffeeImage>;
  @useResult
  $Res call({@JsonKey(name: 'file') String url});
}

/// @nodoc
class _$CoffeeImageCopyWithImpl<$Res, $Val extends CoffeeImage>
    implements $CoffeeImageCopyWith<$Res> {
  _$CoffeeImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoffeeImageCopyWith<$Res>
    implements $CoffeeImageCopyWith<$Res> {
  factory _$$_CoffeeImageCopyWith(
          _$_CoffeeImage value, $Res Function(_$_CoffeeImage) then) =
      __$$_CoffeeImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'file') String url});
}

/// @nodoc
class __$$_CoffeeImageCopyWithImpl<$Res>
    extends _$CoffeeImageCopyWithImpl<$Res, _$_CoffeeImage>
    implements _$$_CoffeeImageCopyWith<$Res> {
  __$$_CoffeeImageCopyWithImpl(
      _$_CoffeeImage _value, $Res Function(_$_CoffeeImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_CoffeeImage(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CoffeeImage implements _CoffeeImage {
  const _$_CoffeeImage({@JsonKey(name: 'file') required this.url});

  factory _$_CoffeeImage.fromJson(Map<String, dynamic> json) =>
      _$$_CoffeeImageFromJson(json);

  @override
  @JsonKey(name: 'file')
  final String url;

  @override
  String toString() {
    return 'CoffeeImage(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeImage &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoffeeImageCopyWith<_$_CoffeeImage> get copyWith =>
      __$$_CoffeeImageCopyWithImpl<_$_CoffeeImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoffeeImageToJson(
      this,
    );
  }
}

abstract class _CoffeeImage implements CoffeeImage {
  const factory _CoffeeImage(
      {@JsonKey(name: 'file') required final String url}) = _$_CoffeeImage;

  factory _CoffeeImage.fromJson(Map<String, dynamic> json) =
      _$_CoffeeImage.fromJson;

  @override
  @JsonKey(name: 'file')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeImageCopyWith<_$_CoffeeImage> get copyWith =>
      throw _privateConstructorUsedError;
}
