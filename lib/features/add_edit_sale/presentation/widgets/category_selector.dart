import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/add_data_provider.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/custom_filter_chip.dart';

class CategorySelector extends StatefulWidget {
  final List<Category> cats;

  const CategorySelector({super.key, required this.cats});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  bool _showAll = false; // State to track whether to show all categories or not
  int perLine = 3; // Number of items per line

  @override
  Widget build(BuildContext context) {
    // Determine the number of categories to display initially
    final initialCategories =
        _showAll ? widget.cats : widget.cats.take(perLine * 3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Wrap widget to display categories
        Wrap(
          runSpacing: 8.0, // Vertical spacing between rows
          spacing: 8.0, // Horizontal spacing between chips
          children:
              initialCategories.map((singleCat) {
                return Consumer(
                  builder: (context, ref, __) {
                    final notifier = ref.read(addDataNotifierProvider.notifier);
                    final isSelected = notifier.isSelected(singleCat);
                    return CustomFilterChip(
                      text: singleCat.name ?? '',
                      activeColor: AppColors.primaryBorder,
                      isActive: isSelected,
                      unactiveColor: Colors.transparent,
                      onTap: () {
                        ref
                            .read(addDataNotifierProvider.notifier)
                            .updateCat(singleCat);
                      },
                    );
                  },
                );
              }).toList(),
        ),

        // Show More / Show Less button
        if (widget.cats.length >
            perLine * 3) // Only show the button if there are more categories
          TextButton(
            onPressed: () {
              setState(() {
                _showAll =
                    !_showAll; // Toggle between showing all and showing limited categories
              });
            },
            child: Text(
              _showAll
                  ? 'Show Less'
                  : 'Show More', // Change button text based on state
              style: const TextStyle(
                color: AppColors.primary, // Customize the button text color
              ),
            ),
          ),
      ],
    );
  }
}
