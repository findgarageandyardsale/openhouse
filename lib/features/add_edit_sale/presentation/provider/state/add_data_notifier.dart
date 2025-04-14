// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';
import 'dart:math' as rand;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';

import 'package:open_house/shared/utils/print_utils.dart';

class AddDataNotifier extends StateNotifier<OpenHouse?> {
  final Ref ref;
  AddDataNotifier(this.ref) : super(const OpenHouse());

  List getAttachments() {
    // add dummy attachments
    return [
      AttachmentModel(
        id: 1,
        file: 'https://via.placeholder.com/150',
        isInclude: true,
      ),
    ];
  }

  bool isSelected(Category cat) {
    // Since category is in OpenHouseProperty, we need to check if it exists
    return false;
  }

  void manageWholeData(Map<String, dynamic> intitialData) {
    try {
      Map<String, dynamic> data = {};
      Map<String, dynamic> locaionData = {};
      data.addAll(intitialData);

      OpenHouse garageayard = state ?? const OpenHouse();

      locaionData.addAll({
        "sub_locality": data['suite_apt'],
        "locality": data['city'],
        "admin_area": data['state'],
        "zip_code": data['zip_code'],
        "throughfare": data['street_number'],
        "latitude": data['latitude'],
        "longitude": data['longitude'],
      });
      garageayard = garageayard.copyWith(
        location: LocationModel.fromJson(locaionData),
      );
      state = garageayard;
    } catch (e) {
      log('ManageWholeData Error: ${e.toString()}');
    }
  }

  void initializeEditPost(OpenHouse garageayard) {
    state = garageayard;
  }

  void updateCat(Category cat) {
    // Since category is in OpenHouseProperty, we need to handle it differently
    try {
      state = state?.copyWith(
        openHouseProperty: state?.openHouseProperty?.copyWith(
          category: [cat],
          // Add category handling here if needed
        ),
      );
    } catch (e) {
      log('UpdateCat Error: ${e.toString()}');
    }
  }

