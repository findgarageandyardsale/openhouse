import 'package:flutter/material.dart';
import 'package:open_house/shared/theme/app_colors.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hint;
  final Function(T?) onChanged;
  final String Function(T) itemToString;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.itemToString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        // border: Border.all(color: AppColors.primaryBorder),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.extraLightGrey,
      ),
      child: DropdownButton<T>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(
          hint,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.black),
        ),
        items:
            items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  itemToString(item),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
