import 'package:flutter/material.dart';
import 'package:open_house/shared/theme/app_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? (selectedColor ?? AppColors.primary)
                  : (unselectedColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color:
                isSelected
                    ? (selectedTextColor ?? AppColors.white)
                    : (unselectedTextColor ?? AppColors.primary),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
