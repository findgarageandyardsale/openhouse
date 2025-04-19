import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:open_house/features/add_edit_sale/presentation/provider/cat_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/property_type_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';
import 'package:open_house/features/explore/presentation/constants/filter_constants.dart';
import 'package:open_house/features/explore/presentation/providers/filter_provider.dart';
import 'package:open_house/features/explore/presentation/providers/filter_state_provider.dart';
import 'package:open_house/features/explore/presentation/providers/state/filter_state.dart';
import 'package:open_house/features/explore/presentation/widgets/custom_choice_chip.dart';
import 'package:open_house/features/explore/presentation/widgets/custom_dropdown.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/action_button.dart';

class FilterDrawerWidget extends ConsumerWidget {
  const FilterDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 16,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _buildHeader(context),
                    Spacing.sizedBoxH_16(),
                    _buildPriceRange(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildDistanceSlider(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildCategorySection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildPropertyTypeSection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildBedroomSection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildBathroomSection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildYearBuiltSection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildCoveredAreaSection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildLotSizeSection(context, ref, filterState),
                    Spacing.sizedBoxH_16(),
                    _buildSortBySection(context, ref, filterState),
                    // const Spacer(),
                  ],
                ),
              ),
              _buildActionButtons(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Filters',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildPriceRange(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Range',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: RangeSlider(
            values: RangeValues(state.priceMin, state.priceMax),
            min: 10000,
            max: 1000000,
            divisions: 99,
            labels: RangeLabels(
              '\$${(state.priceMin / 1000).round()}K',
              '\$${(state.priceMax / 1000).round()}K',
            ),
            onChanged: (RangeValues values) {
              ref
                  .read(filterProvider.notifier)
                  .updatePriceRange(values.start, values.end);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${(state.priceMin / 1000).round()}K'),
            Text('\$${(state.priceMax / 1000).round()}K'),
          ],
        ),
      ],
    );
  }

  Widget _buildDistanceSlider(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Distance in Miles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Slider(
          value: state.distance,
          min: 0,
          max: 300,
          padding: EdgeInsets.zero,
          divisions: 3,
          inactiveColor: AppColors.primaryBorder,
          label: '${state.distance.round()} miles',
          onChanged: (value) {
            ref.read(filterProvider.notifier).updateDistance(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('0'), Text('100'), Text('200'), Text('300')],
        ),
      ],
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    final catstate = ref.watch(catNotifierProvider);

    return catstate.when(
      initial: () {
        return const SizedBox.shrink();
      },
      success: (categories) {
        List<Category> cats = (categories as List<dynamic>)
            .map((category) => Category.fromJson(category))
            .toList();
        return cats.isEmpty
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Property Category',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 10,
                    children: cats.map((category) {
                      return _buildMultiChoiceChip(
                        category,
                        state.selectedCategories ?? [],
                        (selected) {
                          ref
                              .read(filterProvider.notifier)
                              .updateCategories(category);
                        },
                        context,
                      );
                    }).toList(),
                  ),
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
              children: [1, 2, 3, 4, 5, 6]
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
    );
  }

  Widget _buildPropertyTypeSection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    final typeState = ref.watch(propertyTypeNotifierProvider);

    return typeState.when(
      initial: () {
        return const SizedBox.shrink();
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      failure: (failure) {
        return const SizedBox.shrink();
      },
      success: (success) {
        final typeList = (success as List)
            .map((e) => PropertyTypeModel.fromJson(e))
            .toList();
        return typeList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Property Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 10,
                    children: typeList.map((type) {
                      return _buildMultiChoiceChip(
                        type,
                        state.selectedPropertyTypes ?? [],
                        (selected) {
                          // final current = List<String>.from(
                          //   state.selectedPropertyTypes??[],
                          // );
                          // if (selected) {
                          //   if (type == 'ALL') {
                          //     current.clear();
                          //     current.add('ALL');
                          //   } else {
                          //     current.remove('ALL')
                          //     current.add(type);
                          //   }
                          // } else {
                          //   current.remove(type);
                          //   if (current.isEmpty) current.add('ALL');
                          // }
                          ref
                              .read(filterProvider.notifier)
                              .updatePropertyTypes(type);
                        },
                        context,
                      );
                    }).toList(),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildBedroomSection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BEDROOMS COUNT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacing.sizedBoxH_16(),
        CustomDropdown<String>(
          value: state.selectedBedrooms.isNotEmpty
              ? state.selectedBedrooms.first
              : null,
          items: FilterConstants.bedrooms,
          hint: 'Select Bedrooms',
          onChanged: (value) {
            if (value != null) {
              ref.read(filterProvider.notifier).updateBedrooms([value]);
            } else {
              ref.read(filterProvider.notifier).updateBedrooms([]);
            }
          },
          itemToString: (item) => item,
        ),
      ],
    );
  }

  Widget _buildBathroomSection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BATHROOM COUNT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacing.sizedBoxH_16(),
        CustomDropdown<String>(
          value: state.selectedBathrooms.isNotEmpty
              ? state.selectedBathrooms.first
              : null,
          items: FilterConstants.bathrooms,
          hint: 'Select Bathrooms',
          onChanged: (value) {
            if (value != null) {
              ref.read(filterProvider.notifier).updateBathrooms([value]);
            } else {
              ref.read(filterProvider.notifier).updateBathrooms([]);
            }
          },
          itemToString: (item) => item,
        ),
      ],
    );
  }

  Widget _buildYearBuiltSection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('YEAR BUILT', style: TextStyle(fontWeight: FontWeight.bold)),
        Spacing.sizedBoxH_16(),
        CustomDropdown<String>(
          value: state.yearBuilt,
          items: FilterConstants.yearBuiltRanges,
          hint: 'Select Year Built',
          suffixText: ' years',
          onChanged: (value) {
            ref.read(filterProvider.notifier).updateYearBuilt(value);
          },
          itemToString: (item) => item,
        ),
      ],
    );
  }

  Widget _buildCoveredAreaSection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'COVERED AREA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacing.sizedBoxH_16(),
        CustomDropdown<String>(
          value: state.coveredArea,
          items: FilterConstants.coveredAreaRanges,
          hint: 'Select Covered Area',
          suffixText: ' sq ft',
          onChanged: (value) {
            ref.read(filterProvider.notifier).updateCoveredArea(value);
          },
          itemToString: (item) => item,
        ),
      ],
    );
  }

  Widget _buildLotSizeSection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('LOT SIZE', style: TextStyle(fontWeight: FontWeight.bold)),
        Spacing.sizedBoxH_16(),
        CustomDropdown<String>(
          value: state.lotSize,
          items: FilterConstants.lotSizeRanges,
          hint: 'Select Lot Size',
          suffixText: ' sq ft',
          onChanged: (value) {
            ref.read(filterProvider.notifier).updateLotSize(value);
          },
          itemToString: (item) => item,
        ),
      ],
    );
  }

  Widget _buildSortBySection(
    BuildContext context,
    WidgetRef ref,
    FilterState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SORT BY:', style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 10,
          children: FilterConstants.sortOptions.map((option) {
            return _buildMultiChoiceChip(option, [state.sortBy], (
              selected,
            ) {
              ref.read(filterProvider.notifier).updateSortBy(option);
            }, context);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ActionButton(
            height: 35,
            buttonColor: Colors.white,
            textColor: AppColors.primary,
            borderColor: AppColors.primary,
            onPressed: () {
              ref.read(filterProvider.notifier).resetFilters();
              final filterNotifier = ref.read(filterNotifierProvider.notifier);
              filterNotifier.resetToInitial();
              Navigator.pop(context);
            },
            label: 'Cancel',
            textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Spacing.sizedBoxW_10(),
        Expanded(
          child: ActionButton(
            height: 35,
            onPressed: () {
              Navigator.pop(context);
              // ref
              //     .read(filterNotifierProvider.notifier)
              //     .ref
              //     .read(filterProvider.notifier)
              //     .resetFilters();

              //here I want to set those value of filterNotifierProvider  with filterProvider value whose value are not null.

              final filterState = ref.read(filterProvider);
              final filterNotifier = ref.read(filterNotifierProvider.notifier);

              // Update the filterNotifierProvider state with non-null values from filterProvider
              filterNotifier.state = filterNotifier.state.copyWith(
                priceMin: filterState.priceMin,
                priceMax: filterState.priceMax,
                distance: filterState.distance,
                selectedCategories:
                    (filterState.selectedCategories ?? []).isNotEmpty
                        ? filterState.selectedCategories
                        : null,
                selectedPropertyTypes:
                    (filterState.selectedPropertyTypes ?? []).isNotEmpty
                        ? filterState.selectedPropertyTypes
                        : null,
                selectedBedrooms: filterState.selectedBedrooms.isNotEmpty
                    ? filterState.selectedBedrooms
                    : null,
                selectedBathrooms: filterState.selectedBathrooms.isNotEmpty
                    ? filterState.selectedBathrooms
                    : null,
                yearBuilt: filterState.yearBuilt,
                coveredArea: filterState.coveredArea,
                lotSize: filterState.lotSize,
                sortBy: filterState.sortBy,
              );
            },
            label: 'Apply Filters',
            textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultiChoiceChip(
    dynamic label,
    List<dynamic> selectedValues,
    Function(bool) onSelected,
    BuildContext context,
  ) {
    return CustomChoiceChip(
      label: label,
      isSelected: selectedValues.contains(label),
      onSelected: () => onSelected(!selectedValues.contains(label)),
    );
  }
}
