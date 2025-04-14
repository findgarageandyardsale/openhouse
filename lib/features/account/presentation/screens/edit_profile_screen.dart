import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/presentation/providers/state/edit_profile_provider.dart';
import 'package:open_house/features/account/presentation/providers/state/get_profile_provider.dart';
import 'package:open_house/features/account/presentation/widgets/circular_user_image_widget.dart';
import 'package:open_house/features/account/presentation/widgets/show_image_picker_widget.dart';
import 'package:open_house/features/authentication/presentation/providers/auth_providers.dart';
import 'package:open_house/features/authentication/presentation/screens/signup_screen.dart';
import 'package:open_house/features/authentication/presentation/widgets/address_location_widget.dart';
import 'package:open_house/services/capitalize_word_formatter_service.dart';
import 'package:open_house/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/providers/attachment_file_mixin_action_provider.dart';
import 'package:open_house/shared/presentation/formz_state.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:open_house/shared/utils/print_utils.dart';
import 'package:open_house/shared/widgets/action_button.dart';
import 'package:open_house/shared/widgets/custom_bottomsheet.dart';
import 'package:open_house/shared/widgets/custom_loading.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';
import 'package:open_house/shared/widgets/file_image_builder.dart';
import 'package:geocoding/geocoding.dart';

import '../../../authentication/presentation/widgets/auth_field.dart';

