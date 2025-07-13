import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';
import 'package:open_house/features/authentication/presentation/widgets/auth_field.dart';
import 'package:open_house/features/explore/presentation/constants/filter_constants.dart';

import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/widgets/custom_bottomsheet.dart';

class StepThree extends HookConsumerWidget {
  const StepThree({
    super.key,
    required this.coveredAreaController,
    required this.lotSizeController,
    required this.bedroomsController,
    required this.bathroomsController,
  });
  final TextEditingController coveredAreaController;
  final TextEditingController lotSizeController;
  final TextEditingController bedroomsController;
  final TextEditingController bathroomsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyType = ref.watch(addDataNotifierProvider
        .select((value) => value?.openHouseProperty?.propertyType));

    useEffect(() {
      Future.microtask(() {
        lotSizeController.text = '';
        ref.read(addDataNotifierProvider.notifier).setLotSize(0);
      });
      return null;
    }, [propertyType]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Property Details',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        Spacing.sizedBoxH_08(),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: AuthField(
                name: 'covered_area',
                hintText: 'Covered Area*',
                labelText: 'Covered Area*',
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Covered Area cannot be empty.',
                  ),
                ]),
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                onChanged: (value) {
                  ref
                      .read(addDataNotifierProvider.notifier)
                      .setCoveredArea(int.tryParse(value ?? ''));
                },
                suffixIcon: SizedBox(
                  width: 50,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: const Text('sq. ft ', textAlign: TextAlign.center),
                  ),
                ),
                controller: coveredAreaController,
              ),
            ),
            Expanded(
              child: AuthField(
                name: 'lot_size',
                hintText: propertyType?.name?.toLowerCase() != 'sale' &&
                        propertyType?.name?.isNotEmpty == true
                    ? 'Parking Space'
                    : 'Lot Size*',
                labelText: propertyType?.name?.toLowerCase() != 'sale' &&
                        propertyType?.name?.isNotEmpty == true
                    ? 'Parking Space'
                    : 'Lot Size*',
                suffixIcon: propertyType?.name?.toLowerCase() != 'sale' &&
                        propertyType?.name?.isNotEmpty == true
                    ? null
                    : SizedBox(
                        width: 50,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: const Text('sq. ft ',
                              textAlign: TextAlign.center),
                        ),
                      ),
                readOnly: propertyType?.name?.toLowerCase() != 'sale' &&
                    propertyType?.name?.isNotEmpty == true,
                onTap: propertyType?.name?.toLowerCase() != 'sale' &&
                        propertyType?.name?.isNotEmpty == true
                    ? () {
                        primaryBottomSheet(
                          context,
                          child: ListBottomSheet(
                            onTap: (value) {
                              lotSizeController.text = value;
                              if (value == 'Street Parking') {
                                ref
                                    .read(addDataNotifierProvider.notifier)
                                    .setLotSize(0);
                              } else {
                                ref
                                    .read(addDataNotifierProvider.notifier)
                                    .setLotSize(int.parse(value));
                              }
                            },
                            items: [
                              'Street Parking',
                              '1',
                              '2',
                              '3',
                            ],
                            title: 'Parking Space',
                          ),
                        );
                      }
                    : null,
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Lot Size cannot be empty.',
                  ),
                ]),
                keyboardType: propertyType?.name?.toLowerCase() == 'rent'
                    ? TextInputType.text
                    : TextInputType.numberWithOptions(decimal: false),
                onChanged: propertyType?.name?.toLowerCase() == 'rent'
                    ? (value) {}
                    : (value) {
                        ref
                            .read(addDataNotifierProvider.notifier)
                            .setLotSize(int.tryParse(value ?? ''));
                      },
                controller: lotSizeController,
              ),
            ),
          ],
        ),
        Spacing.sizedBoxH_16(),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: AuthField(
                name: 'bedrooms',
                hintText: 'No. of Bedrooms*',
                labelText: 'No. of Bedrooms*',
                readOnly: true,
                onTap: () {
                  primaryBottomSheet(
                    context,
                    child: ListBottomSheet(
                      onTap: (value) {
                        bedroomsController.text = value;
                        if (value == '5+') {
                          ref
                              .read(addDataNotifierProvider.notifier)
                              .setBedrooms(5);
                        } else {
                          ref
                              .read(addDataNotifierProvider.notifier)
                              .setBedrooms(int.parse(value));
                        }
                      },
                      items: FilterConstants.bedrooms,
                      title: 'No. of Bedrooms',
                    ),
                  );
                },
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'No. of Bedrooms cannot be empty.',
                  ),
                ]),
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                controller: bedroomsController,
              ),
            ),
            Expanded(
              child: AuthField(
                name: 'bathrooms',
                hintText: 'No. of Bathrooms*',
                labelText: 'No. of Bathrooms*',
                readOnly: true,
                onTap: () {
                  primaryBottomSheet(
                    context,
                    child: ListBottomSheet(
                      onTap: (value) {
                        bathroomsController.text = value;

                        if (value == '5+') {
                          ref
                              .read(addDataNotifierProvider.notifier)
                              .setBathrooms(5);
                        } else {
                          ref
                              .read(addDataNotifierProvider.notifier)
                              .setBathrooms(int.parse(value));
                        }
                      },
                      items: FilterConstants.bedrooms,
                      title: 'No. of Bedrooms',
                    ),
                  );
                },
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'No. of Bathrooms cannot be empty.',
                  ),
                ]),
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                controller: bathroomsController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ListBottomSheet extends ConsumerWidget {
  const ListBottomSheet({
    super.key,
    this.onTap,
    required this.items,
    required this.title,
  });
  final Function(String)? onTap;

  final List<String> items;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return items.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TitleHead(title: title),
              ),
              ...items.map(
                (e) => ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    if (onTap != null) onTap!(e);
                  },
                  title: Text(e),
                ),
              ),
            ],
          )
        : Center(child: Text('No data available'));
  }
}
