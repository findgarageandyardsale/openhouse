import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';
import 'package:open_house/features/authentication/presentation/widgets/auth_field.dart';
import 'package:open_house/features/explore/presentation/constants/filter_constants.dart';
import 'package:open_house/services/capitalize_word_formatter_service.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/widgets/custom_bottomsheet.dart';

class StepTwo extends ConsumerWidget {
  const StepTwo({
    super.key,
    required this.streetController,
    required this.suiteController,
    required this.cityController,
    required this.stateController,
    required this.zipController,
  });

  final TextEditingController stateController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController suiteController;
  final TextEditingController zipController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        Spacing.sizedBoxH_08(),
        AuthField(
          name: 'street_number',
          hintText: 'Street Name*',
          labelText: 'Street Name*',
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Street Name cannot be empty.',
            ),
          ]),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            ref.read(addDataNotifierProvider.notifier).setStreetName(value);
          },
          inputFormatters: [
            CapitalizeWordsInputFormatter(),
          ], // Apply the custom TextInputFormatter

          controller: streetController,
        ),
        Spacing.sizedBoxH_16(),
        AuthField(
          name: 'suite_apt',
          hintText: 'Suite/Apt',
          labelText: 'Suite/Apt',
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            // FormBuilderValidators.required(
            //     errorText: 'Suite/Apt cannot be empty.'),
          ]),

          keyboardType: TextInputType.text,
          onChanged: (value) {
            ref.read(addDataNotifierProvider.notifier).setSuiteApt(value);
          },
          controller: suiteController,
        ),
        Spacing.sizedBoxH_16(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AuthField(
                name: 'city',
                hintText: 'City*',
                labelText: 'City*',
                inputFormatters: [CapitalizeWordsInputFormatter()],
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'City cannot be empty.',
                  ),
                ]),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  ref.read(addDataNotifierProvider.notifier).setCity(value);
                },
                controller: cityController,
              ),
            ),
            Spacing.sizedBoxW_12(),
            Expanded(
              child: AuthField(
                name: 'state',
                hintText: 'State*',
                labelText: 'State*',
                readOnly: true,
                onTap: () {
                  primaryBottomSheet(
                    context,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select State',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: FilterConstants.usStates.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    '${FilterConstants.usStates[index]['name']!} (${FilterConstants.usStates[index]['abbreviation']!})',
                                  ),
                                  onTap: () {
                                    // stateController.text =
                                    //     usStates[index]['abbreviation']!;
                                    Navigator.pop(context);
                                    final value =
                                        FilterConstants
                                            .usStates[index]['abbreviation']!;
                                    stateController.text = value;

                                    ref
                                        .read(addDataNotifierProvider.notifier)
                                        .setState(value);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'State cannot be empty.',
                  ),
                ]),
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                controller: stateController,
              ),
            ),
          ],
        ),
        Spacing.sizedBoxH_16(),
        AuthField(
          name: 'zip_code',
          hintText: 'Zip Code*',
          labelText: 'Zip Code*',
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Zip Code cannot be empty.',
            ),
          ]),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            ref.read(addDataNotifierProvider.notifier).setZipCode(value);
          },
          controller: zipController,
        ),
      ],
    );

    // return AddressLocationWidget()
  }
}
