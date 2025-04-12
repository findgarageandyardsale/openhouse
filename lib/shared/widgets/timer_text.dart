import 'package:flutter/material.dart';

import '../constants/spacing.dart';
import '../theme/app_colors.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.fromDetail,
    this.days,
    required this.date,
    required this.time,
  });
  final bool fromDetail;
  final String? days;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tileBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: fromDetail ? 24 : 16,
            color: AppColors.primary,
          ),
          Spacing.sizedBoxW_04(),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: date,
                style:
                    fromDetail
                        ? Theme.of(context).textTheme.bodyLarge
                        : Theme.of(context).textTheme.bodySmall,
                children: [const TextSpan(text: ' • '), TextSpan(text: time)],
              ),
            ),
          ),
          if (days != null) Spacing.sizedBoxW_04(),
          if (days != null && days != '0')
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                '+$days',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
