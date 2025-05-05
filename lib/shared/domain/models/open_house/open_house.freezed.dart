// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailableTimeSlot _$AvailableTimeSlotFromJson(Map<String, dynamic> json) {
  return _AvailableTimeSlot.fromJson(json);
}

/// @nodoc
mixin _$AvailableTimeSlot {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool? get isEditable => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_id')
  String? get garageYardId => throw _privateConstructorUsedError;

  /// Serializes this AvailableTimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableTimeSlotCopyWith<AvailableTimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableTimeSlotCopyWith<$Res> {
  factory $AvailableTimeSlotCopyWith(
          AvailableTimeSlot value, $Res Function(AvailableTimeSlot) then) =
      _$AvailableTimeSlotCopyWithImpl<$Res, AvailableTimeSlot>;
  @useResult
  $Res call(
      {int? id,
      DateTime? date,
      bool? isEditable,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'property_id') String? garageYardId});
}

/// @nodoc
class _$AvailableTimeSlotCopyWithImpl<$Res, $Val extends AvailableTimeSlot>
    implements $AvailableTimeSlotCopyWith<$Res> {
  _$AvailableTimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? isEditable = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? garageYardId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      garageYardId: freezed == garageYardId
          ? _value.garageYardId
          : garageYardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableTimeSlotImplCopyWith<$Res>
    implements $AvailableTimeSlotCopyWith<$Res> {
  factory _$$AvailableTimeSlotImplCopyWith(_$AvailableTimeSlotImpl value,
          $Res Function(_$AvailableTimeSlotImpl) then) =
      __$$AvailableTimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? date,
      bool? isEditable,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'property_id') String? garageYardId});
}

/// @nodoc
class __$$AvailableTimeSlotImplCopyWithImpl<$Res>
    extends _$AvailableTimeSlotCopyWithImpl<$Res, _$AvailableTimeSlotImpl>
    implements _$$AvailableTimeSlotImplCopyWith<$Res> {
  __$$AvailableTimeSlotImplCopyWithImpl(_$AvailableTimeSlotImpl _value,
      $Res Function(_$AvailableTimeSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? isEditable = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? garageYardId = freezed,
  }) {
    return _then(_$AvailableTimeSlotImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      garageYardId: freezed == garageYardId
          ? _value.garageYardId
          : garageYardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableTimeSlotImpl
    with DiagnosticableTreeMixin
    implements _AvailableTimeSlot {
  const _$AvailableTimeSlotImpl(
      {this.id,
      this.date,
      this.isEditable,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'property_id') this.garageYardId});

  factory _$AvailableTimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableTimeSlotImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? date;
  @override
  final bool? isEditable;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'property_id')
  final String? garageYardId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AvailableTimeSlot(id: $id, date: $date, isEditable: $isEditable, startTime: $startTime, endTime: $endTime, garageYardId: $garageYardId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AvailableTimeSlot'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('isEditable', isEditable))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('garageYardId', garageYardId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableTimeSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.garageYardId, garageYardId) ||
                other.garageYardId == garageYardId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, date, isEditable, startTime, endTime, garageYardId);

  /// Create a copy of AvailableTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableTimeSlotImplCopyWith<_$AvailableTimeSlotImpl> get copyWith =>
      __$$AvailableTimeSlotImplCopyWithImpl<_$AvailableTimeSlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableTimeSlotImplToJson(
      this,
    );
  }
}

abstract class _AvailableTimeSlot implements AvailableTimeSlot {
  const factory _AvailableTimeSlot(
          {final int? id,
          final DateTime? date,
          final bool? isEditable,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime,
          @JsonKey(name: 'property_id') final String? garageYardId}) =
      _$AvailableTimeSlotImpl;

