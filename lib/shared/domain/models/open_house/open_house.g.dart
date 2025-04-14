// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_$OpenHouseImpl _$$OpenHouseImplFromJson(Map<String, dynamic> json) =>
    _$OpenHouseImpl(
      location:
          json['location'] == null
              ? null
              : LocationModel.fromJson(
                json['location'] as Map<String, dynamic>,
              ),
      propertyId: json['property_id'] as String?,
      transactionId: json['transaction_id'] as String?,
      openHouseProperty:
          json['property'] == null
              ? null
              : OpenHouseProperty.fromJson(
                json['property'] as Map<String, dynamic>,
              ),
      propertySize:
          json['size'] == null
              ? null
              : PropertySize.fromJson(json['size'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$OpenHouseImplToJson(_$OpenHouseImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'property_id': instance.propertyId,
      'transaction_id': instance.transactionId,
      'property': instance.openHouseProperty,
      'size': instance.propertySize,
      'status': _$StatusEnumEnumMap[instance.status],
    };

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'active',
  StatusEnum.expired: 'expired',
};

_$OpenHousePropertyImpl _$$OpenHousePropertyImplFromJson(
  Map<String, dynamic> json,
) => _$OpenHousePropertyImpl(
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  attachments:
      (json['images'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  category:
      (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
  propertyType:
      json['type'] == null
          ? null
          : PropertyTypeModel.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$OpenHousePropertyImplToJson(
  _$OpenHousePropertyImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'images': instance.attachments,
  'category': instance.category,
  'type': instance.propertyType,
};

_$PropertySizeImpl _$$PropertySizeImplFromJson(Map<String, dynamic> json) =>
    _$PropertySizeImpl(
      coveredArea: (json['covered_area'] as num?)?.toDouble(),
      lotSize: (json['lot_size'] as num?)?.toDouble(),
      bedrooms: json['bedrooms'] as String?,
      bathrooms: json['bathrooms'] as String?,
      yearBuilt:
          json['year_built'] == null
              ? null
              : DateTime.parse(json['year_built'] as String),
      availableTimeSlots:
          (json['available_time_slots'] as List<dynamic>?)
              ?.map(
                (e) => AvailableTimeSlot.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$$PropertySizeImplToJson(_$PropertySizeImpl instance) =>
    <String, dynamic>{
      'covered_area': instance.coveredArea,
      'lot_size': instance.lotSize,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'year_built': instance.yearBuilt?.toIso8601String(),
      'available_time_slots': instance.availableTimeSlots,
    };
