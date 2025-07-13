import 'package:flutter/material.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/theme/app_colors.dart';

class AmenitiesLine extends StatelessWidget {
  const AmenitiesLine({
    super.key,
    required this.bedroom,
    required this.bathroom,
    required this.lotSize,
    required this.size,
    this.isSale = false,
  });
  final String? bedroom;
  final String? bathroom;
  final String? size;
  final String? lotSize;
  final bool? isSale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(text: bedroom),
            WidgetSpan(child: Spacing.sizedBoxW_06()),
            WidgetSpan(
              child: Icon(
                Icons.bed_rounded,
                size: 16,
                color: AppColors.tileColor,
              ),
            ),
            WidgetSpan(child: Spacing.sizedBoxW_14()),
            TextSpan(text: bathroom),
            WidgetSpan(child: Spacing.sizedBoxW_06()),
            WidgetSpan(
              child: Icon(
                Icons.bathtub_outlined,
                size: 16,
                color: AppColors.tileColor,
              ),
            ),
            WidgetSpan(child: Spacing.sizedBoxW_14()),
            TextSpan(text: size),
            WidgetSpan(child: Spacing.sizedBoxW_06()),
            WidgetSpan(
              child: Icon(
                Icons.square_outlined,
                size: 16,
                color: AppColors.tileColor,
              ),
            ),
            WidgetSpan(child: Spacing.sizedBoxW_14()),
            TextSpan(text: lotSize),
            WidgetSpan(child: Spacing.sizedBoxW_06()),
            WidgetSpan(
              child: Icon(
                isSale == true ? Icons.format_size : Icons.car_rental,
                size: 16,
                color: AppColors.tileColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
