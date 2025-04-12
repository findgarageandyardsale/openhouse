// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenHouse _$OpenHouseFromJson(Map<String, dynamic> json) {
  return _OpenHouse.fromJson(json);
}

/// @nodoc
mixin _$OpenHouse {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'furnish_status')
  FurnishingEnum? get furnishingStatus => throw _privateConstructorUsedError;
  StatusEnum? get status => throw _privateConstructorUsedError;
  LocationModel? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_time_slots')
  List<AvailableTimeSlot>? get availableTimeSlots =>
      throw _privateConstructorUsedError;
  List<Category>? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<AttachmentModel>? get attachments => throw _privateConstructorUsedError;
  @JsonKey(name: 'amenities')
  List<String>? get amenities => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_size')
  PropertSizeModel? get propertyModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_type')
  PropertyTypeModel? get propertyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_built')
  DateTime? get yearBuilt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pet_friendly')
  bool? get isPetFriendly => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_utility_include')
  bool? get isUtilityInclude => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_from_location')
  double? get distanceFromLocation => throw _privateConstructorUsedError;

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
  $Res call({
    int? id,
    String? title,
    String? description,
    int? price,
    @JsonKey(name: 'furnish_status') FurnishingEnum? furnishingStatus,
    StatusEnum? status,
    LocationModel? location,
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'available_time_slots')
    List<AvailableTimeSlot>? availableTimeSlots,
    List<Category>? category,
    @JsonKey(name: 'images') List<AttachmentModel>? attachments,
    @JsonKey(name: 'amenities') List<String>? amenities,
    @JsonKey(name: 'property_size') PropertSizeModel? propertyModel,
    @JsonKey(name: 'property_type') PropertyTypeModel? propertyType,
    @JsonKey(name: 'year_built') DateTime? yearBuilt,
    @JsonKey(name: 'is_pet_friendly') bool? isPetFriendly,
    @JsonKey(name: 'is_utility_include') bool? isUtilityInclude,
    @JsonKey(name: 'distance_from_location') double? distanceFromLocation,
  });

  $LocationModelCopyWith<$Res>? get location;
  $PropertSizeModelCopyWith<$Res>? get propertyModel;
  $PropertyTypeModelCopyWith<$Res>? get propertyType;
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
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? furnishingStatus = freezed,
    Object? status = freezed,
    Object? location = freezed,
    Object? transactionId = freezed,
    Object? availableTimeSlots = freezed,
    Object? category = freezed,
    Object? attachments = freezed,
    Object? amenities = freezed,
    Object? propertyModel = freezed,
    Object? propertyType = freezed,
    Object? yearBuilt = freezed,
    Object? isPetFriendly = freezed,
    Object? isUtilityInclude = freezed,
    Object? distanceFromLocation = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as int?,
            furnishingStatus:
                freezed == furnishingStatus
                    ? _value.furnishingStatus
                    : furnishingStatus // ignore: cast_nullable_to_non_nullable
                        as FurnishingEnum?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as StatusEnum?,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as LocationModel?,
            transactionId:
                freezed == transactionId
                    ? _value.transactionId
                    : transactionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            availableTimeSlots:
                freezed == availableTimeSlots
                    ? _value.availableTimeSlots
                    : availableTimeSlots // ignore: cast_nullable_to_non_nullable
                        as List<AvailableTimeSlot>?,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as List<Category>?,
            attachments:
                freezed == attachments
                    ? _value.attachments
                    : attachments // ignore: cast_nullable_to_non_nullable
                        as List<AttachmentModel>?,
            amenities:
                freezed == amenities
                    ? _value.amenities
                    : amenities // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            propertyModel:
                freezed == propertyModel
                    ? _value.propertyModel
                    : propertyModel // ignore: cast_nullable_to_non_nullable
                        as PropertSizeModel?,
            propertyType:
                freezed == propertyType
                    ? _value.propertyType
                    : propertyType // ignore: cast_nullable_to_non_nullable
                        as PropertyTypeModel?,
            yearBuilt:
                freezed == yearBuilt
                    ? _value.yearBuilt
                    : yearBuilt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            isPetFriendly:
                freezed == isPetFriendly
                    ? _value.isPetFriendly
                    : isPetFriendly // ignore: cast_nullable_to_non_nullable
                        as bool?,
            isUtilityInclude:
                freezed == isUtilityInclude
                    ? _value.isUtilityInclude
                    : isUtilityInclude // ignore: cast_nullable_to_non_nullable
                        as bool?,
            distanceFromLocation:
                freezed == distanceFromLocation
                    ? _value.distanceFromLocation
                    : distanceFromLocation // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
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
  $PropertSizeModelCopyWith<$Res>? get propertyModel {
    if (_value.propertyModel == null) {
      return null;
    }

    return $PropertSizeModelCopyWith<$Res>(_value.propertyModel!, (value) {
      return _then(_value.copyWith(propertyModel: value) as $Val);
    });
  }

  /// Create a copy of OpenHouse
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
abstract class _$$OpenHouseImplCopyWith<$Res>
    implements $OpenHouseCopyWith<$Res> {
  factory _$$OpenHouseImplCopyWith(
    _$OpenHouseImpl value,
    $Res Function(_$OpenHouseImpl) then,
  ) = __$$OpenHouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? title,
    String? description,
    int? price,
    @JsonKey(name: 'furnish_status') FurnishingEnum? furnishingStatus,
    StatusEnum? status,
    LocationModel? location,
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'available_time_slots')
    List<AvailableTimeSlot>? availableTimeSlots,
    List<Category>? category,
    @JsonKey(name: 'images') List<AttachmentModel>? attachments,
    @JsonKey(name: 'amenities') List<String>? amenities,
    @JsonKey(name: 'property_size') PropertSizeModel? propertyModel,
    @JsonKey(name: 'property_type') PropertyTypeModel? propertyType,
    @JsonKey(name: 'year_built') DateTime? yearBuilt,
    @JsonKey(name: 'is_pet_friendly') bool? isPetFriendly,
    @JsonKey(name: 'is_utility_include') bool? isUtilityInclude,
    @JsonKey(name: 'distance_from_location') double? distanceFromLocation,
  });

  @override
  $LocationModelCopyWith<$Res>? get location;
  @override
  $PropertSizeModelCopyWith<$Res>? get propertyModel;
  @override
  $PropertyTypeModelCopyWith<$Res>? get propertyType;
}

