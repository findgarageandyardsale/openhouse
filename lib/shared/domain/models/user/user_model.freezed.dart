// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(readValue: readValueForID)
  int? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  LocationModel? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'realty_name')
  String? get realtyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_address')
  String? get officeAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String? get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_owner')
  bool? get isOwner => throw _privateConstructorUsedError;
  @JsonKey(readValue: readValueForProfileImage)
  AttachmentModel? get profile => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(readValue: readValueForID) int? userId,
      String? username,
      String? password,
      String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? images,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? token,
      @JsonKey(name: 'location') LocationModel? address,
      @JsonKey(name: 'realty_name') String? realtyName,
      @JsonKey(name: 'office_address') String? officeAddress,
      @JsonKey(name: 'license_number') String? licenseNumber,
      @JsonKey(name: 'is_owner') bool? isOwner,
      @JsonKey(readValue: readValueForProfileImage) AttachmentModel? profile});

  $LocationModelCopyWith<$Res>? get address;
  $AttachmentModelCopyWith<$Res>? get profile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? images = freezed,
    Object? phoneNumber = freezed,
    Object? token = freezed,
    Object? address = freezed,
    Object? realtyName = freezed,
    Object? officeAddress = freezed,
    Object? licenseNumber = freezed,
    Object? isOwner = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      realtyName: freezed == realtyName
          ? _value.realtyName
          : realtyName // ignore: cast_nullable_to_non_nullable
              as String?,
      officeAddress: freezed == officeAddress
          ? _value.officeAddress
          : officeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isOwner: freezed == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as AttachmentModel?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttachmentModelCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $AttachmentModelCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: readValueForID) int? userId,
      String? username,
      String? password,
      String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? images,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? token,
      @JsonKey(name: 'location') LocationModel? address,
      @JsonKey(name: 'realty_name') String? realtyName,
      @JsonKey(name: 'office_address') String? officeAddress,
      @JsonKey(name: 'license_number') String? licenseNumber,
      @JsonKey(name: 'is_owner') bool? isOwner,
      @JsonKey(readValue: readValueForProfileImage) AttachmentModel? profile});

  @override
  $LocationModelCopyWith<$Res>? get address;
  @override
  $AttachmentModelCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? images = freezed,
    Object? phoneNumber = freezed,
    Object? token = freezed,
    Object? address = freezed,
    Object? realtyName = freezed,
    Object? officeAddress = freezed,
    Object? licenseNumber = freezed,
    Object? isOwner = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$UserImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      realtyName: freezed == realtyName
          ? _value.realtyName
          : realtyName // ignore: cast_nullable_to_non_nullable
              as String?,
      officeAddress: freezed == officeAddress
          ? _value.officeAddress
          : officeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isOwner: freezed == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as AttachmentModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(readValue: readValueForID) this.userId,
      this.username,
      this.password,
      this.email,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.images,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      this.token,
      @JsonKey(name: 'location') this.address,
      @JsonKey(name: 'realty_name') this.realtyName,
      @JsonKey(name: 'office_address') this.officeAddress,
      @JsonKey(name: 'license_number') this.licenseNumber,
      @JsonKey(name: 'is_owner') this.isOwner,
      @JsonKey(readValue: readValueForProfileImage) this.profile});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(readValue: readValueForID)
  final int? userId;
  @override
  final String? username;
  @override
  final String? password;
  @override
  final String? email;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? images;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final String? token;
  @override
  @JsonKey(name: 'location')
  final LocationModel? address;
  @override
  @JsonKey(name: 'realty_name')
  final String? realtyName;
  @override
  @JsonKey(name: 'office_address')
  final String? officeAddress;
  @override
  @JsonKey(name: 'license_number')
  final String? licenseNumber;
  @override
  @JsonKey(name: 'is_owner')
  final bool? isOwner;
  @override
  @JsonKey(readValue: readValueForProfileImage)
  final AttachmentModel? profile;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, password: $password, email: $email, firstName: $firstName, lastName: $lastName, images: $images, phoneNumber: $phoneNumber, token: $token, address: $address, realtyName: $realtyName, officeAddress: $officeAddress, licenseNumber: $licenseNumber, isOwner: $isOwner, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.realtyName, realtyName) ||
                other.realtyName == realtyName) &&
            (identical(other.officeAddress, officeAddress) ||
                other.officeAddress == officeAddress) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      username,
      password,
      email,
      firstName,
      lastName,
      images,
      phoneNumber,
      token,
      address,
      realtyName,
      officeAddress,
      licenseNumber,
      isOwner,
      profile);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(readValue: readValueForID) final int? userId,
      final String? username,
      final String? password,
      final String? email,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? images,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      final String? token,
      @JsonKey(name: 'location') final LocationModel? address,
      @JsonKey(name: 'realty_name') final String? realtyName,
      @JsonKey(name: 'office_address') final String? officeAddress,
      @JsonKey(name: 'license_number') final String? licenseNumber,
      @JsonKey(name: 'is_owner') final bool? isOwner,
      @JsonKey(readValue: readValueForProfileImage)
      final AttachmentModel? profile}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(readValue: readValueForID)
  int? get userId;
  @override
  String? get username;
  @override
  String? get password;
  @override
  String? get email;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get images;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  String? get token;
  @override
  @JsonKey(name: 'location')
  LocationModel? get address;
  @override
  @JsonKey(name: 'realty_name')
  String? get realtyName;
  @override
  @JsonKey(name: 'office_address')
  String? get officeAddress;
  @override
  @JsonKey(name: 'license_number')
  String? get licenseNumber;
  @override
  @JsonKey(name: 'is_owner')
  bool? get isOwner;
  @override
  @JsonKey(readValue: readValueForProfileImage)
  AttachmentModel? get profile;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
