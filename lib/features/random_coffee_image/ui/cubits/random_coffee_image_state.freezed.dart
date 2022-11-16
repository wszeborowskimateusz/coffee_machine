// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'random_coffee_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RandomCoffeeImageState {
  RandomCoffeeImageStatus get status => throw _privateConstructorUsedError;
  SavingToFavouriteState get savingToFavouriteState =>
      throw _privateConstructorUsedError;
  MatchEngine? get matchEngine => throw _privateConstructorUsedError;
  List<CoffeeImage>? get randomCoffeeImages =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RandomCoffeeImageStateCopyWith<RandomCoffeeImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomCoffeeImageStateCopyWith<$Res> {
  factory $RandomCoffeeImageStateCopyWith(RandomCoffeeImageState value,
          $Res Function(RandomCoffeeImageState) then) =
      _$RandomCoffeeImageStateCopyWithImpl<$Res, RandomCoffeeImageState>;
  @useResult
  $Res call(
      {RandomCoffeeImageStatus status,
      SavingToFavouriteState savingToFavouriteState,
      MatchEngine? matchEngine,
      List<CoffeeImage>? randomCoffeeImages});
}

/// @nodoc
class _$RandomCoffeeImageStateCopyWithImpl<$Res,
        $Val extends RandomCoffeeImageState>
    implements $RandomCoffeeImageStateCopyWith<$Res> {
  _$RandomCoffeeImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? savingToFavouriteState = null,
    Object? matchEngine = freezed,
    Object? randomCoffeeImages = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RandomCoffeeImageStatus,
      savingToFavouriteState: null == savingToFavouriteState
          ? _value.savingToFavouriteState
          : savingToFavouriteState // ignore: cast_nullable_to_non_nullable
              as SavingToFavouriteState,
      matchEngine: freezed == matchEngine
          ? _value.matchEngine
          : matchEngine // ignore: cast_nullable_to_non_nullable
              as MatchEngine?,
      randomCoffeeImages: freezed == randomCoffeeImages
          ? _value.randomCoffeeImages
          : randomCoffeeImages // ignore: cast_nullable_to_non_nullable
              as List<CoffeeImage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RandomCoffeeImageStateCopyWith<$Res>
    implements $RandomCoffeeImageStateCopyWith<$Res> {
  factory _$$_RandomCoffeeImageStateCopyWith(_$_RandomCoffeeImageState value,
          $Res Function(_$_RandomCoffeeImageState) then) =
      __$$_RandomCoffeeImageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RandomCoffeeImageStatus status,
      SavingToFavouriteState savingToFavouriteState,
      MatchEngine? matchEngine,
      List<CoffeeImage>? randomCoffeeImages});
}

/// @nodoc
class __$$_RandomCoffeeImageStateCopyWithImpl<$Res>
    extends _$RandomCoffeeImageStateCopyWithImpl<$Res,
        _$_RandomCoffeeImageState>
    implements _$$_RandomCoffeeImageStateCopyWith<$Res> {
  __$$_RandomCoffeeImageStateCopyWithImpl(_$_RandomCoffeeImageState _value,
      $Res Function(_$_RandomCoffeeImageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? savingToFavouriteState = null,
    Object? matchEngine = freezed,
    Object? randomCoffeeImages = freezed,
  }) {
    return _then(_$_RandomCoffeeImageState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RandomCoffeeImageStatus,
      savingToFavouriteState: null == savingToFavouriteState
          ? _value.savingToFavouriteState
          : savingToFavouriteState // ignore: cast_nullable_to_non_nullable
              as SavingToFavouriteState,
      matchEngine: freezed == matchEngine
          ? _value.matchEngine
          : matchEngine // ignore: cast_nullable_to_non_nullable
              as MatchEngine?,
      randomCoffeeImages: freezed == randomCoffeeImages
          ? _value._randomCoffeeImages
          : randomCoffeeImages // ignore: cast_nullable_to_non_nullable
              as List<CoffeeImage>?,
    ));
  }
}

/// @nodoc

class _$_RandomCoffeeImageState implements _RandomCoffeeImageState {
  const _$_RandomCoffeeImageState(
      {required this.status,
      required this.savingToFavouriteState,
      this.matchEngine,
      final List<CoffeeImage>? randomCoffeeImages})
      : _randomCoffeeImages = randomCoffeeImages;

  @override
  final RandomCoffeeImageStatus status;
  @override
  final SavingToFavouriteState savingToFavouriteState;
  @override
  final MatchEngine? matchEngine;
  final List<CoffeeImage>? _randomCoffeeImages;
  @override
  List<CoffeeImage>? get randomCoffeeImages {
    final value = _randomCoffeeImages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RandomCoffeeImageState(status: $status, savingToFavouriteState: $savingToFavouriteState, matchEngine: $matchEngine, randomCoffeeImages: $randomCoffeeImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RandomCoffeeImageState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.savingToFavouriteState, savingToFavouriteState) ||
                other.savingToFavouriteState == savingToFavouriteState) &&
            (identical(other.matchEngine, matchEngine) ||
                other.matchEngine == matchEngine) &&
            const DeepCollectionEquality()
                .equals(other._randomCoffeeImages, _randomCoffeeImages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, savingToFavouriteState,
      matchEngine, const DeepCollectionEquality().hash(_randomCoffeeImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RandomCoffeeImageStateCopyWith<_$_RandomCoffeeImageState> get copyWith =>
      __$$_RandomCoffeeImageStateCopyWithImpl<_$_RandomCoffeeImageState>(
          this, _$identity);
}

abstract class _RandomCoffeeImageState implements RandomCoffeeImageState {
  const factory _RandomCoffeeImageState(
      {required final RandomCoffeeImageStatus status,
      required final SavingToFavouriteState savingToFavouriteState,
      final MatchEngine? matchEngine,
      final List<CoffeeImage>? randomCoffeeImages}) = _$_RandomCoffeeImageState;

  @override
  RandomCoffeeImageStatus get status;
  @override
  SavingToFavouriteState get savingToFavouriteState;
  @override
  MatchEngine? get matchEngine;
  @override
  List<CoffeeImage>? get randomCoffeeImages;
  @override
  @JsonKey(ignore: true)
  _$$_RandomCoffeeImageStateCopyWith<_$_RandomCoffeeImageState> get copyWith =>
      throw _privateConstructorUsedError;
}
