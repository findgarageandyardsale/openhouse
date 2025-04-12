// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';
import 'dart:math' as rand;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_state_provider.dart';
import 'package:open_house/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/open_house/open_house_model.dart';
import 'package:open_house/shared/domain/models/propert_size_model/propert_size_model.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/utils/print_utils.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';

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
    // return state?.attachments ?? [];
  }

  bool isSelected(Category cat) {
    List<Category> categories = state?.category ?? [];
    return categories.contains(cat);
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
        title: data['title'],
        description: data['description'],
        location: LocationModel.fromJson(locaionData),
        attachments: state?.attachments ?? [],
      );
      state = garageayard;
    } catch (e) {
      log('ManageWholeData Error: ${e.toString()}');
    }
  }

  void initializeEditPost(OpenHouse garageayard) {
    if (garageayard.status == StatusEnum.expired) {
      state = garageayard.copyWith(
        availableTimeSlots: updateEditableTimeSlots([]),
      );
      addInitialTimeSlot();
    } else {
      // state = garageayard.copyWith(
      //   availableTimeSlots:
      //       updateEditableTimeSlots(garageayard.availableTimeSlots ?? []),
      // );
      List<AvailableTimeSlot> slots = updateEditableTimeSlots(
        garageayard.availableTimeSlots ?? [],
      );
      // Check updated list

      state = garageayard.copyWith(availableTimeSlots: slots);
    }
  }

  List<AvailableTimeSlot> updateEditableTimeSlots(
    List<AvailableTimeSlot> slots,
  ) {
    // Get today's date without the time
    final today = DateTime.now();

    // Create a new list for updated slots
    List<AvailableTimeSlot> updatedSlots = [];

    // Iterate through each AvailableTimeSlot
    for (var slot in slots) {
      if (slot.date != null) {
        // Extract only the date part, ignore the time
        final slotDate = DateTime(
          slot.date!.year,
          slot.date!.month,
          slot.date!.day,
        );
        slot = slot.copyWith(
          startTime: CustomDateUtils.convertTo12HourFormat(
            slot.startTime ?? '',
          ),
          endTime: CustomDateUtils.convertTo12HourFormat(slot.endTime ?? ''),
        );

        // Check if the slot date is before today
        if (slotDate.isBefore(DateTime(today.year, today.month, today.day))) {
          // If the slot date is before today, set isEditable to true
          slot = slot.copyWith(isEditable: false);
        }
      }

      // Add the modified or unmodified slot back to the list
      updatedSlots.add(slot);
    }

    return updatedSlots;
  }

  void updateCat(Category cat) {
    try {
      // Create a new list of categories to ensure state change
      List<Category> categories = List.from(state?.category ?? []);

      if (categories.contains(cat)) {
        // Remove the category if it's already selected
        categories.removeWhere((element) => element.id == cat.id);
      } else {
        // Add the category if it's not selected
        categories.add(cat);
      }

      // Update the state with a new instance of Garageayard
      state = state?.copyWith(category: categories);
    } catch (e) {
      log('UpdateCat Error: ${e.toString()}');
    }
  }

  void addAttachment(List<AttachmentModel>? attachments) {
    state = state?.copyWith(attachments: [...(attachments ?? [])]);
  }

  void updateStateAttachment({required String? id, required bool isInclude}) {
    try {
      List<AttachmentModel> attachmentsList = [...(state?.attachments ?? [])];
      final updatedList =
          attachmentsList.map((e) {
            if (e.id == id) {
              return e.copyWith(isInclude: isInclude);
            }
            return e;
          }).toList();
      state = state?.copyWith(attachments: updatedList);
    } catch (e) {
      PrintUtils.customLog('Error in Deleteing files$e');
    }
  }

  void removeAttachment({required int? id}) {
    try {
      List<AttachmentModel> attachmentsList = [...(state?.attachments ?? [])];
      attachmentsList.removeWhere((element) => element.id == id);
      state = state?.copyWith(attachments: attachmentsList);
    } catch (e) {
      PrintUtils.customLog('Error in Deleteing files $e');
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
      List<AvailableTimeSlot> slots = [];
      if ((state?.availableTimeSlots ?? []).isEmpty) {
        slots.addAll(state?.availableTimeSlots ?? []);
        slots.add(singleSlot);
        state = state?.copyWith(availableTimeSlots: slots);
      } else {
        AvailableTimeSlot lastSlot = (state?.availableTimeSlots ?? []).last;

        if (lastSlot.startTime != null &&
            lastSlot.endTime != null &&
            lastSlot.startTime != lastSlot.endTime) {
          TimeOfDay startTime = CustomDateUtils.stringToTimeOfDay(
            lastSlot.startTime ?? '',
          );
          TimeOfDay endTime = CustomDateUtils.stringToTimeOfDay(
            lastSlot.endTime ?? '',
          );
          if (CustomDateUtils.isFirstTimeAfter(startTime, endTime) ||
              startTime == endTime) {
            CustomToast.showToast(
              CustomDateUtils.isFirstTimeAfter(startTime, endTime)
                  ? "Start time should always come before end time."
                  : "Start time and end time cannot be the same.",
              status: ToastStatus.error,
            );
          } else {
            slots.addAll(state?.availableTimeSlots ?? []);
            slots.add(singleSlot);
            state = state?.copyWith(availableTimeSlots: slots);
          }
        } else {
          CustomToast.showToast(
            "Please select a valid start time and end time.",
            status: ToastStatus.error,
          );
        }
      }
    } catch (e) {
      log('AddInitialTimeSlot Error: ${e.toString()}');
    }
  }

  void addTimeSlot(AvailableTimeSlot timeSlot) {
    try {
      List<AvailableTimeSlot> slots = state?.availableTimeSlots ?? [];
      slots.add(timeSlot);
      state = state?.copyWith(availableTimeSlots: slots);
    } catch (e) {
      log('AddTimeSlot Error: ${e.toString()}');
    }
  }

  void editTimeSlot(AvailableTimeSlot timeSlot) {
    try {
      List<AvailableTimeSlot> slots = [];
      slots.addAll(state?.availableTimeSlots ?? []);
      AvailableTimeSlot slot = slots.firstWhere(
        (slot) => slot.id == timeSlot.id,
      );
      int index = slots.indexWhere((slot) => slot.id == timeSlot.id);
      slots[index] = slot.copyWith(
        date: timeSlot.date ?? slot.date,
        startTime: timeSlot.startTime ?? slot.startTime,
        endTime: timeSlot.endTime ?? slot.endTime,
      );
      state = state?.copyWith(availableTimeSlots: slots);
    } catch (e) {
      log('EditTimeSlot Error: ${e.toString()}');
    }
  }

  void removeTimeSlot(AvailableTimeSlot timeSlot) {
    try {
      List<AvailableTimeSlot> slots = [];
      slots.addAll(state?.availableTimeSlots ?? []);
      slots.removeWhere((slot) => slot.id == timeSlot.id);
      state = state?.copyWith(availableTimeSlots: slots);
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

  // // Update a specific field in the OpenHouse model
  // void updateField(String fieldName, dynamic value) {
  //   if (state != null) {
  //     switch (fieldName) {
  //       case 'title':
  //         state = state?.copyWith(title: value);
  //         break;
  //       case 'description':
  //         state = state?.copyWith(description: value);
  //         break;
  //       case 'price':
  //         state = state?.copyWith(price: value);
  //         break;

  //       default:
  //         break;
  //     }
  //   }
  // }

  void setTitleName(String? title) {
    state = state?.copyWith(title: title);
  }

  void setYearBuild(DateTime? title) {
    state = state?.copyWith(yearBuilt: title);
  }

  void setDescription(String? desc) {
    state = state?.copyWith(description: desc);
  }

  void setPrice(int? price) {
    state = state?.copyWith(price: price);
  }

  // Clear all attachments
  void clearAttachments() {
    if (state != null) {
      state = state?.copyWith(attachments: []);
    }
  }

  // Update location
  void setLocation(LocationModel location) {
    state = state?.copyWith(location: location);
  }
  //Seperate for Location

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
  void setPropertySize(PropertSizeModel propertySize) {
    state = state?.copyWith(propertyModel: propertySize);
  }

  // Update property type
  void setPropertyType(PropertyTypeModel propertyType) {
    state = state?.copyWith(propertyType: propertyType);
  }

  // Update covered area
  void setCoveredArea(double? coveredArea) {
    state = state?.copyWith(
      propertyModel: (state?.propertyModel ?? PropertSizeModel()).copyWith(
        coveredArea: coveredArea,
      ),
    );
  }

  // Update lot size
  void setLotSize(double? lotSize) {
    state = state?.copyWith(
      propertyModel: (state?.propertyModel ?? PropertSizeModel()).copyWith(
        lotSize: lotSize,
      ),
    );
  }

  // Update number of bedrooms
  void setBedrooms(int? bedrooms) {
    state = state?.copyWith(
      propertyModel: (state?.propertyModel ?? PropertSizeModel()).copyWith(
        bedrooms: bedrooms,
      ),
    );
  }

  // Update number of bathrooms
  void setBathrooms(int? bathrooms) {
    state = state?.copyWith(
      propertyModel: (state?.propertyModel ?? PropertSizeModel()).copyWith(
        bathrooms: bathrooms,
      ),
    );
  }

  // Clear the state
  void clear() {
    state = null;
  }

  // Validation for Step 1: Property Name, Price, and Property Type
  bool validateStepOne() {
    if (state?.title == null || (state!.title ?? '').isEmpty) {
      throw Exception('Property Name is required.');
    }
    if (state?.price == null || state!.price! <= 0) {
      throw Exception('Price is required and must be greater than 0.');
    }
    if (state?.propertyType == null) {
      throw Exception('Property Type is required.');
    }
    return true;
  }

  // Validation for Step 2: Address Fields
  bool validateStepTwo() {
    if ((state?.location)?.throughfare == null ||
        (state!.location!.throughfare ?? '').isEmpty) {
      throw Exception('Street Name is required.');
    }
    if (state?.location?.locality == null ||
        (state!.location!.locality ?? '').isEmpty) {
      throw Exception('City is required.');
    }
    if (state?.location?.adminArea == null ||
        (state!.location!.adminArea ?? '').isEmpty) {
      throw Exception('State is required.');
    }
    if (state?.location?.zipCode == null || state!.location!.zipCode!.isEmpty) {
      throw Exception('Zip Code is required.');
    }
    return true;
  }

  // Convert the OpenHouse model to the required JSON format
  Map<String, dynamic> toAddJson(OpenHouse model) {
    final user = ref.read(currentUserProvider).value;

    return {
      if (model.id != null) "property_id": model.id,
      "property": {
        "description": model.description,

        "name": model.title,
        "images": model.attachments?.map((e) => e.toJson()).toList() ?? [],
        "price": model.price,
        "type": model.propertyType?.id,
        "category": model.category?.first.id, // Assuming the first category
        // "category":
        //     (model.category ?? [])
        //         .map((e) => e.id)
        //         .toList(), // Assuming the first category
      },
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
        "covered_area": model.propertyModel?.coveredArea,
        "lot_size": model.propertyModel?.lotSize,
        // if (model.propertyModel?.bedrooms != null)
        "bedrooms": model.propertyModel?.bedrooms ?? 5,
        if (model.propertyModel?.bathrooms != null)
          "bathrooms": model.propertyModel?.bathrooms,

        if (model.isUtilityInclude != null)
          "utility_included": model.isUtilityInclude,
        if (model.isPetFriendly != null)
          "pet_friendly": model.isPetFriendly ?? false,
        if (model.furnishingStatus?.name != null)
          "furnish_status": model.furnishingStatus?.name,

        if (model.yearBuilt != null) "year_built": model.yearBuilt,
        "available_time_slots": ref
            .read(addNotifierProvider.notifier)
            .convertAvailableTimeSlotListToJson(model.availableTimeSlots ?? []),
      },
      // "broker": {
      //   "name":
      //       '${user?.firstName} ${user?.lastName}', // Replace with actual broker data if available
      //   "phone_number": user?.phoneNumber, // Replace with actual broker data
      //   "email": user?.email, // Replace with actual broker data
      //   "realty_name": user?.realtyName, // Replace with actual broker data
      //   "license_number":
      //       user?.licenseNumber, // Replace with actual broker data
      // },
      "transaction_id": model.transactionId,
    };
  }
}
