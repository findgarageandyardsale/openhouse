import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/sale_timing.dart';
import 'package:open_house/features/authentication/presentation/widgets/auth_field.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';

class StepFive extends ConsumerWidget {
  const StepFive({
    super.key,
    required this.descriptionController,
    required this.dateController,
  });

  final TextEditingController descriptionController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Open House Information',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        Spacing.sizedBoxH_08(),
        AuthField(
          name: 'description',
          hintText: 'Property Description*',
          labelText: 'Property Description*',
          controller: descriptionController,
          maxlines: 4,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Description cannot be empty.',
            ),
          ]),
          onChanged: (value) {
            ref.read(addDataNotifierProvider.notifier).setDescription(value);
          },
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.multiline,
        ),
        Spacing.sizedBoxH_16(),

        AuthField(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1980, 1, 1),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
            );

            if (date != null) {
              ref.read(addDataNotifierProvider.notifier).setYearBuild(date);

              dateController.text = CustomDateUtils.formatDate(date);
              // ref
              //   .read(addDataNotifierProvider.notifier)
              //   .editTimeSlot(widget.timeSlot.copyWith(date: date));
            }
          },
          name: 'date_year',
          // validator: FormBuilderValidators.compose([
          //   FormBuilderValidators.required(
          //     errorText: 'Year Built cannot be empty.',
          //   ),
          // ]),
          readOnly: true,
          suffixIcon: const Icon(Icons.calendar_today),
          labelText: 'Year Built',
          hintText: 'Year Built',
          controller: dateController,
        ),
        Spacing.sizedBoxH_16(),
        const SaleTiming(),
      ],
    );
  }
}
