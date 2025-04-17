import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/exceptions/http_exception.dart';
import 'package:open_house/shared/presentation/formz_state.dart';
import 'package:open_house/shared/utils/helper_constant.dart';
import 'package:open_house/shared/utils/print_utils.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';
import '../../../../../shared/utils/cusotm_date_utils.dart';
import '../../../data/repositories/add_repository.dart';

class AddNotifier extends StateNotifier<FormzState> {
  final AddRepository addRepository;
  final OpenHouse? postData;
  final Ref ref;

  AddNotifier({
    required this.ref,
    required this.addRepository,
    required this.postData,
  }) : super(const FormzState.initial());

  void initState() {
    state = const FormzState.initial();
  }

  void loadingState() {
    state = const FormzState.loading();
  }

  Future<void> addSale({String? transactionId}) async {
    try {
      // state = const FormzState.loading();

      // List<AvailableTimeSlot> timeSlots = [];
      // timeSlots.addAll(postData?.availableTimeSlots ?? []);

      // List<Map<String, dynamic>> availableTimeSlots =
      //     convertAvailableTimeSlotListToJson(timeSlots);

      // List<int> categories = [];
      // for (var element in (postData!.category ?? [])) {
      //   categories.add(element.id!);
      // }

      final value = postData?.copyWith(
        transactionId: (transactionId != null) ? transactionId : null,
      );
      final data = ref.read(addDataNotifierProvider.notifier).toAddJson(value!);

      final response = await addRepository.addPost(singleItem: data);

      state = await response.fold((failure) => FormzState.failure(failure), (
        data,
      ) {
        return FormzState.success(data: data);
      });
    } catch (e) {
      CustomToast.showToast(e.toString(), status: ToastStatus.error);
      state = FormzState.failure(
        AppException(
          message: e.toString(),
          statusCode: 600,
          identifier: 'try catch error',
        ),
      );
    }
  }

  Future<void> updateGarageSale({String? transactionId}) async {
    try {
      state = const FormzState.loading();
      List<AvailableTimeSlot> timeSlots = [];
      timeSlots.addAll(postData?.propertySize?.availableTimeSlots ?? []);

      List<Map<String, dynamic>> availableTimeSlots =
          convertAvailableTimeSlotListToJson(timeSlots);

      // state = const FormzState.loading();

      Map<String, dynamic> data = postData!.toJson();
      final postPrice = (HelperConstant.priceForEach *
          (postData?.propertySize?.availableTimeSlots ?? []).length);

      HelperConstant.postPrice = (postPrice == 0
              ? (postData?.openHouseProperty?.price ?? '10')
              : postPrice)
          .toString();
      data['category'] = postData?.openHouseProperty?.category?.id;
      data['price'] = postPrice;
      if (transactionId != null) {
        data['transaction_id'] = transactionId;
      } else {
        data['transaction_id'] = null;
      }
      //Just for testing
      // data['status'] = 'Expired';
      data['status'] = 'Active';
      data['available_time_slots'] = availableTimeSlots;
      data['images'] =
          postData?.openHouseProperty?.attachments?.map((e) => e.id).toList();
      PrintUtils.customLog(jsonEncode(data));
      final response = await addRepository.editPost(
        singleItem: data,
        id: postData!.id!,
      );

      state = await response.fold((failure) => FormzState.failure(failure), (
        data,
      ) {
        return FormzState.success(data: data);
      });
    } catch (e) {
      CustomToast.showToast(e.toString(), status: ToastStatus.error);
      state = FormzState.failure(
        AppException(
          message: e.toString(),
          statusCode: 600,
          identifier: 'try catch error',
        ),
      );
    }
  }

  /*Future<void> paymentGarageSale({String? transactionId}) async {
    try {
      Map<String, dynamic> data = postData!.toJson();
      if (postData?.id != null) {
        if (transactionId != null) {
          data['transaction_id'] = transactionId;
        }
        data['status'] = 'Active';
        data['is_garage'] = postData?.type == GarageYardType.garage;
        data['garage_and_yard'] = postData?.id;
        PrintUtils.customLog(jsonEncode(data));
        final response = await addRepository.payementForGaragePost(
          singleItem: data,
          id: postData!.id!,
        );

        state = await response.fold(
          (failure) => FormzState.failure(failure),
          (data) {
            return FormzState.success(data: data);
          },
        );
      }
    } catch (e) {
      CustomToast.showToast(e.toString(), status: ToastStatus.error);
      state = FormzState.failure(
        AppException(
          message: e.toString(),
          statusCode: 600,
          identifier: 'try catch error',
        ),
      );
    }
  }
*/
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
      };
    }).toList();
  }
}
