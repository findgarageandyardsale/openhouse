import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/explore/presentation/providers/filter_state_provider.dart';
import 'package:open_house/features/explore/presentation/widgets/categories_list_bottomsheet.dart';
import 'package:open_house/features/explore/presentation/widgets/filter_dialogs.dart';
import 'package:open_house/features/explore/presentation/widgets/property_type_list_bottomsheet.dart';
import 'package:open_house/shared/enum/filter_enum.dart';
import 'package:open_house/shared/utils/print_utils.dart';
import 'package:open_house/shared/widgets/custom_bottomsheet.dart';
import 'package:open_house/shared/widgets/custom_filter_chip.dart';

class FilterChipWidget extends ConsumerWidget {
  const FilterChipWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterNotifierProvider);

    bool? checkActive(FilterEnum tag) {
      switch (tag) {
        case FilterEnum.all:
          return (filterState.radius == null &&
              filterState.priceMax == 1000000 &&
              filterState.priceMin == 10000 &&
              filterState.distance ==
                  (PrintUtils.radiusInAllChip ? null : 15) &&
              (filterState.selectedCategories ?? []).isEmpty &&
              (filterState.selectedPropertyTypes ?? []).isEmpty &&
              filterState.sortBy == 'Newest Listings');

        case FilterEnum.distance:
          return filterState.radius != null;
        case FilterEnum.category:
          return (filterState.selectedCategories ?? []).isNotEmpty;
        case FilterEnum.price:
          return filterState.priceMin != 10000 ||
              filterState.priceMax != 1000000;
        case FilterEnum.type:
          return (filterState.selectedPropertyTypes ?? []).isNotEmpty;
        case FilterEnum.sortBy:
          return filterState.sortBy != 'Newest Listings';
      }
    }

    void enumOnTap(FilterEnum tag) {
      switch (tag) {
        case FilterEnum.all:
          ref.read(filterNotifierProvider.notifier).updateToInitial();
          break;
        case FilterEnum.distance:
          showSliderDialog(context);
          break;
        case FilterEnum.category:
          primaryBottomSheet(
            padding: EdgeInsets.zero,
            context,
            child: const CategoriesListBottomsheet(),
          );
          break;
        case FilterEnum.price:
          showPriceRangeDialog(context);
          break;
        case FilterEnum.type:
          primaryBottomSheet(
            padding: EdgeInsets.zero,
            context,
            child: const PropertyTypeListBottomsheet(),
          );
          break;
        case FilterEnum.sortBy:
          showSortByFilterDialog(context);
          break;
      }
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: FilterEnum.values.map((tag) {
        return CustomFilterChip(
          text: tag.filterValue,
          onTap: () => enumOnTap(tag),
          isActive: checkActive(tag) ?? false,
        );
      }).toList(),
    );
  }
}
