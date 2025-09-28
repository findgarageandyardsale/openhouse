import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:open_house/features/authentication/presentation/widgets/address_location_widget.dart';

import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/utils/helper_constant.dart';
import 'package:open_house/shared/widgets/app_image.dart';
import 'package:open_house/shared/widgets/custom_bottomsheet.dart';
import 'package:open_house/shared/widgets/custom_loading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/widgets/action_button.dart';
import '../../../../shared/widgets/custom_toast.dart';
import '../providers/auth_providers.dart';
import '../providers/state/auth_state.dart';
import '../widgets/auth_field.dart';

@RoutePage()
class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetNumberController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController realityController = TextEditingController();
  final TextEditingController liscenceController = TextEditingController();
  final TextEditingController promocodeController = TextEditingController();

  final TextEditingController officeAddressController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsState = ref.watch(checktermsProvider);
    final isSaleByOwner = ref.watch(isSaleByOwnerProvider);
    final signupState = ref.watch(signupStateNotifierProvider);

    Future<void> launchTermsAndConditionUrl() async {
      final Uri url = Uri.parse(HelperConstant.termsAndConditions);

      if (!await launchUrl(url)) {
        throw Exception(
          'Could not launch ${HelperConstant.termsAndConditions}',
        );
      }
    }

    ref.listen(signupStateNotifierProvider.select((value) => value), ((
      previous,
      next,
    ) {
      //show Snackbar on failure
      if (next is Failure) {
        CustomToast.showToast(
          next.exception.message.toString(),
          status: ToastStatus.error,
        );
      } else if (next is Success) {
        CustomToast.showToast('success', status: ToastStatus.success);
        context.router.replaceAll([LoginScreen()]);
        // context.router.pushAndPopUntil(
        //     SuccessScreen(
        //       fromLogin: false,
        //     ),
        //     predicate: (_) => false);
      }
    }));

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
          formKey: formKey,
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
      isLoading: signupState is Loading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          // title: const Text('Sign Up',),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(child: AppImage()),
                          Spacing.sizedBoxH_12(),
                          Text(
                            'Create Your Account',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          Spacing.sizedBoxH_10(),
                          Text(
                            'Join Open House and explore properties with ease!',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          Spacing.sizedBoxH_20(),
                          AuthField(
                            name: 'first_name',
                            textCapitalization: TextCapitalization.words,
                            hintText: 'First Name',
                            labelText: 'First Name',
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.required(
                              errorText: 'First Name is empty.',
                            ),
                            onChanged: (value) {
                              if (formKey.currentState?.fields['first_name']
                                      ?.hasError ??
                                  false) {
                                formKey.currentState?.fields['first_name']
                                    ?.validate();
                              }
                            },
                            controller: fNameController,
                          ),
                          Spacing.sizedBoxH_16(),
                          AuthField(
                            name: 'last_name',
                            hintText: 'Last Name',
                            textCapitalization: TextCapitalization.words,
                            labelText: 'Last Name',
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.required(
                              errorText: 'Last Name is empty.',
                            ),
                            onChanged: (value) {
                              if (formKey.currentState?.fields['last_name']
                                      ?.hasError ??
                                  false) {
                                formKey.currentState?.fields['last_name']
                                    ?.validate();
                              }
                            },
                            controller: lnameController,
                          ),
                          Spacing.sizedBoxH_16(),
                          AuthField(
                            name: 'email',
                            hintText: 'Email',
                            labelText: 'Email',
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Email Address is empty.',
                              ),
                              FormBuilderValidators.email(
                                errorText: 'Invalid Email Address',
                              ),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              if (formKey.currentState?.fields['email']
                                      ?.hasError ??
                                  false) {
                                formKey.currentState?.fields['email']
                                    ?.validate();
                              }
                            },
                            controller: emailController,
                          ),
                          Spacing.sizedBoxH_16(),
                          AuthField(
                            name: 'phone_number',
                            hintText: 'Phone Number',
                            labelText: 'Phone Number',
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Phone Number is empty.',
                              ),
                              FormBuilderValidators.match(
                                RegExp(
                                  r'^(?:\+1\s?)?(\([2-9][0-9]{2}\)|[2-9][0-9]{2})[-\.\s]?[0-9]{3}[-\.\s]?[0-9]{4}$',
                                ),
                                errorText: 'Invalid American Phone Number',
                              ),
                            ]),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              if (formKey.currentState?.fields['phone_number']
                                      ?.hasError ??
                                  false) {
                                formKey.currentState?.fields['phone_number']
                                    ?.validate();
                              }
                            },
                            controller: phoneController,
                          ),
                          Spacing.sizedBoxH_16(),
                          AuthField(
                            name: 'password',
                            hintText: 'Password',
                            labelText: 'Password',
                            onChanged: (p0) {
                              if (formKey.currentState?.fields['password']
                                      ?.hasError ??
                                  false) {
                                formKey.currentState?.fields['password']
                                    ?.validate();
                              }
                            },
                            textInputAction: TextInputAction.next,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Password is required.',
                              ),
                              FormBuilderValidators.minLength(
                                8,
                                errorText:
                                    'Password must be at least 8 characters.',
                              ),
                              // FormBuilderValidators.match(
                              //   r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                              //   errorText:
                              //       'Password must contain an uppercase, a lowercase, a number, and a special character.',
                              // ),
                            ]),
                            obscureText: true,
                            controller: passwordController,
                          ),
                          Spacing.sizedBoxH_16(),
                          AuthField(
                            name: 'confirm_password',
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password',
                            onChanged: (p0) {
                              if (formKey.currentState
                                      ?.fields['confirm_password']?.hasError ??
                                  false) {
                                formKey.currentState?.fields['confirm_password']
                                    ?.validate();
                              }
                            },
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm Password is empty';
                              }
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            controller: confirmpasswordController,
                          ),
                          Spacing.sizedBoxH_08(),
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
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              size: 16,
                            ),
                            onTap: () => showOfficeAddressDrawer(context),
                          ),
                          Spacing.sizedBoxH_08(),
                          AuthField(
                            name: 'promo_code',
                            hintText: 'Promo Code',
                            labelText: 'Promo Code',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              if (formKey.currentState?.fields['promo_code']
                                      ?.hasError ??
                                  false) {
                                formKey.currentState?.fields['promo_code']
                                    ?.validate();
                              }
                            },
                            controller: promocodeController,
                          ),
                          Spacing.sizedBoxH_08(),
                          CheckboxListTile(
                            value: termsState,
                            visualDensity: VisualDensity.compact,
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (state) {
                              ref.read(checktermsProvider.notifier).state =
                                  state!;
                            },
                            title: RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: 'terms and conditions',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors.primary,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launchTermsAndConditionUrl();
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  loginButton(ref),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?  ',
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Sign In',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacing.sizedBoxH_60(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
      // else {
      //   data.addAll({
      //     "latitude": 27.6745405,
      //     "longitude": 85.4478716,
      //   });
      // }
    } catch (_) {
      // data.addAll({
      //   "latitude": 27.6745405,
      //   "longitude": 85.4478716,
      // });
    }
    return data;
  }

  Widget loginButton(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ActionButton(
        width: double.infinity,
        label: 'Sign Up',
        onPressed: () async {
          try {
            if (ref.read(checktermsProvider.notifier).state) {
              if (formKey.currentState!.saveAndValidate()) {
                Map<String, dynamic> currentMapData =
                    formKey.currentState!.value;
                Map<String, dynamic> data = {};
                // Set keys with empty values to null
                currentMapData.forEach((key, value) {
                  if (value == null || value == '') {
                    data[key] = null;
                  } else {
                    data[key] = value;
                  }
                });

                final location = await locationSetUp(currentMapData);
                final isOwner = ref.read(isSaleByOwnerProvider);

                data.addAll({
                  'terms_and_conditions': true,
                  'location': location,
                  'is_owner': isOwner,
                });
                // Remove fields if is_owner is true
                if (isOwner == true) {
                  data.remove('realty_name');
                  data.remove('license_number');
                }

                ref.read(signupStateNotifierProvider.notifier).signup(data);
              }
            } else {
              CustomToast.showToast(
                'Please agree to the terms and conditions',
                status: ToastStatus.error,
              );
            }
          } catch (e) {
            CustomToast.showToast(e.toString(), status: ToastStatus.error);
          }
        },
        textColor: AppColors.white,
      ),
    );
  }
}

class ChooseOwnerOrRealty extends ConsumerWidget {
  const ChooseOwnerOrRealty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaleByOwner = ref.watch(isSaleByOwnerProvider);

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Radio<bool>(
                value: true,
                groupValue: isSaleByOwner,
                onChanged: (value) {
                  ref.read(isSaleByOwnerProvider.notifier).state = value!;
                },
              ),
              Text('Sale by owner'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio<bool>(
                value: false,
                groupValue: isSaleByOwner,
                onChanged: (value) {
                  ref.read(isSaleByOwnerProvider.notifier).state = value!;
                },
              ),
              Text('Realtor'),
            ],
          ),
        ),
      ],
    );
  }
}
