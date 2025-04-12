// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PropertyTypeModel _$PropertyTypeModelFromJson(Map<String, dynamic> json) {
  return _PropertyTypeModel.fromJson(json);
}

/// @nodoc
mixin _$PropertyTypeModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this PropertyTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyTypeModelCopyWith<PropertyTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyTypeModelCopyWith<$Res> {
  factory $PropertyTypeModelCopyWith(
    PropertyTypeModel value,
    $Res Function(PropertyTypeModel) then,
  ) = _$PropertyTypeModelCopyWithImpl<$Res, PropertyTypeModel>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$PropertyTypeModelCopyWithImpl<$Res, $Val extends PropertyTypeModel>
    implements $PropertyTypeModelCopyWith<$Res> {
  _$PropertyTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PropertyTypeModelImplCopyWith<$Res>
    implements $PropertyTypeModelCopyWith<$Res> {
  factory _$$PropertyTypeModelImplCopyWith(
    _$PropertyTypeModelImpl value,
    $Res Function(_$PropertyTypeModelImpl) then,
  ) = __$$PropertyTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$PropertyTypeModelImplCopyWithImpl<$Res>
    extends _$PropertyTypeModelCopyWithImpl<$Res, _$PropertyTypeModelImpl>
    implements _$$PropertyTypeModelImplCopyWith<$Res> {
  __$$PropertyTypeModelImplCopyWithImpl(
    _$PropertyTypeModelImpl _value,
    $Res Function(_$PropertyTypeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PropertyTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$PropertyTypeModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyTypeModelImpl implements _PropertyTypeModel {
  _$PropertyTypeModelImpl({this.id, this.name});

  factory _$PropertyTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyTypeModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'PropertyTypeModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyTypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of PropertyTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyTypeModelImplCopyWith<_$PropertyTypeModelImpl> get copyWith =>
      __$$PropertyTypeModelImplCopyWithImpl<_$PropertyTypeModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyTypeModelImplToJson(this);
  }
}

abstract class _PropertyTypeModel implements PropertyTypeModel {
  factory _PropertyTypeModel({final int? id, final String? name}) =
      _$PropertyTypeModelImpl;

  factory _PropertyTypeModel.fromJson(Map<String, dynamic> json) =
      _$PropertyTypeModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of PropertyTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyTypeModelImplCopyWith<_$PropertyTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
