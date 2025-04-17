// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: (readValueForID(json, 'userId') as num?)?.toInt(),
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      images: json['images'] as String?,
      phoneNumber: json['phone_number'] as String?,
      token: json['token'] as String?,
      address: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      realtyName: json['realty_name'] as String?,
      officeAddress: json['office_address'] as String?,
      licenseNumber: json['license_number'] as String?,
      isOwner: json['is_owner'] as bool?,
      profile: readValueForProfileImage(json, 'profile') == null
          ? null
          : AttachmentModel.fromJson(readValueForProfileImage(json, 'profile')
              as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'images': instance.images,
      'phone_number': instance.phoneNumber,
      'token': instance.token,
      'location': instance.address,
      'realty_name': instance.realtyName,
      'office_address': instance.officeAddress,
      'license_number': instance.licenseNumber,
      'is_owner': instance.isOwner,
      'profile': instance.profile,
    };