/// @nodoc
class __$$OpenHouseImplCopyWithImpl<$Res>
    extends _$OpenHouseCopyWithImpl<$Res, _$OpenHouseImpl>
    implements _$$OpenHouseImplCopyWith<$Res> {
  __$$OpenHouseImplCopyWithImpl(
    _$OpenHouseImpl _value,
    $Res Function(_$OpenHouseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? furnishingStatus = freezed,
    Object? status = freezed,
    Object? location = freezed,
    Object? transactionId = freezed,
    Object? availableTimeSlots = freezed,
    Object? category = freezed,
    Object? attachments = freezed,
    Object? amenities = freezed,
    Object? propertyModel = freezed,
    Object? propertyType = freezed,
    Object? yearBuilt = freezed,
    Object? isPetFriendly = freezed,
    Object? isUtilityInclude = freezed,
    Object? distanceFromLocation = freezed,
  }) {
    return _then(
      _$OpenHouseImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as int?,
        furnishingStatus:
            freezed == furnishingStatus
                ? _value.furnishingStatus
                : furnishingStatus // ignore: cast_nullable_to_non_nullable
                    as FurnishingEnum?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as StatusEnum?,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as LocationModel?,
        transactionId:
            freezed == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        availableTimeSlots:
            freezed == availableTimeSlots
                ? _value._availableTimeSlots
                : availableTimeSlots // ignore: cast_nullable_to_non_nullable
                    as List<AvailableTimeSlot>?,
        category:
            freezed == category
                ? _value._category
                : category // ignore: cast_nullable_to_non_nullable
                    as List<Category>?,
        attachments:
            freezed == attachments
                ? _value._attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                    as List<AttachmentModel>?,
        amenities:
            freezed == amenities
                ? _value._amenities
                : amenities // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        propertyModel:
            freezed == propertyModel
                ? _value.propertyModel
                : propertyModel // ignore: cast_nullable_to_non_nullable
                    as PropertSizeModel?,
        propertyType:
            freezed == propertyType
                ? _value.propertyType
                : propertyType // ignore: cast_nullable_to_non_nullable
                    as PropertyTypeModel?,
        yearBuilt:
            freezed == yearBuilt
                ? _value.yearBuilt
                : yearBuilt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        isPetFriendly:
            freezed == isPetFriendly
                ? _value.isPetFriendly
                : isPetFriendly // ignore: cast_nullable_to_non_nullable
                    as bool?,
        isUtilityInclude:
            freezed == isUtilityInclude
                ? _value.isUtilityInclude
                : isUtilityInclude // ignore: cast_nullable_to_non_nullable
                    as bool?,
        distanceFromLocation:
            freezed == distanceFromLocation
                ? _value.distanceFromLocation
                : distanceFromLocation // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenHouseImpl with DiagnosticableTreeMixin implements _OpenHouse {
  const _$OpenHouseImpl({
    this.id,
    this.title,
    this.description,
    this.price,
    @JsonKey(name: 'furnish_status') this.furnishingStatus,
    this.status,
    this.location,
    @JsonKey(name: 'transaction_id') this.transactionId,
    @JsonKey(name: 'available_time_slots')
    final List<AvailableTimeSlot>? availableTimeSlots,
    final List<Category>? category,
    @JsonKey(name: 'images') final List<AttachmentModel>? attachments,
    @JsonKey(name: 'amenities') final List<String>? amenities,
    @JsonKey(name: 'property_size') this.propertyModel,
    @JsonKey(name: 'property_type') this.propertyType,
    @JsonKey(name: 'year_built') this.yearBuilt,
    @JsonKey(name: 'is_pet_friendly') this.isPetFriendly,
    @JsonKey(name: 'is_utility_include') this.isUtilityInclude,
    @JsonKey(name: 'distance_from_location') this.distanceFromLocation,
  }) : _availableTimeSlots = availableTimeSlots,
       _category = category,
       _attachments = attachments,
       _amenities = amenities;

  factory _$OpenHouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenHouseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? price;
  @override
  @JsonKey(name: 'furnish_status')
  final FurnishingEnum? furnishingStatus;
  @override
  final StatusEnum? status;
  @override
  final LocationModel? location;
  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
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

  final List<Category>? _category;
  @override
  List<Category>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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

  final List<String>? _amenities;
  @override
  @JsonKey(name: 'amenities')
  List<String>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'property_size')
  final PropertSizeModel? propertyModel;
  @override
  @JsonKey(name: 'property_type')
  final PropertyTypeModel? propertyType;
  @override
  @JsonKey(name: 'year_built')
  final DateTime? yearBuilt;
  @override
  @JsonKey(name: 'is_pet_friendly')
  final bool? isPetFriendly;
  @override
  @JsonKey(name: 'is_utility_include')
  final bool? isUtilityInclude;
  @override
  @JsonKey(name: 'distance_from_location')
  final double? distanceFromLocation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OpenHouse(id: $id, title: $title, description: $description, price: $price, furnishingStatus: $furnishingStatus, status: $status, location: $location, transactionId: $transactionId, availableTimeSlots: $availableTimeSlots, category: $category, attachments: $attachments, amenities: $amenities, propertyModel: $propertyModel, propertyType: $propertyType, yearBuilt: $yearBuilt, isPetFriendly: $isPetFriendly, isUtilityInclude: $isUtilityInclude, distanceFromLocation: $distanceFromLocation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OpenHouse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('furnishingStatus', furnishingStatus))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('transactionId', transactionId))
      ..add(DiagnosticsProperty('availableTimeSlots', availableTimeSlots))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('amenities', amenities))
      ..add(DiagnosticsProperty('propertyModel', propertyModel))
      ..add(DiagnosticsProperty('propertyType', propertyType))
      ..add(DiagnosticsProperty('yearBuilt', yearBuilt))
      ..add(DiagnosticsProperty('isPetFriendly', isPetFriendly))
      ..add(DiagnosticsProperty('isUtilityInclude', isUtilityInclude))
      ..add(DiagnosticsProperty('distanceFromLocation', distanceFromLocation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenHouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.furnishingStatus, furnishingStatus) ||
                other.furnishingStatus == furnishingStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality().equals(
              other._availableTimeSlots,
              _availableTimeSlots,
            ) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ) &&
            const DeepCollectionEquality().equals(
              other._amenities,
              _amenities,
            ) &&
            (identical(other.propertyModel, propertyModel) ||
                other.propertyModel == propertyModel) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.yearBuilt, yearBuilt) ||
                other.yearBuilt == yearBuilt) &&
            (identical(other.isPetFriendly, isPetFriendly) ||
                other.isPetFriendly == isPetFriendly) &&
            (identical(other.isUtilityInclude, isUtilityInclude) ||
                other.isUtilityInclude == isUtilityInclude) &&
            (identical(other.distanceFromLocation, distanceFromLocation) ||
                other.distanceFromLocation == distanceFromLocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    price,
    furnishingStatus,
    status,
    location,
    transactionId,
    const DeepCollectionEquality().hash(_availableTimeSlots),
    const DeepCollectionEquality().hash(_category),
    const DeepCollectionEquality().hash(_attachments),
    const DeepCollectionEquality().hash(_amenities),
    propertyModel,
    propertyType,
    yearBuilt,
    isPetFriendly,
    isUtilityInclude,
    distanceFromLocation,
  );

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenHouseImplCopyWith<_$OpenHouseImpl> get copyWith =>
      __$$OpenHouseImplCopyWithImpl<_$OpenHouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenHouseImplToJson(this);
  }
}

