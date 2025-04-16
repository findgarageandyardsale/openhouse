// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';
import 'dart:math' as rand;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/utils/helper_constant.dart';

import 'package:open_house/shared/utils/print_utils.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';

class AddDataNotifier extends StateNotifier<OpenHouse?> {
  final Ref ref;
  AddDataNotifier(this.ref) : super(const OpenHouse());

  bool isSelected(Category cat) {
    // Since category is in OpenHouseProperty, we need to check if it exists
    if (state?.openHouseProperty?.category != null) {
      return state?.openHouseProperty?.category?.contains(cat) ?? false;
    }
    return false;
  }

  void manageWholeData(Map<String, dynamic> intitialData) {
    try {
      Map<String, dynamic> data = {};
      Map<String, dynamic> locaionData = {};
      data.addAll(intitialData);

      OpenHouse garageayard = state ?? const OpenHouse();

      //       0 =
      // "name" -> "Name"
      // 1 =
      // "price" -> null
      // 2 =
      // "property_type" -> null
      // 3 =
      // "street_number" -> null
      // 4 =
      // "suite_apt" -> null
      // 5 =
      // "city" -> null
      // 6 =
      // "state" -> null
      // 7 =
      // "zip_code" -> null
      // 8 =
      // "covered_area" -> null
      // 9 =
      // "lot_size" -> null
      // 10 =
      // "bedrooms" -> null
      // 11 =
      // "bathrooms" -> null
      // 12 =
      // "description" -> null
      // 13 =
      // "date_year" -> null

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
    // // Since category is in OpenHouseProperty, we need to handle it differently
    // // if cat is already in the list, remove it

    // List<Category> newCat = [];
    // newCat.addAll(state?.openHouseProperty?.category ?? []);
    // if (newCat.contains(cat)) {
    //   newCat.remove(cat);
    // } else {
    //   newCat.add(cat);
    // }

    try {
      state = state?.copyWith(
        openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
            .copyWith(category: [cat]),
      );
    } catch (e) {
      log('UpdateCat Error: ${e.toString()}');
    }
  }

  void addAttachment(List<AttachmentModel>? attachments) {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
          .copyWith(
            attachments: [
              ...(state?.openHouseProperty?.attachments ?? []),
              ...(attachments ?? []),
            ],
          ),
    );
  }

  void removeAttachment({required int? id}) {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    try {
      state = state?.copyWith(
        openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
            .copyWith(
              attachments:
                  state?.openHouseProperty?.attachments
                      ?.map((e) => e.id == id ? e : e)
                      .toList(),
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
      List<AvailableTimeSlot> slots = [];
      if ((state?.propertySize?.availableTimeSlots ?? []).isEmpty) {
        slots.addAll(state?.propertySize?.availableTimeSlots ?? []);
        slots.add(singleSlot);
        state = state?.copyWith(
          propertySize: (state?.propertySize ?? PropertySize()).copyWith(
            availableTimeSlots: slots,
          ),
        );
      } else {
        AvailableTimeSlot lastSlot =
            (state?.propertySize?.availableTimeSlots ?? []).last;

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
            slots.addAll(state?.propertySize?.availableTimeSlots ?? []);
            slots.add(singleSlot);
            state = state?.copyWith(
              propertySize: state?.propertySize?.copyWith(
                availableTimeSlots: slots,
              ),
            );
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
      openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
          .copyWith(
            name: title,
            // Add title handling here if needed
          ),
    );
  }

  void setPropertyType(PropertyTypeModel propertyType) {
    // Since title is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
          .copyWith(propertyType: propertyType),
    );
  }

  void setYearBuild(DateTime? yearBuilt) {
    state = state?.copyWith(
      propertySize: (state?.propertySize ?? PropertySize()).copyWith(
        yearBuilt: yearBuilt,
      ),
    );
  }

  void setDescription(String? desc) {
    // Since description is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
          .copyWith(
            description: desc,
            // Add description handling here if needed
          ),
    );
  }

  void setPrice(double? price) {
    // Since price is in OpenHouseProperty, we need to handle it differently
    state = state?.copyWith(
      openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
          .copyWith(price: price),
    );
  }

  // Clear all attachments
  void clearAttachments() {
    // Since attachments is in OpenHouseProperty, we need to handle it differently
    if (state != null) {
      state = state?.copyWith(
        openHouseProperty: (state?.openHouseProperty ?? OpenHouseProperty())
            .copyWith(
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

  List<Map<String, dynamic>> convertAvailableTimeSlotListToJson(
    List<AvailableTimeSlot> timeSlots,
  ) {
    return timeSlots.map((timeSlot) {
      return {
        'id': timeSlot.id,
        'date': CustomDateUtils.formatDateFilter(
          timeSlot.date ?? DateTime.now(),
        ),
        'start_time': CustomDateUtils.convertTo24HourFormat(
          timeSlot.startTime ?? '',
        ), // Convert start time
        'end_time': CustomDateUtils.convertTo24HourFormat(
          timeSlot.endTime ?? '',
        ), // Convert end time
        'property_id': state?.propertyId,
      };
    }).toList();
  }

  // Convert the OpenHouse model to the required JSON format
  Map<String, dynamic> toAddJson(OpenHouse model) {
    final postPrice =
        (HelperConstant.priceForEach *
            (model.propertySize?.availableTimeSlots ?? []).length);

    List<Map<String, dynamic>> availableTimeSlots =
        convertAvailableTimeSlotListToJson(
          model.propertySize?.availableTimeSlots ?? [],
        );

    return {
      if (model.propertyId != null) "property_id": model.propertyId,
      "location": {
        "latitude": model.location?.latitude,
        "longitude": model.location?.longitude,
        "sub_locality": model.location?.throughfare,
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
          "year_built": CustomDateUtils.formatDateFilter(
            model.propertySize?.yearBuilt ?? DateTime.now(),
          ),
        if (model.propertySize?.availableTimeSlots != null)
          "available_time_slots": availableTimeSlots,
      },
      "transaction_id": model.transactionId,
      "price": postPrice,
      "property": {
        "name": model.openHouseProperty?.name,
        "description": model.openHouseProperty?.description,
        "price": model.openHouseProperty?.price,
        "images":
            model.openHouseProperty?.attachments?.map((e) => e.id).toList(),
        "category": (model.openHouseProperty?.category ?? [])[0].id,
        // (model.openHouseProperty?.category ?? []).map((e) => e.id).toList(),
        "type": model.openHouseProperty?.propertyType?.id,
      },
    };
  }
}
