// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CardItemTearOff {
  const _$CardItemTearOff();

  _CardItem call(
      {required String id, required String color, required String label}) {
    return _CardItem(
      id: id,
      color: color,
      label: label,
    );
  }
}

/// @nodoc
const $CardItem = _$CardItemTearOff();

/// @nodoc
mixin _$CardItem {
  String get id => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardItemCopyWith<CardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardItemCopyWith<$Res> {
  factory $CardItemCopyWith(CardItem value, $Res Function(CardItem) then) =
      _$CardItemCopyWithImpl<$Res>;
  $Res call({String id, String color, String label});
}

/// @nodoc
class _$CardItemCopyWithImpl<$Res> implements $CardItemCopyWith<$Res> {
  _$CardItemCopyWithImpl(this._value, this._then);

  final CardItem _value;
  // ignore: unused_field
  final $Res Function(CardItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CardItemCopyWith<$Res> implements $CardItemCopyWith<$Res> {
  factory _$CardItemCopyWith(_CardItem value, $Res Function(_CardItem) then) =
      __$CardItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String color, String label});
}

/// @nodoc
class __$CardItemCopyWithImpl<$Res> extends _$CardItemCopyWithImpl<$Res>
    implements _$CardItemCopyWith<$Res> {
  __$CardItemCopyWithImpl(_CardItem _value, $Res Function(_CardItem) _then)
      : super(_value, (v) => _then(v as _CardItem));

  @override
  _CardItem get _value => super._value as _CardItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? label = freezed,
  }) {
    return _then(_CardItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CardItem implements _CardItem {
  _$_CardItem({required this.id, required this.color, required this.label});

  @override
  final String id;
  @override
  final String color;
  @override
  final String label;

  @override
  String toString() {
    return 'CardItem(id: $id, color: $color, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, color, label);

  @JsonKey(ignore: true)
  @override
  _$CardItemCopyWith<_CardItem> get copyWith =>
      __$CardItemCopyWithImpl<_CardItem>(this, _$identity);
}

abstract class _CardItem implements CardItem {
  factory _CardItem(
      {required String id,
      required String color,
      required String label}) = _$_CardItem;

  @override
  String get id;
  @override
  String get color;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$CardItemCopyWith<_CardItem> get copyWith =>
      throw _privateConstructorUsedError;
}
