import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DescriptionChip extends StatelessWidget {
  const DescriptionChip({super.key, required this.text, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color borderColor = color ?? (AppColors.secondary);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