  factory _AvailableTimeSlot.fromJson(Map<String, dynamic> json) =
      _$AvailableTimeSlotImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get date;
  @override
  bool? get isEditable;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'property_id')
  String? get garageYardId;

  /// Create a copy of AvailableTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableTimeSlotImplCopyWith<_$AvailableTimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl with DiagnosticableTreeMixin implements _Category {
  const _$CategoryImpl({this.id, this.name});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category({final int? id, final String? name}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  int? get id => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_locality')
  String? get subLocality => throw _privateConstructorUsedError;
  String? get locality => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_throughfare')
  String? get subThoroughfare => throw _privateConstructorUsedError;
  String? get throughfare => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_admin_area')
  String? get subAdminArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_area')
  String? get adminArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line')
  String? get addressLine => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_code')
  String? get zipCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'apartment_number')
  String? get apartmentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_from_user')
  double? get distanceFromUser => throw _privateConstructorUsedError;

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {int? id,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'sub_locality') String? subLocality,
      String? locality,
      @JsonKey(name: 'sub_throughfare') String? subThoroughfare,
      String? throughfare,
      @JsonKey(name: 'sub_admin_area') String? subAdminArea,
      @JsonKey(name: 'admin_area') String? adminArea,
      @JsonKey(name: 'address_line') String? addressLine,
      @JsonKey(name: 'zip_code') String? zipCode,
      @JsonKey(name: 'apartment_number') String? apartmentNumber,
      @JsonKey(name: 'distance_from_user') double? distanceFromUser});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? subLocality = freezed,
    Object? locality = freezed,
    Object? subThoroughfare = freezed,
    Object? throughfare = freezed,
    Object? subAdminArea = freezed,
    Object? adminArea = freezed,
    Object? addressLine = freezed,
    Object? zipCode = freezed,
    Object? apartmentNumber = freezed,
    Object? distanceFromUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      subLocality: freezed == subLocality
          ? _value.subLocality
          : subLocality // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      subThoroughfare: freezed == subThoroughfare
          ? _value.subThoroughfare
          : subThoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      throughfare: freezed == throughfare
          ? _value.throughfare
          : throughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      subAdminArea: freezed == subAdminArea
          ? _value.subAdminArea
          : subAdminArea // ignore: cast_nullable_to_non_nullable
              as String?,
      adminArea: freezed == adminArea
          ? _value.adminArea
          : adminArea // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine: freezed == addressLine
          ? _value.addressLine
          : addressLine // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      apartmentNumber: freezed == apartmentNumber
          ? _value.apartmentNumber
          : apartmentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceFromUser: freezed == distanceFromUser
          ? _value.distanceFromUser
          : distanceFromUser // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'sub_locality') String? subLocality,
      String? locality,
      @JsonKey(name: 'sub_throughfare') String? subThoroughfare,
      String? throughfare,
      @JsonKey(name: 'sub_admin_area') String? subAdminArea,
      @JsonKey(name: 'admin_area') String? adminArea,
      @JsonKey(name: 'address_line') String? addressLine,
      @JsonKey(name: 'zip_code') String? zipCode,
      @JsonKey(name: 'apartment_number') String? apartmentNumber,
      @JsonKey(name: 'distance_from_user') double? distanceFromUser});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? subLocality = freezed,
    Object? locality = freezed,
    Object? subThoroughfare = freezed,
    Object? throughfare = freezed,
    Object? subAdminArea = freezed,
    Object? adminArea = freezed,
    Object? addressLine = freezed,
    Object? zipCode = freezed,
    Object? apartmentNumber = freezed,
    Object? distanceFromUser = freezed,
  }) {
    return _then(_$LocationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      subLocality: freezed == subLocality
          ? _value.subLocality
          : subLocality // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      subThoroughfare: freezed == subThoroughfare
          ? _value.subThoroughfare
          : subThoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      throughfare: freezed == throughfare
          ? _value.throughfare
          : throughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      subAdminArea: freezed == subAdminArea
          ? _value.subAdminArea
          : subAdminArea // ignore: cast_nullable_to_non_nullable
              as String?,
      adminArea: freezed == adminArea
          ? _value.adminArea
          : adminArea // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine: freezed == addressLine
          ? _value.addressLine
          : addressLine // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      apartmentNumber: freezed == apartmentNumber
          ? _value.apartmentNumber
          : apartmentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceFromUser: freezed == distanceFromUser
          ? _value.distanceFromUser
          : distanceFromUser // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl
    with DiagnosticableTreeMixin
    implements _LocationModel {
  const _$LocationModelImpl(
      {this.id,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'sub_locality') this.subLocality,
      this.locality,
      @JsonKey(name: 'sub_throughfare') this.subThoroughfare,
      this.throughfare,
      @JsonKey(name: 'sub_admin_area') this.subAdminArea,
      @JsonKey(name: 'admin_area') this.adminArea,
      @JsonKey(name: 'address_line') this.addressLine,
      @JsonKey(name: 'zip_code') this.zipCode,
      @JsonKey(name: 'apartment_number') this.apartmentNumber,
      @JsonKey(name: 'distance_from_user') this.distanceFromUser});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final int? id;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'sub_locality')
  final String? subLocality;
  @override
  final String? locality;
  @override
  @JsonKey(name: 'sub_throughfare')
  final String? subThoroughfare;
  @override
  final String? throughfare;
  @override
  @JsonKey(name: 'sub_admin_area')
  final String? subAdminArea;
  @override
  @JsonKey(name: 'admin_area')
  final String? adminArea;
  @override
  @JsonKey(name: 'address_line')
  final String? addressLine;
  @override
  @JsonKey(name: 'zip_code')
  final String? zipCode;
  @override
  @JsonKey(name: 'apartment_number')
  final String? apartmentNumber;
  @override
  @JsonKey(name: 'distance_from_user')
  final double? distanceFromUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationModel(id: $id, latitude: $latitude, longitude: $longitude, subLocality: $subLocality, locality: $locality, subThoroughfare: $subThoroughfare, throughfare: $throughfare, subAdminArea: $subAdminArea, adminArea: $adminArea, addressLine: $addressLine, zipCode: $zipCode, apartmentNumber: $apartmentNumber, distanceFromUser: $distanceFromUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('subLocality', subLocality))
      ..add(DiagnosticsProperty('locality', locality))
      ..add(DiagnosticsProperty('subThoroughfare', subThoroughfare))
      ..add(DiagnosticsProperty('throughfare', throughfare))
      ..add(DiagnosticsProperty('subAdminArea', subAdminArea))
      ..add(DiagnosticsProperty('adminArea', adminArea))
      ..add(DiagnosticsProperty('addressLine', addressLine))
      ..add(DiagnosticsProperty('zipCode', zipCode))
      ..add(DiagnosticsProperty('apartmentNumber', apartmentNumber))
      ..add(DiagnosticsProperty('distanceFromUser', distanceFromUser));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.subLocality, subLocality) ||
                other.subLocality == subLocality) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.subThoroughfare, subThoroughfare) ||
                other.subThoroughfare == subThoroughfare) &&
            (identical(other.throughfare, throughfare) ||
                other.throughfare == throughfare) &&
            (identical(other.subAdminArea, subAdminArea) ||
                other.subAdminArea == subAdminArea) &&
            (identical(other.adminArea, adminArea) ||
                other.adminArea == adminArea) &&
            (identical(other.addressLine, addressLine) ||
                other.addressLine == addressLine) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.apartmentNumber, apartmentNumber) ||
                other.apartmentNumber == apartmentNumber) &&
            (identical(other.distanceFromUser, distanceFromUser) ||
                other.distanceFromUser == distanceFromUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      latitude,
      longitude,
      subLocality,
      locality,
      subThoroughfare,
      throughfare,
      subAdminArea,
      adminArea,
      addressLine,
      zipCode,
      apartmentNumber,
      distanceFromUser);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {final int? id,
      final double? latitude,
      final double? longitude,
      @JsonKey(name: 'sub_locality') final String? subLocality,
      final String? locality,
      @JsonKey(name: 'sub_throughfare') final String? subThoroughfare,
      final String? throughfare,
      @JsonKey(name: 'sub_admin_area') final String? subAdminArea,
      @JsonKey(name: 'admin_area') final String? adminArea,
      @JsonKey(name: 'address_line') final String? addressLine,
      @JsonKey(name: 'zip_code') final String? zipCode,
      @JsonKey(name: 'apartment_number') final String? apartmentNumber,
      @JsonKey(name: 'distance_from_user')
      final double? distanceFromUser}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  int? get id;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'sub_locality')
  String? get subLocality;
  @override
  String? get locality;
  @override
  @JsonKey(name: 'sub_throughfare')
  String? get subThoroughfare;
  @override
  String? get throughfare;
  @override
  @JsonKey(name: 'sub_admin_area')
  String? get subAdminArea;
  @override
  @JsonKey(name: 'admin_area')
  String? get adminArea;
  @override
  @JsonKey(name: 'address_line')
  String? get addressLine;
  @override
  @JsonKey(name: 'zip_code')
  String? get zipCode;
  @override
  @JsonKey(name: 'apartment_number')
  String? get apartmentNumber;
  @override
  @JsonKey(name: 'distance_from_user')
  double? get distanceFromUser;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenHouse _$OpenHouseFromJson(Map<String, dynamic> json) {
  return _OpenHouse.fromJson(json);
}

