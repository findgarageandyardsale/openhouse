import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';
import 'package:open_house/features/explore/presentation/providers/filter_state_provider.dart';
import 'package:open_house/features/explore/presentation/providers/state/filter_state.dart';
import 'package:open_house/features/explore/presentation/screens/explore_screen.dart';
import 'package:open_house/features/explore/presentation/widgets/slider_dialog_content.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/action_button.dart';
import 'package:open_house/shared/constants/filter_constants.dart';
import 'package:open_house/shared/widgets/custom_filter_chip.dart';

// Price Range Data
class PriceRange {
  final double min;
  final double max;
  final String label;

  const PriceRange({
    required this.min,
    required this.max,
    required this.label,
  });
}

// Price Range Dialog
class PriceRangeDialogContent extends ConsumerStatefulWidget {
  const PriceRangeDialogContent({super.key});

  @override
  ConsumerState<PriceRangeDialogContent> createState() =>
      _PriceRangeDialogContentState();
}

class _PriceRangeDialogContentState
    extends ConsumerState<PriceRangeDialogContent> {
  PriceRange? _selectedRange;

  static const List<PriceRange> _priceRanges = [
    PriceRange(min: 100000, max: 500000, label: '\$100,000 - \$500,000'),
    PriceRange(min: 500000, max: 1000000, label: '\$500,000 - \$1,000,000'),
    PriceRange(min: 1000000, max: 2000000, label: '\$1,000,000 - \$2,000,000'),
    PriceRange(min: 2000000, max: 5000000, label: '\$2,000,000 - \$5,000,000'),
    PriceRange(min: 5000000, max: 10000000, label: '\$2,000,000 - \$5,000,000'),
  ];

  @override
  void initState() {
    super.initState();
    final filterState = ref.read(filterNotifierProvider);

    // Find the matching price range if one exists
    for (final range in _priceRanges) {
      if (filterState.priceMin == range.min &&
          filterState.priceMax == range.max) {
        _selectedRange = range;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHead(
          title: 'Price Range',
          clearWidget: _selectedRange != null
              ? TextIconButtonWidget(
                  onPressed: () {
                    setState(() {
                      _selectedRange = null;
                    });
                    ref.read(filterNotifierProvider.notifier).updateState(
                          priceMin: 10000,
                          priceMax: 1000000,
                        );
                    Navigator.pop(context);
                  },
                )
              : null,
        ),
        Spacing.sizedBoxH_16(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _priceRanges.length,
          itemBuilder: (context, index) {
            final priceRange = _priceRanges[index];
            return RadioListTile<PriceRange>(
              title: Text(
                priceRange.label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: priceRange,
              groupValue: _selectedRange,
              onChanged: (value) {
                setState(() {
                  _selectedRange = value;
                });
              },
            );
          },
        ),
        Spacing.sizedBoxH_16(),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Cancel',
                onPressed: () => Navigator.pop(context),
                textColor: AppColors.primary,
                buttonColor: Colors.white,
              ),
            ),
            Spacing.sizedBoxW_16(),
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Apply',
                onPressed: () {
                  if (_selectedRange != null) {
                    ref.read(filterNotifierProvider.notifier).updateState(
                          priceMin: _selectedRange!.min,
                          priceMax: _selectedRange!.max,
                        );
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Date Filter Dialog
class DateFilterDialogContent extends ConsumerStatefulWidget {
  const DateFilterDialogContent({super.key});

  @override
  ConsumerState<DateFilterDialogContent> createState() =>
      _DateFilterDialogContentState();
}

class _DateFilterDialogContentState
    extends ConsumerState<DateFilterDialogContent> {
  DateFilter? _selectedFilter;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    final filterState = ref.read(filterNotifierProvider);
    if (filterState.startDate != null && filterState.endDate != null) {
      _startDate = filterState.startDate;
      _endDate = filterState.endDate;
      _selectedFilter =
          _getDateFilter(filterState.startDate!, filterState.endDate!);
    }
  }

  DateFilter? _getDateFilter(DateTime startDate, DateTime endDate) {
    if (startDate.year == endDate.year &&
        startDate.month == endDate.month &&
        startDate.day == endDate.day &&
        startDate.day == DateTime.now().day) {
      return DateFilter.today;
    }
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    if (startDate.isAtSameMomentAs(weekAgo) &&
        endDate.isAtSameMomentAs(DateTime.now())) {
      return DateFilter.toWeek;
    }
    final monthAgo = DateTime.now().subtract(const Duration(days: 30));
    if (startDate.isAtSameMomentAs(monthAgo) &&
        endDate.isAtSameMomentAs(DateTime.now())) {
      return DateFilter.toMonth;
    }
    return DateFilter.customRange;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date Filter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Spacing.sizedBoxH_16(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: DateFilter.values.length,
          itemBuilder: (context, index) {
            final dateFilter = DateFilter.values[index];
            return RadioListTile(
              title: Text(dateFilter.name),
              value: dateFilter,
              groupValue: _selectedFilter,
              onChanged: (value) async {
                if (value != null) {
                  setState(() {
                    _selectedFilter = value;
                  });

                  if (value == DateFilter.customRange) {
                    final dates = await showDateRangePicker(
                      context: context,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (dates != null) {
                      setState(() {
                        _startDate = dates.start;
                        _endDate = dates.end;
                      });
                    }
                  } else {
                    switch (value) {
                      case DateFilter.today:
                        _startDate = DateTime.now();
                        _endDate = DateTime.now();
                        break;
                      case DateFilter.toWeek:
                        _startDate =
                            DateTime.now().subtract(const Duration(days: 7));
                        _endDate = DateTime.now();
                        break;
                      case DateFilter.toMonth:
                        _startDate =
                            DateTime.now().subtract(const Duration(days: 30));
                        _endDate = DateTime.now();
                        break;
                      case DateFilter.customRange:
                        break;
                    }
                  }
                }
              },
            );
          },
        ),
        Spacing.sizedBoxH_16(),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Cancel',
                onPressed: () => Navigator.pop(context),
                textColor: AppColors.primary,
                buttonColor: Colors.white,
              ),
            ),
            Spacing.sizedBoxW_16(),
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Clear',
                onPressed: () {
                  setState(() {
                    _selectedFilter = null;
                    _startDate = null;
                    _endDate = null;
                  });
                },
                textColor: AppColors.primary,
                buttonColor: Colors.white,
              ),
            ),
            Spacing.sizedBoxW_16(),
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Apply',
                onPressed: () {
                  if (_startDate != null && _endDate != null) {
                    ref.read(filterNotifierProvider.notifier).updateState(
                          startDate: _startDate,
                          endDate: _endDate,
                        );
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Sort By Filter Dialog
class SortByFilterDialogContent extends ConsumerStatefulWidget {
  const SortByFilterDialogContent({super.key});

  @override
  ConsumerState<SortByFilterDialogContent> createState() =>
      _SortByFilterDialogContentState();
}

class _SortByFilterDialogContentState
    extends ConsumerState<SortByFilterDialogContent> {
  late String _selectedSort;

  @override
  void initState() {
    super.initState();
    _selectedSort = ref.read(filterNotifierProvider).sortBy;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHead(
          title: 'Sort By',
          subtitle: _selectedSort != 'Newest Listings' ? '1 Selected' : null,
          clearWidget: _selectedSort != 'Newest Listings'
              ? TextIconButtonWidget(
                  onPressed: () {
                    setState(() {
                      _selectedSort = 'Newest Listings';
                    });
                    ref
                        .read(filterNotifierProvider.notifier)
                        .updateSortBy(_selectedSort);
                    Navigator.pop(context);
                  },
                )
              : null,
        ),
        Spacing.sizedBoxH_16(),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: FilterConstants.sortOptions.map((option) {
            return CustomFilterChip(
              text: option,
              isActive: _selectedSort == option,
              onTap: () {
                setState(() {
                  _selectedSort = option;
                });
              },
            );
          }).toList(),
        ),
        Spacing.sizedBoxH_20(),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Cancel',
                onPressed: () => Navigator.pop(context),
                textColor: AppColors.primary,
                buttonColor: Colors.white,
              ),
            ),
            Spacing.sizedBoxW_16(),
            Expanded(
              child: ActionButton(
                height: 36,
                label: 'Apply',
                onPressed: () {
                  ref
                      .read(filterNotifierProvider.notifier)
                      .updateSortBy(_selectedSort);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Helper functions to show dialogs
void showPriceRangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: PriceRangeDialogContent(),
        ),
      );
    },
  );
}

void showDateFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: DateFilterDialogContent(),
        ),
      );
    },
  );
}

void showSortByFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SortByFilterDialogContent(),
        ),
      );
    },
  );
}

void showSliderDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SliderDialogContent(),
        ),
      );
    },
  );
}