@RoutePage()
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumber = TextEditingController();

  final TextEditingController address = TextEditingController();

  final TextEditingController streetNumberController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController realityController = TextEditingController();
  final TextEditingController liscenceController = TextEditingController();
  final TextEditingController officeAddressController = TextEditingController();
  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();

  void setAddressIfpresent(LocationModel? model) {
    PrintUtils.customLog('model: ${model?.toJson()}');
    if (model != null) {
      final streetName =
          model.throughfare != null ? '${model.throughfare}' : '';
      final suiteApp = model.subLocality != null ? '${model.subLocality}' : '';
      final streetNumber =
          model.subThoroughfare != null
              ? '${model.subThoroughfare}'
              : streetName;
      final cityName = model.locality != null ? '${model.locality}' : '';
      final state = model.adminArea != null ? '${model.adminArea}' : '';
      final zipcode = model.zipCode != null ? '${model.zipCode}' : '';

      streetNumberController.text = streetNumber;
      suiteController.text = suiteApp;
      cityController.text = cityName;
      stateController.text = state;
      zipCodeController.text = zipcode;
    }
  }

  setValueInController() {
    final userModel = ref.read(currentUserProvider);
    final user = userModel.value;
    firstNameController.text = user?.firstName ?? '';
    lastNameController.text = user?.lastName ?? '';
    emailController.text = user?.email ?? '';
    phoneNumber.text = user?.phoneNumber ?? '';
    setAddressIfpresent(user?.address);
    Future.microtask(() {
      ref.read(isSaleByOwnerProvider.notifier).state = user?.isOwner ?? true;
    });

    if (user?.isOwner == false) {
      realityController.text = user?.realtyName ?? '';
      liscenceController.text = user?.licenseNumber ?? '';

      if (streetNumberController.text.isNotEmpty ||
          streetNameController.text.isNotEmpty ||
          cityController.text.isNotEmpty ||
          stateController.text.isNotEmpty ||
          suiteController.text.isNotEmpty ||
          zipCodeController.text.isNotEmpty) {
        officeAddressController.text =
            '${streetNumberController.text} ${streetNameController.text}, ${cityController.text}, ${stateController.text} ${zipCodeController.text}';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setValueInController();

    firstNameController.addListener(() {
      if (_form.currentState?.fields['first_name']?.hasError ?? false) {
        _form.currentState?.fields['first_name']?.validate();
      }
    });

    lastNameController.addListener(() {
      if (_form.currentState?.fields['last_name']?.hasError ?? false) {
        _form.currentState?.fields['last_name']?.validate();
      }
    });

    emailController.addListener(() {
      if (_form.currentState?.fields['email']?.hasError ?? false) {
        _form.currentState?.fields['email']?.validate();
      }
    });
    phoneNumber.addListener(() {
      if (_form.currentState?.fields['phone_number']?.hasError ?? false) {
        _form.currentState?.fields['phone_number']?.validate();
      }
    });
    streetNumberController.addListener(() {
      if (_form.currentState?.fields['street_number']?.hasError ?? false) {
        _form.currentState?.fields['street_number']?.validate();
      }
    });

    suiteController.addListener(() {
      if (_form.currentState?.fields['suite_apt']?.hasError ?? false) {
        _form.currentState?.fields['suite_apt']?.validate();
      }
    });
    cityController.addListener(() {
      if (_form.currentState?.fields['city']?.hasError ?? false) {
        _form.currentState?.fields['city']?.validate();
      }
    });
    stateController.addListener(() {
      if (_form.currentState?.fields['state']?.hasError ?? false) {
        _form.currentState?.fields['state']?.validate();
      }
    });
    zipCodeController.addListener(() {
      if (_form.currentState?.fields['zip_code']?.hasError ?? false) {
        _form.currentState?.fields['zip_code']?.validate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ref.watch(currentUserProvider);
    final filePickerState = ref.watch(attachmentFileProvider);
    final isSaleByOwner = ref.watch(isSaleByOwnerProvider);

    final user = userModel.value;
    final state = ref.watch(editProfileNotifierProvider);

    ref.listen(editProfileNotifierProvider.select((value) => value), ((
      previous,
      next,
    ) {
      next.maybeWhen(
        orElse: () {},
        failure: (failure) {
          ref.read(editProfileNotifierProvider.notifier).initState();

          CustomToast.showToast(
            failure.message.toString(),
            status: ToastStatus.error,
          );
        },
        success: (success) {
          ref.read(editProfileNotifierProvider.notifier).initState();

          CustomToast.showToast(
            'Profile changed successfully',
            status: ToastStatus.success,
          );
          //get profile
          ref.read(getProfileNotifierProvider.notifier).getProfile();
          Navigator.pop(context);
        },
      );
    }));
    Map<String, dynamic> convertEmptyStringsToNull(Map<String, dynamic> data) {
      data.forEach((key, value) {
        if (value is String && value.isEmpty) {
          data[key] = null;
        }
      });
      return data;
    }

    Future<Map<String, dynamic>> locationSetUp(currentMapData) async {
      final streetName = suiteController.text;
      final streetNumber = streetNumberController.text;
      final city = cityController.text;
      final state = stateController.text;
      final zipCode = zipCodeController.text;
      Map<String, dynamic> data = {
        "sub_locality": streetName,
        "locality": city,
        "admin_area": state,
        "zip_code": zipCode,
        // "sub_throughfare": currentMapData['street_number'],
        "throughfare": streetNumber,
      };
      try {
        List<Location> locations = await locationFromAddress(
          '$streetNumber,$streetName, $city, $state $zipCode',
        );
        if (locations.isNotEmpty) {
          Location location = locations.first;
          double latitude = location.latitude;
          double longitude = location.longitude;

          data.addAll({"latitude": latitude, "longitude": longitude});
        }
      } catch (_) {}
      return convertEmptyStringsToNull(data);
    }

    Future<void> performAction() async {
      if (filePickerState is Loading) {
        CustomToast.showToast(
          'Please wait for image to upload',
          status: ToastStatus.error,
        );
        return;
      }
      final val = filePickerState.maybeWhen(
        orElse: () {
          return null;
        },
        success: (success) {
          return success;
        },
      );

      FocusScope.of(context).unfocus();
      if (_form.currentState!.saveAndValidate()) {
        Map<String, dynamic> map = {};
        Map<String, dynamic> currentMapData = _form.currentState!.value;
        // Set keys with empty values to null
        currentMapData.forEach((key, value) {
          if (value == null || value == '') {
            map[key] = null;
          } else {
            map[key] = value;
          }
        });
        final userID = (user?.userId ?? '').toString();
        final location = await locationSetUp(map);
        final isOwner = ref.read(isSaleByOwnerProvider);
        map.addAll({
          'is_owner': isOwner,

          // if (isOwner != true)
          'location': location,
          'image': (val ?? []).isEmpty ? null : val![0].id,
        });

        // Remove fields if is_owner is true
        if (isOwner == true) {
          map.remove('realty_name');
          map.remove('license_number');
        }
        ref
            .read(editProfileNotifierProvider.notifier)
            .editProfile(map: map, userId: userID);
      }
    }

    Widget iconCameraWidget() {
      return const Icon(Icons.camera_alt, color: AppColors.primary, size: 12);
    }

    Widget fnameLnameWidget() {
      return FnameLnameCircleTextWidget(
        firstName: user?.firstName ?? 'G',
        lastName: user?.lastName ?? 'S',
      );
    }

    void showOfficeAddressDrawer(BuildContext context) {
      primaryBottomSheet(
        context,
        child: AddressLocationBottomSheet(
          stateController: stateController,
          cityController: cityController,
          // streetNameController: streetNameController,
          streetNumberController: streetNumberController,
          suiteController: suiteController,
          zipCodeController: zipCodeController,
          formKey: _form,
        ),
      ).then((_) {
        //      '$streetNumber, $city, $state $zipCode',

        if (streetNumberController.text.isNotEmpty ||
            streetNameController.text.isNotEmpty ||
            cityController.text.isNotEmpty ||
            stateController.text.isNotEmpty ||
            zipCodeController.text.isNotEmpty) {
          officeAddressController.text =
              '${streetNumberController.text} ${streetNameController.text}, ${cityController.text}, ${stateController.text} ${zipCodeController.text}';
        }
      });
    }

    return CustomLoadingOverlay(
      isLoading: state is Loading,
      child: Scaffold(
        appBar: AppBar(title: const Text('My Profile')),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ActionButton(
            label: 'Update Profile',
            onPressed: () {
              performAction();
            },
          ),
        ),
        body: FormBuilder(
          key: _form,
          child: SafeArea(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showImagePickerAlertWidget(
                          // removeList: (!deleteExistPhoto.value &&
                          //     (userState?.profileID ?? '')
                          //         .toString()
                          //         .isNotEmpty),
                          // removeFn: () {
                          //   deleteExistPhoto.value = true;
                          // },
                          context: context,
                          camerafn: () async {
                            Navigator.of(context).pop();

                            await ref
                                .read(attachmentFileProvider.notifier)
                                .pickFileAndUpload(isCamera: true);
                          },
                          photolibraryfn: () async {
                            Navigator.of(context).pop();

                            await ref
                                .read(attachmentFileProvider.notifier)
                                .pickFileAndUpload(
                                  isCamera: false,
                                  allowMultiple: false,
                                  type: FileType.image,
                                );
                          },
                        );
                      },
                      child: badges.Badge(
                        badgeContent: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.lightPrimaryColor,
                          child: iconCameraWidget(),
                        ),
                        position: badges.BadgePosition.bottomEnd(
                          bottom: 1.0,
                          end: 0,
                        ),
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: AppColors.white,
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.lightPrimaryColor,
                          child: filePickerState.when(
                            failure: (failure) {
                              return fnameLnameWidget();
                            },
                            success: (success) {
                              if ((success ?? []).isEmpty) {
                                return fnameLnameWidget();
                              }
                              return FileImageBuilder(
                                clickUrl: '',
                                url: (success?.first.file ?? ''),
                                fit: BoxFit.fill,
                                shape: BoxShape.circle,
                              );
                            },
                            initial: () {
                              return fnameLnameWidget();
                            },
                            loading: () {
                              return const Center(
                                child: CupertinoActivityIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacing.sizedBoxH_20(),
                AuthField(
                  validationWithRequired: true,
                  name: 'first_name',
                  hintText: 'First Name',
                  labelText: 'First Name',
                  controller: firstNameController,
                  onChanged: (val) {
                    if (_form.currentState?.fields['first_name']?.hasError ??
                        false) {
                      _form.currentState?.fields['first_name']?.validate();
                    }
                  },
                  inputFormatters: [
                    CapitalizeWordsInputFormatter(),
                  ], // Apply the custom TextInputFormatter
                ),
                Spacing.sizedBoxH_16(),
                AuthField(
                  validationWithRequired: true,
                  name: 'last_name',
                  hintText: 'Last Name',
                  labelText: 'Last Name',
                  onChanged: (p0) {
                    if (_form.currentState?.fields['last_name']?.hasError ??
                        false) {
                      _form.currentState?.fields['last_name']?.validate();
                    }
                  },
                  controller: lastNameController,
                  inputFormatters: [
                    CapitalizeWordsInputFormatter(),
                  ], // Apply the custom TextInputFormatter
                ),
                Spacing.sizedBoxH_16(),
                AuthField(
                  validationWithRequired: true,
                  name: 'email',
                  hintText: 'Email',
                  labelText: 'Email',
                  onChanged:
                      (p0) => {
                        if (_form.currentState?.fields['email']?.hasError ??
                            false)
                          {_form.currentState?.fields['email']?.validate()},
                      },
                  controller: emailController,
                ),
                Spacing.sizedBoxH_16(),
                AuthField(
                  validationWithRequired: true,
                  name: 'phone_number',
                  hintText: 'Phone Number',
                  onChanged: (p0) {
                    if (_form.currentState?.fields['phone_number']?.hasError ??
                        false) {
                      _form.currentState?.fields['phone_number']?.validate();
                    }
                  },
                  labelText: 'Phone Number',
                  controller: phoneNumber,
                ),
                Spacing.sizedBoxH_16(),
                ChooseOwnerOrRealty(),
                if (!isSaleByOwner) ...[
                  AuthField(
                    name: 'realty_name',
                    labelText: 'Realty Name',
                    hintText: 'Realty Name',
                    controller: realityController,
                  ),
                  Spacing.sizedBoxH_16(),
                  AuthField(
                    name: 'license_number',
                    labelText: 'License Number',
                    hintText: 'License Number',
                    controller: liscenceController,
                  ),
                  Spacing.sizedBoxH_16(),
                ],
                AuthField(
                  name: 'office_address',
                  labelText: 'Office Address',
                  hintText: 'Office Address',
                  controller: officeAddressController,
                  readOnly: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down, size: 16),
                  onTap: () => showOfficeAddressDrawer(context),
                ),

                Spacing.sizedBoxH_16(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