/// @nodoc
mixin _$OpenHouse {
  LocationModel? get location => throw _privateConstructorUsedError;
  @JsonKey(readValue: readValueForId)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'property')
  OpenHouseProperty? get openHouseProperty =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  PropertySize? get propertySize => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  User? get createdBy => throw _privateConstructorUsedError;
  StatusEnum? get status => throw _privateConstructorUsedError;

  /// Serializes this OpenHouse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenHouseCopyWith<OpenHouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenHouseCopyWith<$Res> {
  factory $OpenHouseCopyWith(OpenHouse value, $Res Function(OpenHouse) then) =
      _$OpenHouseCopyWithImpl<$Res, OpenHouse>;
  @useResult
  $Res call(
      {LocationModel? location,
      @JsonKey(readValue: readValueForId) int? id,
      @JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'property') OpenHouseProperty? openHouseProperty,
      @JsonKey(name: 'size') PropertySize? propertySize,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'created_by') User? createdBy,
      StatusEnum? status});

  $LocationModelCopyWith<$Res>? get location;
  $OpenHousePropertyCopyWith<$Res>? get openHouseProperty;
  $PropertySizeCopyWith<$Res>? get propertySize;
  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$OpenHouseCopyWithImpl<$Res, $Val extends OpenHouse>
    implements $OpenHouseCopyWith<$Res> {
  _$OpenHouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = freezed,
    Object? transactionId = freezed,
    Object? openHouseProperty = freezed,
    Object? propertySize = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdBy = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      openHouseProperty: freezed == openHouseProperty
          ? _value.openHouseProperty
          : openHouseProperty // ignore: cast_nullable_to_non_nullable
              as OpenHouseProperty?,
      propertySize: freezed == propertySize
          ? _value.propertySize
          : propertySize // ignore: cast_nullable_to_non_nullable
              as PropertySize?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum?,
    ) as $Val);
  }

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpenHousePropertyCopyWith<$Res>? get openHouseProperty {
    if (_value.openHouseProperty == null) {
      return null;
    }

    return $OpenHousePropertyCopyWith<$Res>(_value.openHouseProperty!, (value) {
      return _then(_value.copyWith(openHouseProperty: value) as $Val);
    });
  }

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertySizeCopyWith<$Res>? get propertySize {
    if (_value.propertySize == null) {
      return null;
    }

    return $PropertySizeCopyWith<$Res>(_value.propertySize!, (value) {
      return _then(_value.copyWith(propertySize: value) as $Val);
    });
  }

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenHouseImplCopyWith<$Res>
    implements $OpenHouseCopyWith<$Res> {
  factory _$$OpenHouseImplCopyWith(
          _$OpenHouseImpl value, $Res Function(_$OpenHouseImpl) then) =
      __$$OpenHouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocationModel? location,
      @JsonKey(readValue: readValueForId) int? id,
      @JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'property') OpenHouseProperty? openHouseProperty,
      @JsonKey(name: 'size') PropertySize? propertySize,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'created_by') User? createdBy,
      StatusEnum? status});

  @override
  $LocationModelCopyWith<$Res>? get location;
  @override
  $OpenHousePropertyCopyWith<$Res>? get openHouseProperty;
  @override
  $PropertySizeCopyWith<$Res>? get propertySize;
  @override
  $UserCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$OpenHouseImplCopyWithImpl<$Res>
    extends _$OpenHouseCopyWithImpl<$Res, _$OpenHouseImpl>
    implements _$$OpenHouseImplCopyWith<$Res> {
  __$$OpenHouseImplCopyWithImpl(
      _$OpenHouseImpl _value, $Res Function(_$OpenHouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = freezed,
    Object? transactionId = freezed,
    Object? openHouseProperty = freezed,
    Object? propertySize = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdBy = freezed,
    Object? status = freezed,
  }) {
    return _then(_$OpenHouseImpl(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      openHouseProperty: freezed == openHouseProperty
          ? _value.openHouseProperty
          : openHouseProperty // ignore: cast_nullable_to_non_nullable
              as OpenHouseProperty?,
      propertySize: freezed == propertySize
          ? _value.propertySize
          : propertySize // ignore: cast_nullable_to_non_nullable
              as PropertySize?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenHouseImpl with DiagnosticableTreeMixin implements _OpenHouse {
  const _$OpenHouseImpl(
      {this.location,
      @JsonKey(readValue: readValueForId) this.id,
      @JsonKey(name: 'transaction_id') this.transactionId,
      @JsonKey(name: 'property') this.openHouseProperty,
      @JsonKey(name: 'size') this.propertySize,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'created_by') this.createdBy,
      this.status});

  factory _$OpenHouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenHouseImplFromJson(json);

  @override
  final LocationModel? location;
  @override
  @JsonKey(readValue: readValueForId)
  final int? id;
  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  @JsonKey(name: 'property')
  final OpenHouseProperty? openHouseProperty;
  @override
  @JsonKey(name: 'size')
  final PropertySize? propertySize;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'created_by')
  final User? createdBy;
  @override
  final StatusEnum? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OpenHouse(location: $location, id: $id, transactionId: $transactionId, openHouseProperty: $openHouseProperty, propertySize: $propertySize, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OpenHouse'))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('transactionId', transactionId))
      ..add(DiagnosticsProperty('openHouseProperty', openHouseProperty))
      ..add(DiagnosticsProperty('propertySize', propertySize))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenHouseImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.openHouseProperty, openHouseProperty) ||
                other.openHouseProperty == openHouseProperty) &&
            (identical(other.propertySize, propertySize) ||
                other.propertySize == propertySize) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, location, id, transactionId,
      openHouseProperty, propertySize, createdAt, updatedAt, createdBy, status);

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenHouseImplCopyWith<_$OpenHouseImpl> get copyWith =>
      __$$OpenHouseImplCopyWithImpl<_$OpenHouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenHouseImplToJson(
      this,
    );
  }
}

