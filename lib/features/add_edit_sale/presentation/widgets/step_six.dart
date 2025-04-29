import 'package:flutter/material.dart';
import 'package:open_house/shared/constants/spacing.dart';

class StepSix extends StatelessWidget {
  const StepSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Make Your Open House event Listing Live!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacing.sizedBoxH_16(),

        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text:
                    'Your potential clients can reach your OPEN HOUSE event easily and conveniently using this platform.\n\n',
              ),
              TextSpan(
                text:
                    'Your can save your TIME and ENERGY by not posting directional street signs ets. on side street and street corners. \n\n',
              ),
              TextSpan(
                text:
                    'Simply by paying \$5.00 per Open House Event. Your can post up to 10 events in advance\n\n',
              ),
              TextSpan(
                text: 'Note: ',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    'Once event is posted and paid, upon cancelation of any posted event, there will be no refund of fee paid',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
