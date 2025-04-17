import 'package:flutter/material.dart';

import '../constants/spacing.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required this.fromDetail,
    required this.location,
  });
  final bool fromDetail;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: fromDetail ? 24 : 18),
        Spacing.sizedBoxW_04(),
        Expanded(
          child: Text(
            location,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