abstract class _OpenHouse implements OpenHouse {
  const factory _OpenHouse({
    final int? id,
    final String? title,
    final String? description,
    final int? price,
    @JsonKey(name: 'furnish_status') final FurnishingEnum? furnishingStatus,
    final StatusEnum? status,
    final LocationModel? location,
    @JsonKey(name: 'transaction_id') final String? transactionId,
    @JsonKey(name: 'available_time_slots')
    final List<AvailableTimeSlot>? availableTimeSlots,
    final List<Category>? category,
    @JsonKey(name: 'images') final List<AttachmentModel>? attachments,
    @JsonKey(name: 'amenities') final List<String>? amenities,
    @JsonKey(name: 'property_size') final PropertSizeModel? propertyModel,
    @JsonKey(name: 'property_type') final PropertyTypeModel? propertyType,
    @JsonKey(name: 'year_built') final DateTime? yearBuilt,
    @JsonKey(name: 'is_pet_friendly') final bool? isPetFriendly,
    @JsonKey(name: 'is_utility_include') final bool? isUtilityInclude,
    @JsonKey(name: 'distance_from_location') final double? distanceFromLocation,
  }) = _$OpenHouseImpl;

  factory _OpenHouse.fromJson(Map<String, dynamic> json) =
      _$OpenHouseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get price;
  @override
  @JsonKey(name: 'furnish_status')
  FurnishingEnum? get furnishingStatus;
  @override
  StatusEnum? get status;
  @override
  LocationModel? get location;
  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  @JsonKey(name: 'available_time_slots')
  List<AvailableTimeSlot>? get availableTimeSlots;
  @override
  List<Category>? get category;
  @override
  @JsonKey(name: 'images')
  List<AttachmentModel>? get attachments;
  @override
  @JsonKey(name: 'amenities')
  List<String>? get amenities;
  @override
  @JsonKey(name: 'property_size')
  PropertSizeModel? get propertyModel;
  @override
  @JsonKey(name: 'property_type')
  PropertyTypeModel? get propertyType;
  @override
  @JsonKey(name: 'year_built')
  DateTime? get yearBuilt;
  @override
  @JsonKey(name: 'is_pet_friendly')
  bool? get isPetFriendly;
  @override
  @JsonKey(name: 'is_utility_include')
  bool? get isUtilityInclude;
  @override
  @JsonKey(name: 'distance_from_location')
  double? get distanceFromLocation;

