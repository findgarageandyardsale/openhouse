

// class StatusChip extends StatelessWidget {
//   const StatusChip({super.key, required this.status});
//   final FurnishingEnum status;

//   @override
//   Widget build(BuildContext context) {
//     Color boxColor =
//         status == FurnishingEnum.fullyFurnished
//             ? AppColors.tertiary
//             : AppColors.secondary;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       decoration: BoxDecoration(
//         color: boxColor,
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Text(
//         status.name,
//         style: Theme.of(
//           context,
//         ).textTheme.bodySmall?.copyWith(color: Colors.white),
//       ),
//     );
//   }
// }
