// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(readValue: readValueForID) int? userId,
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
    @JsonKey(readValue: readValueForProfileImage) AttachmentModel? profile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

int? readValueForID(Map map, String key) =>
    map[key] ?? map['user_id'] ?? map['id'];
Map<String, dynamic>? readValueForProfileImage(Map map, String key) =>
    map[key] ?? map['profile_picture'] ?? map['image'];