  /// Create a copy of OpenHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenHouseImplCopyWith<_$OpenHouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  @JsonKey(name: 'garage_yard_id')
  int? get garageYardId => throw _privateConstructorUsedError;

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
    AvailableTimeSlot value,
    $Res Function(AvailableTimeSlot) then,
  ) = _$AvailableTimeSlotCopyWithImpl<$Res, AvailableTimeSlot>;
  @useResult
  $Res call({
    int? id,
    DateTime? date,
    bool? isEditable,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'garage_yard_id') int? garageYardId,
  });
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
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            date:
                freezed == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            isEditable:
                freezed == isEditable
                    ? _value.isEditable
                    : isEditable // ignore: cast_nullable_to_non_nullable
                        as bool?,
            startTime:
                freezed == startTime
                    ? _value.startTime
                    : startTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            endTime:
                freezed == endTime
                    ? _value.endTime
                    : endTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            garageYardId:
                freezed == garageYardId
                    ? _value.garageYardId
                    : garageYardId // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailableTimeSlotImplCopyWith<$Res>
    implements $AvailableTimeSlotCopyWith<$Res> {
  factory _$$AvailableTimeSlotImplCopyWith(
    _$AvailableTimeSlotImpl value,
    $Res Function(_$AvailableTimeSlotImpl) then,
  ) = __$$AvailableTimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    DateTime? date,
    bool? isEditable,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'garage_yard_id') int? garageYardId,
  });
}