  void addAttachment(List<AttachmentModel>? attachments) {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: state?.openHouseProperty?.copyWith(
        attachments: attachments,
        // Add attachment handling here if needed
      ),
    );
  }

  void updateStateAttachment({required String? id, required bool isInclude}) {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    try {
      state = state?.copyWith(
        openHouseProperty: state?.openHouseProperty?.copyWith(
          attachments:
              state?.openHouseProperty?.attachments
                  ?.map(
                    (e) => e.id == id ? e.copyWith(isInclude: isInclude) : e,
                  )
                  .toList(),
          // Add attachment update handling here if needed
        ),
      );
    } catch (e) {
      PrintUtils.customLog('Error in Deleting files$e');
    }
  }

  void removeAttachment({required int? id}) {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    try {
      state = state?.copyWith(
        openHouseProperty: state?.openHouseProperty?.copyWith(
          attachments:
              state?.openHouseProperty?.attachments
                  ?.map((e) => e.id == id ? e : e)
                  .toList(),
          // Add attachment removal handling here if needed
        ),
      );
    } catch (e) {
      PrintUtils.customLog('Error in Deleting files $e');
    }
  }

  void addInitialTimeSlot({DateTime? date}) {
    try {
      final singleSlot = AvailableTimeSlot(
        id: rand.Random.secure().nextInt(1000000),
        date: date ?? DateTime.now(),
        startTime: '09:00 AM',
        endTime: '05:00 PM',
      );

      state = state?.copyWith(
        propertySize: state?.propertySize?.copyWith(
          availableTimeSlots: [
            ...(state?.propertySize?.availableTimeSlots ?? []),
            singleSlot,
          ],
        ),
      );
    } catch (e) {
      log('AddInitialTimeSlot Error: ${e.toString()}');
    }
  }

  void addTimeSlot(AvailableTimeSlot timeSlot) {
    try {
      state = state?.copyWith(
        propertySize: state?.propertySize?.copyWith(
          availableTimeSlots: [
            ...(state?.propertySize?.availableTimeSlots ?? []),
            timeSlot,
          ],
        ),
      );
    } catch (e) {
      log('AddTimeSlot Error: ${e.toString()}');
    }
  }

  void editTimeSlot(AvailableTimeSlot timeSlot) {
    try {
      List<AvailableTimeSlot> slots =
          state?.propertySize?.availableTimeSlots ?? [];
      int index = slots.indexWhere((slot) => slot.id == timeSlot.id);
      if (index != -1) {
        slots[index] = slots[index].copyWith(
          date: timeSlot.date ?? slots[index].date,
          startTime: timeSlot.startTime ?? slots[index].startTime,
          endTime: timeSlot.endTime ?? slots[index].endTime,
        );
        state = state?.copyWith(
          propertySize: state?.propertySize?.copyWith(
            availableTimeSlots: slots,
          ),
        );
      }
    } catch (e) {
      log('EditTimeSlot Error: ${e.toString()}');
    }
  }

  void removeTimeSlot(AvailableTimeSlot timeSlot) {
    try {
      List<AvailableTimeSlot> slots =
          state?.propertySize?.availableTimeSlots ?? [];
      slots.removeWhere((slot) => slot.id == timeSlot.id);
      state = state?.copyWith(
        propertySize: state?.propertySize?.copyWith(availableTimeSlots: slots),
      );
    } catch (e) {
      log('RemoveTimeSlot Error: ${e.toString()}');
    }
  }

  // Initialize the state
  void init() {
    state = OpenHouse();
  }

  // Set the OpenHouse model
  void setOpenHouseModel(OpenHouse model) {
    state = model;
  }

  void setTitleName(String? title) {
    // Since title is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: state?.openHouseProperty?.copyWith(
        name: title,
        // Add title handling here if needed
      ),
    );
  }

  void setYearBuild(DateTime? yearBuilt) {
    state = state?.copyWith(
      propertySize: state?.propertySize?.copyWith(yearBuilt: yearBuilt),
    );
  }

  void setDescription(String? desc) {
    // Since description is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: state?.openHouseProperty?.copyWith(
        description: desc,
        // Add description handling here if needed
      ),
    );
  }

  void setPrice(double? price) {
    // Since price is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: state?.openHouseProperty?.copyWith(
        price: price,
        // Add price handling here if needed
      ),
    );
  }

  // Clear all attachments
  void clearAttachments() {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    if (state != null) {
      state = state?.copyWith(
        openHouseProperty: state?.openHouseProperty?.copyWith(
          attachments: [],
          // Add attachment clearing here if needed
        ),
      );
    }
  }

  // Update location
  void setLocation(LocationModel location) {
    state = state?.copyWith(location: location);
  }

  // Update street number
  void setStreetNumber(String? streetNumber) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(
        subThoroughfare: streetNumber,
      ),
    );
  }

  // Update street name
  void setStreetName(String? streetName) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(
        throughfare: streetName,
      ),
    );
  }

  // Update suite/apt
  void setSuiteApt(String? suiteApt) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(
        subLocality: suiteApt,
      ),
    );
  }

  // Update city
  void setCity(String? city) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(locality: city),
    );
  }

  // Update state
  void setState(String? stateName) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(
        adminArea: stateName,
      ),
    );
  }

  // Update zip code
  void setZipCode(String? zipCode) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(zipCode: zipCode),
    );
  }

  // Update latitude
  void setLatitude(double? latitude) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(
        latitude: latitude,
      ),
    );
  }

  // Update longitude
  void setLongitude(double? longitude) {
    state = state?.copyWith(
      location: (state?.location ?? LocationModel()).copyWith(
        longitude: longitude,
      ),
    );
  }

  // Update property size
  void setPropertySize(PropertySize propertySize) {
    state = state?.copyWith(propertySize: propertySize);
  }

  // Update covered area
  void setCoveredArea(double? coveredArea) {
    state = state?.copyWith(
      propertySize: (state?.propertySize ?? PropertySize()).copyWith(
        coveredArea: coveredArea,
      ),
    );
  }

  // Update lot size
  void setLotSize(double? lotSize) {
    state = state?.copyWith(
      propertySize: (state?.propertySize ?? PropertySize()).copyWith(
        lotSize: lotSize,
      ),
    );
  }

  // Update number of bedrooms
  void setBedrooms(String? bedrooms) {
    state = state?.copyWith(
      propertySize: (state?.propertySize ?? PropertySize()).copyWith(
        bedrooms: bedrooms,
      ),
    );
  }

  // Update number of bathrooms
  void setBathrooms(String? bathrooms) {
    state = state?.copyWith(
      propertySize: (state?.propertySize ?? PropertySize()).copyWith(
        bathrooms: bathrooms,
      ),
    );
  }

  // Clear the state
  void clear() {
    state = null;
  }

  // Convert the OpenHouse model to the required JSON format
  Map<String, dynamic> toAddJson(OpenHouse model) {
    return {
      if (model.propertyId != null) "property_id": model.propertyId,
      "location": {
        "latitude": model.location?.latitude,
        "longitude": model.location?.longitude,
        "sub_locality": model.location?.subLocality,
        "locality": model.location?.locality,
        "sub_admin_area": model.location?.subAdminArea,
        "admin_area": model.location?.adminArea,
        "address_line": model.location?.addressLine,
        "zip_code": model.location?.zipCode,
        "apartment_number": model.location?.apartmentNumber,
      },
      "size": {
        "covered_area": model.propertySize?.coveredArea,
        "lot_size": model.propertySize?.lotSize,
        "bedrooms": model.propertySize?.bedrooms ?? 5,
        if (model.propertySize?.bathrooms != null)
          "bathrooms": model.propertySize?.bathrooms,
        if (model.propertySize?.yearBuilt != null)
          "year_built": model.propertySize?.yearBuilt,
        if (model.propertySize?.availableTimeSlots != null)
          "available_time_slots": model.propertySize?.availableTimeSlots,
      },
      "transaction_id": model.transactionId,
      "property": {
        "name": model.openHouseProperty?.name,
        "description": model.openHouseProperty?.description,
        "price": model.openHouseProperty?.price,
        "attachments": model.openHouseProperty?.attachments,
        "category": model.openHouseProperty?.category,
      },
    };
  }
}
