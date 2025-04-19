import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/attachment_builder/provider/custom_attachment_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/property_type_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/step_five.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/step_four.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/step_one.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/step_three.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/step_two.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/models/response_data.dart';
import 'package:open_house/shared/extension/context.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/utils/helper_constant.dart';
import 'package:open_house/shared/widgets/action_button.dart';
import 'package:open_house/shared/widgets/custom_loading.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../services/stripe_service.dart';
import '../../../../shared/presentation/formz_state.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/custom_bottomsheet.dart';
import '../provider/add_data_provider.dart';
import '../provider/add_state_provider.dart';
import '../provider/cat_provider.dart';

@RoutePage()
class AddEditPostSaleScreen extends ConsumerStatefulWidget {
  const AddEditPostSaleScreen({super.key, this.garageayard});
  final OpenHouse? garageayard;

  @override
  ConsumerState<AddEditPostSaleScreen> createState() =>
      _AddPostSaleScreenState();
}

class _AddPostSaleScreenState extends ConsumerState<AddEditPostSaleScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController streetNumberController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController coveredAreaController = TextEditingController();
  final TextEditingController lotSizeController = TextEditingController();
  final TextEditingController bedroomsController = TextEditingController();
  final TextEditingController bathroomsController = TextEditingController();
  final TextEditingController propertyTypeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  void inittialData() {
    titleController.text = widget.garageayard?.openHouseProperty?.name ?? '';
    suiteController.text = widget.garageayard?.location?.subThoroughfare ?? '';
    streetNumberController.text =
        widget.garageayard?.location?.subLocality ?? '';
    cityController.text = widget.garageayard?.location?.locality ?? '';
    stateController.text = widget.garageayard?.location?.adminArea ?? '';
    zipCodeController.text = widget.garageayard?.location?.zipCode ?? '';
    coveredAreaController.text =
        (widget.garageayard?.propertySize?.coveredArea ?? '').toString();
    lotSizeController.text =
        (widget.garageayard?.propertySize?.lotSize ?? '').toString();
    bedroomsController.text =
        (widget.garageayard?.propertySize?.bedrooms ?? '').toString();
    bathroomsController.text =
        (widget.garageayard?.propertySize?.bathrooms ?? '').toString();
    propertyTypeController.text =
        widget.garageayard?.openHouseProperty?.propertyType?.name ?? '';

    priceController.text =
        widget.garageayard?.openHouseProperty?.price.toString() ?? '';
    descriptionController.text =
        widget.garageayard?.openHouseProperty?.description ?? '';
    dateController.text = CustomDateUtils.formatDateFilter(
        widget.garageayard?.propertySize?.yearBuilt);
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.invalidate(addDataNotifierProvider);

      if (widget.garageayard != null) {
        ref
            .read(addDataNotifierProvider.notifier)
            .initializeEditPost(widget.garageayard!);
        inittialData();

        ref
            .read(customAttachmentProvider('image').notifier)
            .addAttachmentofServer(
              widget.garageayard?.openHouseProperty?.attachments,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.read(addDataNotifierProvider);
    ref.read(propertyTypeNotifierProvider);

    ref.read(addCatNotifierProvider);
    final addState = ref.watch(addNotifierProvider);
    ref.read(customAttachmentProvider('image'));
    final imageLoadingState = ref.read(loadingFilesProvider('image'));

    void proceedToPaymentFunction() async {
      try {
        final model = ref.read(addNotifierProvider.notifier).postData;

        String? transactionId = await StripeService.instance.makePayment();
        Navigator.pop(context);

        if ((transactionId ?? '').isNotEmpty) {
          if (widget.garageayard == null) {
            ref
                .read(addNotifierProvider.notifier)
                .addSale(transactionId: transactionId!);
          } else {
            ref
                .read(addNotifierProvider.notifier)
                .updateGarageSale(transactionId: transactionId!);
          }
        } else {
          CustomToast.showToast('Payment Failed', status: ToastStatus.error);
        }
      } catch (e) {
        CustomToast.showToast('Payment Failed', status: ToastStatus.error);
      }
    }

    void paymentprocess() {
      primaryBottomSheet(
        context,
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Save Your Time and Energy By not Posting Physical Garage & Yard Sale signs on poles and streets.\n',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Make your Sale Event Live Simply by Showing your Presence Online\n',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Make your Garage or Yard Sale Event live by simply paying \$${HelperConstant.priceForEach}.00 for each sale date.\n\nYour total is \$${HelperConstant.postPrice}.00.',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              Spacing.sizedBoxH_20(),
              ActionButton(
                width: double.infinity,
                label: 'Proceed to Payment',
                onPressed: () {
                  proceedToPaymentFunction();
                },
              ),
            ],
          ),
        ),
      );
    }

    Map<String, dynamic> convertDynamicToMap(dynamic data) {
      if (data is Map<String, dynamic>) {
        return data;
      } else {
        throw Exception('Data is not a Map<String, dynamic>');
      }
    }

    ref.listen(addNotifierProvider.select((value) => value), ((previous, next) {
      //show Snackbar on failure
      if (next is Failure) {
        ref.read(addNotifierProvider.notifier).initState();
        CustomToast.showToast(
          next.exception.message.toString(),
          status: ToastStatus.error,
        );
      } else if (next is Success) {
        ref.read(addNotifierProvider.notifier).initState();
        final currentData = convertDynamicToMap(
          (next.data as ResponseData).data,
        );
        //check if status is expired

        if (currentData.isEmpty) {
          Navigator.of(context).pop(true);
          if (widget.garageayard != null) {
            /// ref.read(addNotifierProvider.notifier).updateGarageSale(
            //   transactionId: transactionId!,
            // );
            CustomToast.showToast(
              'Post Updated Successfully',
              status: ToastStatus.success,
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Post Added Successfully',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(
                            color: AppColors.primary,
                            height: 1.43,
                            fontWeight: FontWeight.w700,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Spacing.sizedBoxH_08(),
                    Image.asset('assets/success.jpeg'),
                    Spacing.sizedBoxH_20(),
                    ActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: 'Continue',
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          try {
            // ref
            //     .read(addDataNotifierProvider.notifier)
            //     .manageWholeData(currentData);

            paymentprocess();
          } catch (_) {}
        }
      }
    }));

    String title = widget.garageayard != null ? 'Update' : 'Add';

    void editFunction() {
      ref
          .read(addNotifierProvider.notifier)
          .updateGarageSale(transactionId: widget.garageayard?.transactionId);
    }

    Map<String, dynamic> convertEmptyStringsToNull(Map<String, dynamic> data) {
      data.forEach((key, value) {
        if (value is String && value.isEmpty) {
          data[key] = null;
        }
      });
      return data;
    }

    void addFunction() async {
      final status = widget.garageayard?.status ??
          widget.garageayard?.openHouseProperty?.status;
      try {
        FocusScope.of(context).unfocus();
        if (formKey.currentState?.saveAndValidate() ?? false) {
          if ((ref
                      .read(addDataNotifierProvider)
                      ?.openHouseProperty
                      ?.attachments ??
                  [])
              .isEmpty) {
            CustomToast.showToast(
              'Please add atleast one image',
              status: ToastStatus.error,
            );
            return;
          }
          ref.read(addNotifierProvider.notifier).loadingState();
          Map<String, dynamic> currentData = {};

          final data = formKey.currentState?.value;
          if (data != null) {
            currentData.addAll(data);
          }
          List<Location> locations = [];
          try {
            locations = await locationFromAddress(
              '${currentData['street_number']}, ${currentData['city']}, ${currentData['state']} ${currentData['zip_code']}',
            );
          } catch (e) {
            log('LocationFromAddress Error: ${e.toString()}');
          }
          if (locations.isNotEmpty) {
            Location location = locations.first;
            double latitude = location.latitude;
            double longitude = location.longitude;
            currentData.addAll({"latitude": latitude, "longitude": longitude});

            ref.read(addDataNotifierProvider.notifier).setLatitude(latitude);
            ref.read(addDataNotifierProvider.notifier).setLongitude(longitude);
          }
          currentData = convertEmptyStringsToNull(currentData);

          ref
              .read(addDataNotifierProvider.notifier)
              .manageWholeData(currentData);

          if (widget.garageayard == null || status == StatusEnum.expired) {
            ///[ Process is for validation]

            if (widget.garageayard != null) {
              ref
                  .read(addNotifierProvider.notifier)
                  .updateGarageSale(transactionId: null);
            } else {
              ref.read(addNotifierProvider.notifier).addSale();
            }
            /*
///[Payment Process is only after validation]
                    paymentprocess();
                    */
          } else {
            editFunction();
          }
        } else {
          CustomToast.showToast(
            'Please fill all the fields',
            status: ToastStatus.error,
          );
        }
      } catch (_) {
        ref.read(addNotifierProvider.notifier).initState();
      }
    }

    return CustomLoadingOverlay(
      isLoading: addState is Loading,
      child: context.doublePos(
        isActive: null,
        statusText: '$title Property',
        onPosPressed: imageLoadingState
            ? null
            : () async {
                addFunction();
              },
        appbar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            '$title Property',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          leading: BackButton(
            onPressed: () {
              ref.invalidate(addDataNotifierProvider);
              ref.invalidate(catNotifierProvider);
              Navigator.of(context).pop();
            },
          ),
        ),
        content: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormBuilder(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  StepOne(
                    priceController: priceController,
                    titleController: titleController,
                    propertyTypeController: propertyTypeController,
                  ),
                  StepTwo(
                    zipController: zipCodeController,
                    cityController: cityController,
                    stateController: stateController,
                    streetController: streetNumberController,
                    suiteController: suiteController,
                  ),
                  StepThree(
                    coveredAreaController: coveredAreaController,
                    lotSizeController: lotSizeController,
                    bedroomsController: bedroomsController,
                    bathroomsController: bathroomsController,
                  ),
                  StepFour(),
                  StepFive(
                    descriptionController: descriptionController,
                    dateController: dateController,
                  ),
                  // StepSix(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  customtabDesign(final String text, final bool isActive, final bool isGarage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .center, // Ensures the Row sizes itself based on its children
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isActive)
          Icon(
            Icons.check,
            color: isActive ? AppColors.white : AppColors.black,
          ),
        if (isActive) Spacing.sizedBoxW_08(),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: isActive
                    ? AppColors.white
                    : isGarage
                        ? AppColors.tertiary
                        : AppColors.secondary,
              ),
        ),
      ],
    );
  }
}