/// @nodoc
class __$$AvailableTimeSlotImplCopyWithImpl<$Res>
    extends _$AvailableTimeSlotCopyWithImpl<$Res, _$AvailableTimeSlotImpl>
    implements _$$AvailableTimeSlotImplCopyWith<$Res> {
  __$$AvailableTimeSlotImplCopyWithImpl(
    _$AvailableTimeSlotImpl _value,
    $Res Function(_$AvailableTimeSlotImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$AvailableTimeSlotImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        date:
            freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        isEditable:
            freezed == isEditable
                ? _value.isEditable
                : isEditable // ignore: cast_nullable_to_non_nullable
                    as bool?,
        startTime:
            freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        endTime:
            freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        garageYardId:
            freezed == garageYardId
                ? _value.garageYardId
                : garageYardId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableTimeSlotImpl
    with DiagnosticableTreeMixin
    implements _AvailableTimeSlot {
  const _$AvailableTimeSlotImpl({
    this.id,
    this.date,
    this.isEditable,
    @JsonKey(name: 'start_time') this.startTime,
    @JsonKey(name: 'end_time') this.endTime,
    @JsonKey(name: 'garage_yard_id') this.garageYardId,
  });

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
  @JsonKey(name: 'garage_yard_id')
  final int? garageYardId;

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
    runtimeType,
    id,
    date,
    isEditable,
    startTime,
    endTime,
    garageYardId,
  );

  /// Create a copy of AvailableTimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableTimeSlotImplCopyWith<_$AvailableTimeSlotImpl> get copyWith =>
      __$$AvailableTimeSlotImplCopyWithImpl<_$AvailableTimeSlotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableTimeSlotImplToJson(this);
  }
}

abstract class _AvailableTimeSlot implements AvailableTimeSlot {
  const factory _AvailableTimeSlot({
    final int? id,
    final DateTime? date,
    final bool? isEditable,
    @JsonKey(name: 'start_time') final String? startTime,
    @JsonKey(name: 'end_time') final String? endTime,
    @JsonKey(name: 'garage_yard_id') final int? garageYardId,
  }) = _$AvailableTimeSlotImpl;

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
  @JsonKey(name: 'garage_yard_id')
  int? get garageYardId;

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
  @JsonKey(name: 'property_category')
  String? get propertyCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_type')
  String? get propertyType => throw _privateConstructorUsedError;

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
  $Res call({
    int? id,
    String? name,
    @JsonKey(name: 'property_category') String? propertyCategory,
    @JsonKey(name: 'property_type') String? propertyType,
  });
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
    Object? propertyCategory = freezed,
    Object? propertyType = freezed,
  }) {
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
            propertyCategory:
                freezed == propertyCategory
                    ? _value.propertyCategory
                    : propertyCategory // ignore: cast_nullable_to_non_nullable
                        as String?,
            propertyType:
                freezed == propertyType
                    ? _value.propertyType
                    : propertyType // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
    _$CategoryImpl value,
    $Res Function(_$CategoryImpl) then,
  ) = __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    @JsonKey(name: 'property_category') String? propertyCategory,
    @JsonKey(name: 'property_type') String? propertyType,
  });
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
    _$CategoryImpl _value,
    $Res Function(_$CategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? propertyCategory = freezed,
    Object? propertyType = freezed,
  }) {
    return _then(
      _$CategoryImpl(
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
        propertyCategory:
            freezed == propertyCategory
                ? _value.propertyCategory
                : propertyCategory // ignore: cast_nullable_to_non_nullable
                    as String?,
        propertyType:
            freezed == propertyType
                ? _value.propertyType
                : propertyType // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl with DiagnosticableTreeMixin implements _Category {
  const _$CategoryImpl({
    this.id,
    this.name,
    @JsonKey(name: 'property_category') this.propertyCategory,
    @JsonKey(name: 'property_type') this.propertyType,
  });

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'property_category')
  final String? propertyCategory;
  @override
  @JsonKey(name: 'property_type')
  final String? propertyType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(id: $id, name: $name, propertyCategory: $propertyCategory, propertyType: $propertyType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('propertyCategory', propertyCategory))
      ..add(DiagnosticsProperty('propertyType', propertyType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.propertyCategory, propertyCategory) ||
                other.propertyCategory == propertyCategory) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, propertyCategory, propertyType);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category({
    final int? id,
    final String? name,
    @JsonKey(name: 'property_category') final String? propertyCategory,
    @JsonKey(name: 'property_type') final String? propertyType,
  }) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'property_category')
  String? get propertyCategory;
  @override
  @JsonKey(name: 'property_type')
  String? get propertyType;

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
    LocationModel value,
    $Res Function(LocationModel) then,
  ) = _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call({
    int? id,
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
    @JsonKey(name: 'distance_from_user') double? distanceFromUser,
  });
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
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            latitude:
                freezed == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as double?,
            longitude:
                freezed == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as double?,
            subLocality:
                freezed == subLocality
                    ? _value.subLocality
                    : subLocality // ignore: cast_nullable_to_non_nullable
                        as String?,
            locality:
                freezed == locality
                    ? _value.locality
                    : locality // ignore: cast_nullable_to_non_nullable
                        as String?,
            subThoroughfare:
                freezed == subThoroughfare
                    ? _value.subThoroughfare
                    : subThoroughfare // ignore: cast_nullable_to_non_nullable
                        as String?,
            throughfare:
                freezed == throughfare
                    ? _value.throughfare
                    : throughfare // ignore: cast_nullable_to_non_nullable
                        as String?,
            subAdminArea:
                freezed == subAdminArea
                    ? _value.subAdminArea
                    : subAdminArea // ignore: cast_nullable_to_non_nullable
                        as String?,
            adminArea:
                freezed == adminArea
                    ? _value.adminArea
                    : adminArea // ignore: cast_nullable_to_non_nullable
                        as String?,
            addressLine:
                freezed == addressLine
                    ? _value.addressLine
                    : addressLine // ignore: cast_nullable_to_non_nullable
                        as String?,
            zipCode:
                freezed == zipCode
                    ? _value.zipCode
                    : zipCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            apartmentNumber:
                freezed == apartmentNumber
                    ? _value.apartmentNumber
                    : apartmentNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            distanceFromUser:
                freezed == distanceFromUser
                    ? _value.distanceFromUser
                    : distanceFromUser // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
    _$LocationModelImpl value,
    $Res Function(_$LocationModelImpl) then,
  ) = __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
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
    @JsonKey(name: 'distance_from_user') double? distanceFromUser,
  });
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
    _$LocationModelImpl _value,
    $Res Function(_$LocationModelImpl) _then,
  ) : super(_value, _then);

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
    return _then(
      _$LocationModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        latitude:
            freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double?,
        longitude:
            freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double?,
        subLocality:
            freezed == subLocality
                ? _value.subLocality
                : subLocality // ignore: cast_nullable_to_non_nullable
                    as String?,
        locality:
            freezed == locality
                ? _value.locality
                : locality // ignore: cast_nullable_to_non_nullable
                    as String?,
        subThoroughfare:
            freezed == subThoroughfare
                ? _value.subThoroughfare
                : subThoroughfare // ignore: cast_nullable_to_non_nullable
                    as String?,
        throughfare:
            freezed == throughfare
                ? _value.throughfare
                : throughfare // ignore: cast_nullable_to_non_nullable
                    as String?,
        subAdminArea:
            freezed == subAdminArea
                ? _value.subAdminArea
                : subAdminArea // ignore: cast_nullable_to_non_nullable
                    as String?,
        adminArea:
            freezed == adminArea
                ? _value.adminArea
                : adminArea // ignore: cast_nullable_to_non_nullable
                    as String?,
        addressLine:
            freezed == addressLine
                ? _value.addressLine
                : addressLine // ignore: cast_nullable_to_non_nullable
                    as String?,
        zipCode:
            freezed == zipCode
                ? _value.zipCode
                : zipCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        apartmentNumber:
            freezed == apartmentNumber
                ? _value.apartmentNumber
                : apartmentNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        distanceFromUser:
            freezed == distanceFromUser
                ? _value.distanceFromUser
                : distanceFromUser // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl
    with DiagnosticableTreeMixin
    implements _LocationModel {
  const _$LocationModelImpl({
    this.id,
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
    @JsonKey(name: 'distance_from_user') this.distanceFromUser,
  });

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
    distanceFromUser,
  );

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(this);
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel({
    final int? id,
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
    @JsonKey(name: 'distance_from_user') final double? distanceFromUser,
  }) = _$LocationModelImpl;

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