abstract class _OpenHouse implements OpenHouse {
  const factory _OpenHouse(
      {final LocationModel? location,
      @JsonKey(readValue: readValueForId) final int? id,
      @JsonKey(name: 'transaction_id') final String? transactionId,
      @JsonKey(name: 'property') final OpenHouseProperty? openHouseProperty,
      @JsonKey(name: 'size') final PropertySize? propertySize,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'created_by') final User? createdBy,
      final StatusEnum? status}) = _$OpenHouseImpl;

  factory _OpenHouse.fromJson(Map<String, dynamic> json) =
      _$OpenHouseImpl.fromJson;

  @override
  LocationModel? get location;
  @override
  @JsonKey(readValue: readValueForId)
  int? get id;
  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  @JsonKey(name: 'property')
  OpenHouseProperty? get openHouseProperty;
  @override
  @JsonKey(name: 'size')
  PropertySize? get propertySize;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'created_by')
  User? get createdBy;
  @override
  StatusEnum? get status;

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenHouseImplCopyWith<_$OpenHouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenHouseProperty _$OpenHousePropertyFromJson(Map<String, dynamic> json) {
  return _OpenHouseProperty.fromJson(json);
}

/// @nodoc
mixin _$OpenHouseProperty {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: ConvertTo.convertIntToDouble)
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<AttachmentModel>? get attachments => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  PropertyTypeModel? get propertyType => throw _privateConstructorUsedError;
  StatusEnum? get status => throw _privateConstructorUsedError;

  /// Serializes this OpenHouseProperty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenHousePropertyCopyWith<OpenHouseProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenHousePropertyCopyWith<$Res> {
  factory $OpenHousePropertyCopyWith(
          OpenHouseProperty value, $Res Function(OpenHouseProperty) then) =
      _$OpenHousePropertyCopyWithImpl<$Res, OpenHouseProperty>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      @JsonKey(fromJson: ConvertTo.convertIntToDouble) double? price,
      @JsonKey(name: 'images') List<AttachmentModel>? attachments,
      Category? category,
      @JsonKey(name: 'type') PropertyTypeModel? propertyType,
      StatusEnum? status});

  $CategoryCopyWith<$Res>? get category;
  $PropertyTypeModelCopyWith<$Res>? get propertyType;
}

