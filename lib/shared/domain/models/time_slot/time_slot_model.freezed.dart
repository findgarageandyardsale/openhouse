// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TimeSlotModel _$TimeSlotModelFromJson(Map<String, dynamic> json) {
  return _TimeSlotModel.fromJson(json);
}

/// @nodoc
mixin _$TimeSlotModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this TimeSlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotModelCopyWith<TimeSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotModelCopyWith<$Res> {
  factory $TimeSlotModelCopyWith(
    TimeSlotModel value,
    $Res Function(TimeSlotModel) then,
  ) = _$TimeSlotModelCopyWithImpl<$Res, TimeSlotModel>;
  @useResult
  $Res call({int id, DateTime date, String startTime, String endTime});
}

/// @nodoc
class _$TimeSlotModelCopyWithImpl<$Res, $Val extends TimeSlotModel>
    implements $TimeSlotModelCopyWith<$Res> {
  _$TimeSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            startTime:
                null == startTime
                    ? _value.startTime
                    : startTime // ignore: cast_nullable_to_non_nullable
                        as String,
            endTime:
                null == endTime
                    ? _value.endTime
                    : endTime // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeSlotModelImplCopyWith<$Res>
    implements $TimeSlotModelCopyWith<$Res> {
  factory _$$TimeSlotModelImplCopyWith(
    _$TimeSlotModelImpl value,
    $Res Function(_$TimeSlotModelImpl) then,
  ) = __$$TimeSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime date, String startTime, String endTime});
}

/// @nodoc
class __$$TimeSlotModelImplCopyWithImpl<$Res>
    extends _$TimeSlotModelCopyWithImpl<$Res, _$TimeSlotModelImpl>
    implements _$$TimeSlotModelImplCopyWith<$Res> {
  __$$TimeSlotModelImplCopyWithImpl(
    _$TimeSlotModelImpl _value,
    $Res Function(_$TimeSlotModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(
      _$TimeSlotModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        startTime:
            null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as String,
        endTime:
            null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotModelImpl implements _TimeSlotModel {
  const _$TimeSlotModelImpl({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory _$TimeSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotModelImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime date;
  @override
  final String startTime;
  @override
  final String endTime;

  @override
  String toString() {
    return 'TimeSlotModel(id: $id, date: $date, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, startTime, endTime);

  /// Create a copy of TimeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotModelImplCopyWith<_$TimeSlotModelImpl> get copyWith =>
      __$$TimeSlotModelImplCopyWithImpl<_$TimeSlotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotModelImplToJson(this);
  }
}

abstract class _TimeSlotModel implements TimeSlotModel {
  const factory _TimeSlotModel({
    required final int id,
    required final DateTime date,
    required final String startTime,
    required final String endTime,
  }) = _$TimeSlotModelImpl;

  factory _TimeSlotModel.fromJson(Map<String, dynamic> json) =
      _$TimeSlotModelImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get date;
  @override
  String get startTime;
  @override
  String get endTime;

  /// Create a copy of TimeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotModelImplCopyWith<_$TimeSlotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
