import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/property_type_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/image_screen.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';
import 'package:open_house/features/authentication/presentation/widgets/auth_field.dart';

import 'package:open_house/services/capitalize_word_formatter_service.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/widgets/custom_bottomsheet.dart';

class StepOne extends ConsumerWidget {
  const StepOne({
    super.key,
    required this.propertyTypeController,
    required this.priceController,
    required this.titleController,
  });

  final TextEditingController propertyTypeController;
  final TextEditingController priceController;
  final TextEditingController titleController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const TitleHead(
          title: 'Add Image',
          subtitle: 'Upload up to max 10 images of your item',
        ),
        Spacing.sizedBoxH_08(),
        const ImageScreen(),
        Spacing.sizedBoxH_16(),

        AuthField(
          name: 'name',
          hintText: 'Property Name*',
          labelText: 'Property Name*',
          onChanged: (value) {
            // Update the state with the new value
            ref.read(addDataNotifierProvider.notifier).setTitleName(value);
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Property Name cannot be empty.',
            ),
          ]),
          controller: titleController,
          inputFormatters: [
            CapitalizeWordsInputFormatter(),
          ], // Apply the custom TextInputFormatter
        ),
        Spacing.sizedBoxH_16(),
        AuthField(
          name: 'price',
          hintText: 'Price*',
          labelText: 'Price*',
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Price cannot be empty.'),
          ]),
          controller: priceController,
          onChanged: (value) {
            // Update the state with the new value
            ref
                .read(addDataNotifierProvider.notifier)
                .setPrice(int.tryParse(value ?? ''));
          },
        ),
        Spacing.sizedBoxH_16(),
        AuthField(
          name: 'property_type',
          hintText: 'Property Type',
          labelText: 'Property Type',
          controller: propertyTypeController,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          readOnly: true,
          onTap: () {
            primaryBottomSheet(
              context,
              child: PropertyTypeWidget(
                onTap: (value) {
                  propertyTypeController.text = value.name ?? '';
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class PropertyTypeWidget extends ConsumerWidget {
  const PropertyTypeWidget({super.key, this.onTap});
  final Function(PropertyTypeModel)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeState = ref.watch(propertyTypeNotifierProvider);
    return typeState.when(
      initial: () {
        return SizedBox.shrink();
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      failure: (failure) {
        return Center(child: Text(failure.message ?? ''));
      },
      success: (success) {
        final typeList =
            (success as List)
                .map((e) => PropertyTypeModel.fromJson(e))
                .toList();
        return typeList.isNotEmpty
            ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const TitleHead(title: 'Property Type'),
                ),
                ...typeList.map(
                  (e) => ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      if (onTap != null) onTap!(e);
                    },
                    title: Text(e.name ?? ''),
                  ),
                ),
              ],
            )
            : Center(child: Text('No data available'));
      },
    );
  }
}
