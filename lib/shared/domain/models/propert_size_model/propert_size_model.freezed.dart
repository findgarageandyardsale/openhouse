// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'propert_size_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertSizeModel _$PropertSizeModelFromJson(Map<String, dynamic> json) {
  return _PropertSizeModel.fromJson(json);
}

/// @nodoc
mixin _$PropertSizeModel {
  @JsonKey(name: 'covered_area')
  double? get coveredArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_size')
  double? get lotSize => throw _privateConstructorUsedError;
  String? get bedrooms => throw _privateConstructorUsedError;
  String? get bathrooms => throw _privateConstructorUsedError;

  /// Serializes this PropertSizeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertSizeModelCopyWith<PropertSizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertSizeModelCopyWith<$Res> {
  factory $PropertSizeModelCopyWith(
          PropertSizeModel value, $Res Function(PropertSizeModel) then) =
      _$PropertSizeModelCopyWithImpl<$Res, PropertSizeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'covered_area') double? coveredArea,
      @JsonKey(name: 'lot_size') double? lotSize,
      String? bedrooms,
      String? bathrooms});
}

/// @nodoc
class _$PropertSizeModelCopyWithImpl<$Res, $Val extends PropertSizeModel>
    implements $PropertSizeModelCopyWith<$Res> {
  _$PropertSizeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coveredArea = freezed,
    Object? lotSize = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
  }) {
    return _then(_value.copyWith(
      coveredArea: freezed == coveredArea
          ? _value.coveredArea
          : coveredArea // ignore: cast_nullable_to_non_nullable
              as double?,
      lotSize: freezed == lotSize
          ? _value.lotSize
          : lotSize // ignore: cast_nullable_to_non_nullable
              as double?,
      bedrooms: freezed == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as String?,
      bathrooms: freezed == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertSizeModelImplCopyWith<$Res>
    implements $PropertSizeModelCopyWith<$Res> {
  factory _$$PropertSizeModelImplCopyWith(_$PropertSizeModelImpl value,
          $Res Function(_$PropertSizeModelImpl) then) =
      __$$PropertSizeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'covered_area') double? coveredArea,
      @JsonKey(name: 'lot_size') double? lotSize,
      String? bedrooms,
      String? bathrooms});
}

/// @nodoc
class __$$PropertSizeModelImplCopyWithImpl<$Res>
    extends _$PropertSizeModelCopyWithImpl<$Res, _$PropertSizeModelImpl>
    implements _$$PropertSizeModelImplCopyWith<$Res> {
  __$$PropertSizeModelImplCopyWithImpl(_$PropertSizeModelImpl _value,
      $Res Function(_$PropertSizeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coveredArea = freezed,
    Object? lotSize = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
  }) {
    return _then(_$PropertSizeModelImpl(
      coveredArea: freezed == coveredArea
          ? _value.coveredArea
          : coveredArea // ignore: cast_nullable_to_non_nullable
              as double?,
      lotSize: freezed == lotSize
          ? _value.lotSize
          : lotSize // ignore: cast_nullable_to_non_nullable
              as double?,
      bedrooms: freezed == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as String?,
      bathrooms: freezed == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertSizeModelImpl implements _PropertSizeModel {
  _$PropertSizeModelImpl(
      {@JsonKey(name: 'covered_area') this.coveredArea,
      @JsonKey(name: 'lot_size') this.lotSize,
      this.bedrooms,
      this.bathrooms});

  factory _$PropertSizeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertSizeModelImplFromJson(json);

  @override
  @JsonKey(name: 'covered_area')
  final double? coveredArea;
  @override
  @JsonKey(name: 'lot_size')
  final double? lotSize;
  @override
  final String? bedrooms;
  @override
  final String? bathrooms;

  @override
  String toString() {
    return 'PropertSizeModel(coveredArea: $coveredArea, lotSize: $lotSize, bedrooms: $bedrooms, bathrooms: $bathrooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertSizeModelImpl &&
            (identical(other.coveredArea, coveredArea) ||
                other.coveredArea == coveredArea) &&
            (identical(other.lotSize, lotSize) || other.lotSize == lotSize) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, coveredArea, lotSize, bedrooms, bathrooms);

  /// Create a copy of PropertSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertSizeModelImplCopyWith<_$PropertSizeModelImpl> get copyWith =>
      __$$PropertSizeModelImplCopyWithImpl<_$PropertSizeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertSizeModelImplToJson(
      this,
    );
  }
}

abstract class _PropertSizeModel implements PropertSizeModel {
  factory _PropertSizeModel(
      {@JsonKey(name: 'covered_area') final double? coveredArea,
      @JsonKey(name: 'lot_size') final double? lotSize,
      final String? bedrooms,
      final String? bathrooms}) = _$PropertSizeModelImpl;

  factory _PropertSizeModel.fromJson(Map<String, dynamic> json) =
      _$PropertSizeModelImpl.fromJson;

  @override
  @JsonKey(name: 'covered_area')
  double? get coveredArea;
  @override
  @JsonKey(name: 'lot_size')
  double? get lotSize;
  @override
  String? get bedrooms;
  @override
  String? get bathrooms;

  /// Create a copy of PropertSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertSizeModelImplCopyWith<_$PropertSizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
