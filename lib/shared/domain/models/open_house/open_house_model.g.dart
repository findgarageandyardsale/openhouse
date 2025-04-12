// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenHouseImpl _$$OpenHouseImplFromJson(
  Map<String, dynamic> json,
) => _$OpenHouseImpl(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  furnishingStatus: $enumDecodeNullable(
    _$FurnishingEnumEnumMap,
    json['furnish_status'],
  ),
  status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']),
  location:
      json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  transactionId: json['transaction_id'] as String?,
  availableTimeSlots:
      (json['available_time_slots'] as List<dynamic>?)
          ?.map((e) => AvailableTimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
  category:
      (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
  attachments:
      (json['images'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList(),
  propertyModel:
      json['property_size'] == null
          ? null
          : PropertSizeModel.fromJson(
            json['property_size'] as Map<String, dynamic>,
          ),
  propertyType:
      json['property_type'] == null
          ? null
          : PropertyTypeModel.fromJson(
            json['property_type'] as Map<String, dynamic>,
          ),
  yearBuilt:
      json['year_built'] == null
          ? null
          : DateTime.parse(json['year_built'] as String),
  isPetFriendly: json['is_pet_friendly'] as bool?,
  isUtilityInclude: json['is_utility_include'] as bool?,
  distanceFromLocation: (json['distance_from_location'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$OpenHouseImplToJson(_$OpenHouseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'furnish_status': _$FurnishingEnumEnumMap[instance.furnishingStatus],
      'status': _$StatusEnumEnumMap[instance.status],
      'location': instance.location,
      'transaction_id': instance.transactionId,
      'available_time_slots': instance.availableTimeSlots,
      'category': instance.category,
      'images': instance.attachments,
      'amenities': instance.amenities,
      'property_size': instance.propertyModel,
      'property_type': instance.propertyType,
      'year_built': instance.yearBuilt?.toIso8601String(),
      'is_pet_friendly': instance.isPetFriendly,
      'is_utility_include': instance.isUtilityInclude,
      'distance_from_location': instance.distanceFromLocation,
    };

const _$FurnishingEnumEnumMap = {
  FurnishingEnum.fullyFurnished: 'Fully Furnished',
  FurnishingEnum.semiFurnished: 'Semi-Furnished',
  FurnishingEnum.unfurnished: 'Unfurnished',
  FurnishingEnum.underConstruction: 'Under Construction',
};

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'active',
  StatusEnum.expired: 'expired',
};

_$AvailableTimeSlotImpl _$$AvailableTimeSlotImplFromJson(
  Map<String, dynamic> json,
) => _$AvailableTimeSlotImpl(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  isEditable: json['isEditable'] as bool?,
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
  garageYardId: (json['garage_yard_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AvailableTimeSlotImplToJson(
  _$AvailableTimeSlotImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date?.toIso8601String(),
  'isEditable': instance.isEditable,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'garage_yard_id': instance.garageYardId,
};

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      propertyCategory: json['property_category'] as String?,
      propertyType: json['property_type'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'property_category': instance.propertyCategory,
      'property_type': instance.propertyType,
    };

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      subLocality: json['sub_locality'] as String?,
      locality: json['locality'] as String?,
      subThoroughfare: json['sub_throughfare'] as String?,
      throughfare: json['throughfare'] as String?,
      subAdminArea: json['sub_admin_area'] as String?,
      adminArea: json['admin_area'] as String?,
      addressLine: json['address_line'] as String?,
      zipCode: json['zip_code'] as String?,
      apartmentNumber: json['apartment_number'] as String?,
      distanceFromUser: (json['distance_from_user'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'sub_locality': instance.subLocality,
      'locality': instance.locality,
      'sub_throughfare': instance.subThoroughfare,
      'throughfare': instance.throughfare,
      'sub_admin_area': instance.subAdminArea,
      'admin_area': instance.adminArea,
      'address_line': instance.addressLine,
      'zip_code': instance.zipCode,
      'apartment_number': instance.apartmentNumber,
      'distance_from_user': instance.distanceFromUser,
    };
