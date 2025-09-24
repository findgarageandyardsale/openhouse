import 'package:flutter/material.dart';
import 'package:open_house/shared/theme/app_colors.dart';

class FreePostsBanner extends StatelessWidget {
  const FreePostsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1.0,
        ),
      ),
      child: Text(
        'We are launching our app, and for promotional purposes, event posting is free of cost for a limited time.',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