/// @nodoc
class _$OpenHousePropertyCopyWithImpl<$Res, $Val extends OpenHouseProperty>
    implements $OpenHousePropertyCopyWith<$Res> {
  _$OpenHousePropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? attachments = freezed,
    Object? category = freezed,
    Object? propertyType = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyTypeModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum?,
    ) as $Val);
  }

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyTypeModelCopyWith<$Res>? get propertyType {
    if (_value.propertyType == null) {
      return null;
    }

    return $PropertyTypeModelCopyWith<$Res>(_value.propertyType!, (value) {
      return _then(_value.copyWith(propertyType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenHousePropertyImplCopyWith<$Res>
    implements $OpenHousePropertyCopyWith<$Res> {
  factory _$$OpenHousePropertyImplCopyWith(_$OpenHousePropertyImpl value,
          $Res Function(_$OpenHousePropertyImpl) then) =
      __$$OpenHousePropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      @JsonKey(fromJson: ConvertTo.convertIntToDouble) double? price,
      @JsonKey(name: 'images') List<AttachmentModel>? attachments,
      Category? category,
      @JsonKey(name: 'type') PropertyTypeModel? propertyType,
      StatusEnum? status});

  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $PropertyTypeModelCopyWith<$Res>? get propertyType;
}

/// @nodoc
class __$$OpenHousePropertyImplCopyWithImpl<$Res>
    extends _$OpenHousePropertyCopyWithImpl<$Res, _$OpenHousePropertyImpl>
    implements _$$OpenHousePropertyImplCopyWith<$Res> {
  __$$OpenHousePropertyImplCopyWithImpl(_$OpenHousePropertyImpl _value,
      $Res Function(_$OpenHousePropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? attachments = freezed,
    Object? category = freezed,
    Object? propertyType = freezed,
    Object? status = freezed,
  }) {
    return _then(_$OpenHousePropertyImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyTypeModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenHousePropertyImpl
    with DiagnosticableTreeMixin
    implements _OpenHouseProperty {
  const _$OpenHousePropertyImpl(
      {this.name,
      this.description,
      @JsonKey(fromJson: ConvertTo.convertIntToDouble) this.price,
      @JsonKey(name: 'images') final List<AttachmentModel>? attachments,
      this.category,
      @JsonKey(name: 'type') this.propertyType,
      this.status})
      : _attachments = attachments;

  factory _$OpenHousePropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenHousePropertyImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(fromJson: ConvertTo.convertIntToDouble)
  final double? price;
  final List<AttachmentModel>? _attachments;
  @override
  @JsonKey(name: 'images')
  List<AttachmentModel>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Category? category;
  @override
  @JsonKey(name: 'type')
  final PropertyTypeModel? propertyType;
  @override
  final StatusEnum? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OpenHouseProperty(name: $name, description: $description, price: $price, attachments: $attachments, category: $category, propertyType: $propertyType, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OpenHouseProperty'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('propertyType', propertyType))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenHousePropertyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      price,
      const DeepCollectionEquality().hash(_attachments),
      category,
      propertyType,
      status);

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenHousePropertyImplCopyWith<_$OpenHousePropertyImpl> get copyWith =>
      __$$OpenHousePropertyImplCopyWithImpl<_$OpenHousePropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenHousePropertyImplToJson(
      this,
    );
  }
}

abstract class _OpenHouseProperty implements OpenHouseProperty {
  const factory _OpenHouseProperty(
      {final String? name,
      final String? description,
      @JsonKey(fromJson: ConvertTo.convertIntToDouble) final double? price,
      @JsonKey(name: 'images') final List<AttachmentModel>? attachments,
      final Category? category,
      @JsonKey(name: 'type') final PropertyTypeModel? propertyType,
      final StatusEnum? status}) = _$OpenHousePropertyImpl;

  factory _OpenHouseProperty.fromJson(Map<String, dynamic> json) =
      _$OpenHousePropertyImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(fromJson: ConvertTo.convertIntToDouble)
  double? get price;
  @override
  @JsonKey(name: 'images')
  List<AttachmentModel>? get attachments;
  @override
  Category? get category;
  @override
  @JsonKey(name: 'type')
  PropertyTypeModel? get propertyType;
  @override
  StatusEnum? get status;

  /// Create a copy of OpenHouseProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenHousePropertyImplCopyWith<_$OpenHousePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PropertySize _$PropertySizeFromJson(Map<String, dynamic> json) {
  return _PropertySize.fromJson(json);
}

/// @nodoc
mixin _$PropertySize {
  @JsonKey(name: 'covered_area')
  int? get coveredArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_size')
  int? get lotSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'bedrooms')
  int? get bedrooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'bathrooms')
  int? get bathrooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_built')
  DateTime? get yearBuilt => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_time_slots')
  List<AvailableTimeSlot>? get availableTimeSlots =>
      throw _privateConstructorUsedError;

  /// Serializes this PropertySize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertySize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertySizeCopyWith<PropertySize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertySizeCopyWith<$Res> {
  factory $PropertySizeCopyWith(
          PropertySize value, $Res Function(PropertySize) then) =
      _$PropertySizeCopyWithImpl<$Res, PropertySize>;
  @useResult
  $Res call(
      {@JsonKey(name: 'covered_area') int? coveredArea,
      @JsonKey(name: 'lot_size') int? lotSize,
      @JsonKey(name: 'bedrooms') int? bedrooms,
      @JsonKey(name: 'bathrooms') int? bathrooms,
      @JsonKey(name: 'year_built') DateTime? yearBuilt,
      @JsonKey(name: 'available_time_slots')
      List<AvailableTimeSlot>? availableTimeSlots});
}

/// @nodoc
class _$PropertySizeCopyWithImpl<$Res, $Val extends PropertySize>
    implements $PropertySizeCopyWith<$Res> {
  _$PropertySizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertySize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coveredArea = freezed,
    Object? lotSize = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? yearBuilt = freezed,
    Object? availableTimeSlots = freezed,
  }) {
    return _then(_value.copyWith(
      coveredArea: freezed == coveredArea
          ? _value.coveredArea
          : coveredArea // ignore: cast_nullable_to_non_nullable
              as int?,
      lotSize: freezed == lotSize
          ? _value.lotSize
          : lotSize // ignore: cast_nullable_to_non_nullable
              as int?,
      bedrooms: freezed == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      bathrooms: freezed == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      yearBuilt: freezed == yearBuilt
          ? _value.yearBuilt
          : yearBuilt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      availableTimeSlots: freezed == availableTimeSlots
          ? _value.availableTimeSlots
          : availableTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<AvailableTimeSlot>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertySizeImplCopyWith<$Res>
    implements $PropertySizeCopyWith<$Res> {
  factory _$$PropertySizeImplCopyWith(
          _$PropertySizeImpl value, $Res Function(_$PropertySizeImpl) then) =
      __$$PropertySizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'covered_area') int? coveredArea,
      @JsonKey(name: 'lot_size') int? lotSize,
      @JsonKey(name: 'bedrooms') int? bedrooms,
      @JsonKey(name: 'bathrooms') int? bathrooms,
      @JsonKey(name: 'year_built') DateTime? yearBuilt,
      @JsonKey(name: 'available_time_slots')
      List<AvailableTimeSlot>? availableTimeSlots});
}

/// @nodoc
class __$$PropertySizeImplCopyWithImpl<$Res>
    extends _$PropertySizeCopyWithImpl<$Res, _$PropertySizeImpl>
    implements _$$PropertySizeImplCopyWith<$Res> {
  __$$PropertySizeImplCopyWithImpl(
      _$PropertySizeImpl _value, $Res Function(_$PropertySizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertySize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coveredArea = freezed,
    Object? lotSize = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? yearBuilt = freezed,
    Object? availableTimeSlots = freezed,
  }) {
    return _then(_$PropertySizeImpl(
      coveredArea: freezed == coveredArea
          ? _value.coveredArea
          : coveredArea // ignore: cast_nullable_to_non_nullable
              as int?,
      lotSize: freezed == lotSize
          ? _value.lotSize
          : lotSize // ignore: cast_nullable_to_non_nullable
              as int?,
      bedrooms: freezed == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      bathrooms: freezed == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      yearBuilt: freezed == yearBuilt
          ? _value.yearBuilt
          : yearBuilt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      availableTimeSlots: freezed == availableTimeSlots
          ? _value._availableTimeSlots
          : availableTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<AvailableTimeSlot>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertySizeImpl with DiagnosticableTreeMixin implements _PropertySize {
  const _$PropertySizeImpl(
      {@JsonKey(name: 'covered_area') this.coveredArea,
      @JsonKey(name: 'lot_size') this.lotSize,
      @JsonKey(name: 'bedrooms') this.bedrooms,
      @JsonKey(name: 'bathrooms') this.bathrooms,
      @JsonKey(name: 'year_built') this.yearBuilt,
      @JsonKey(name: 'available_time_slots')
      final List<AvailableTimeSlot>? availableTimeSlots})
      : _availableTimeSlots = availableTimeSlots;

  factory _$PropertySizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertySizeImplFromJson(json);

  @override
  @JsonKey(name: 'covered_area')
  final int? coveredArea;
  @override
  @JsonKey(name: 'lot_size')
  final int? lotSize;
  @override
  @JsonKey(name: 'bedrooms')
  final int? bedrooms;
  @override
  @JsonKey(name: 'bathrooms')
  final int? bathrooms;
  @override
  @JsonKey(name: 'year_built')
  final DateTime? yearBuilt;
  final List<AvailableTimeSlot>? _availableTimeSlots;
  @override
  @JsonKey(name: 'available_time_slots')
  List<AvailableTimeSlot>? get availableTimeSlots {
    final value = _availableTimeSlots;
    if (value == null) return null;
    if (_availableTimeSlots is EqualUnmodifiableListView)
      return _availableTimeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PropertySize(coveredArea: $coveredArea, lotSize: $lotSize, bedrooms: $bedrooms, bathrooms: $bathrooms, yearBuilt: $yearBuilt, availableTimeSlots: $availableTimeSlots)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PropertySize'))
      ..add(DiagnosticsProperty('coveredArea', coveredArea))
      ..add(DiagnosticsProperty('lotSize', lotSize))
      ..add(DiagnosticsProperty('bedrooms', bedrooms))
      ..add(DiagnosticsProperty('bathrooms', bathrooms))
      ..add(DiagnosticsProperty('yearBuilt', yearBuilt))
      ..add(DiagnosticsProperty('availableTimeSlots', availableTimeSlots));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertySizeImpl &&
            (identical(other.coveredArea, coveredArea) ||
                other.coveredArea == coveredArea) &&
            (identical(other.lotSize, lotSize) || other.lotSize == lotSize) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.yearBuilt, yearBuilt) ||
                other.yearBuilt == yearBuilt) &&
            const DeepCollectionEquality()
                .equals(other._availableTimeSlots, _availableTimeSlots));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      coveredArea,
      lotSize,
      bedrooms,
      bathrooms,
      yearBuilt,
      const DeepCollectionEquality().hash(_availableTimeSlots));

  /// Create a copy of PropertySize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertySizeImplCopyWith<_$PropertySizeImpl> get copyWith =>
      __$$PropertySizeImplCopyWithImpl<_$PropertySizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertySizeImplToJson(
      this,
    );
  }
}

abstract class _PropertySize implements PropertySize {
  const factory _PropertySize(
      {@JsonKey(name: 'covered_area') final int? coveredArea,
      @JsonKey(name: 'lot_size') final int? lotSize,
      @JsonKey(name: 'bedrooms') final int? bedrooms,
      @JsonKey(name: 'bathrooms') final int? bathrooms,
      @JsonKey(name: 'year_built') final DateTime? yearBuilt,
      @JsonKey(name: 'available_time_slots')
      final List<AvailableTimeSlot>? availableTimeSlots}) = _$PropertySizeImpl;

  factory _PropertySize.fromJson(Map<String, dynamic> json) =
      _$PropertySizeImpl.fromJson;

  @override
  @JsonKey(name: 'covered_area')
  int? get coveredArea;
  @override
  @JsonKey(name: 'lot_size')
  int? get lotSize;
  @override
  @JsonKey(name: 'bedrooms')
  int? get bedrooms;
  @override
  @JsonKey(name: 'bathrooms')
  int? get bathrooms;
  @override
  @JsonKey(name: 'year_built')
  DateTime? get yearBuilt;
  @override
  @JsonKey(name: 'available_time_slots')
  List<AvailableTimeSlot>? get availableTimeSlots;

  /// Create a copy of PropertySize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertySizeImplCopyWith<_$PropertySizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
