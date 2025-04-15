import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/cat_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/category_selector.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';

import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';

class StepFour extends ConsumerWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(catNotifierProvider);
    final addCatdata = ref.watch(addDataNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          success: (categories) {
            List<Category> cats =
                (categories as List<dynamic>)
                    .map((category) => Category.fromJson(category))
                    .toList();
            return cats.isEmpty
                ? const SizedBox.shrink()
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        // if ((addCatdata?.openHouseProperty?.category ?? [])
                        //     .isNotEmpty)
                        //   Text(
                        //     '${(addCatdata?.openHouseProperty?.category ?? []).length} Selected',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                      ],
                    ),
                    Spacing.sizedBoxH_08(),
                    CategorySelector(cats: cats),
                  ],
                );
          },
          loading: () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TitleHead(title: 'Category'),
                Wrap(
                  runSpacing: 16.0,
                  spacing: 12.0,
                  children:
                      [1, 2, 3, 4, 5, 6]
                          .map(
                            (e) => Container(
                                  width: 120.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )
                                .animate(
                                  onPlay: (controller) => controller.repeat(),
                                )
                                .shimmer(
                                  color: Colors.grey.shade300,
                                  duration: const Duration(seconds: 2),
                                ),
                          )
                          .toList(),
                ),
                Spacing.sizedBoxH_20(),
              ],
            );
          },
          failure: (error) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  // Widget _buildMultiChoiceChip(
  //   String label,
  //   List<String> selectedValues,
  //   Function(bool) onSelected,
  //   BuildContext context,
  // ) {
  //   return CustomChoiceChip(
  //     label: label,
  //     isSelected: selectedValues.contains(label),
  //     onSelected: () => onSelected(!selectedValues.contains(label)),
  //   );
  // }
}
