import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/property_type_provider.dart';
import 'package:open_house/features/add_edit_sale/presentation/widgets/title_head.dart';
import 'package:open_house/features/explore/presentation/providers/filter_state_provider.dart';
import 'package:open_house/features/explore/presentation/screens/explore_screen.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/action_button.dart';
import 'package:open_house/shared/constants/spacing.dart';

class PropertyTypeListBottomsheet extends ConsumerStatefulWidget {
  const PropertyTypeListBottomsheet({super.key});

  @override
  ConsumerState<PropertyTypeListBottomsheet> createState() =>
      _PropertyTypeListBottomsheetState();
}

class _PropertyTypeListBottomsheetState
    extends ConsumerState<PropertyTypeListBottomsheet> {
  List<PropertyTypeModel> _selectedTypes = [];

  @override
  void initState() {
    super.initState();
    _selectedTypes =
        List.from(ref.read(filterNotifierProvider).selectedPropertyTypes ?? []);
  }

  void _togglePropertyType(PropertyTypeModel type) {
    setState(() {
      if (_selectedTypes.any((t) => t.id == type.id)) {
        _selectedTypes.removeWhere((t) => t.id == type.id);
      } else {
        _selectedTypes.add(type);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final typeState = ref.watch(propertyTypeNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleHead(
            title: 'Property Type',
            subtitle: _selectedTypes.isEmpty
                ? null
                : '${_selectedTypes.length} Selected',
            clearWidget: _selectedTypes.isEmpty
                ? null
                : TextIconButtonWidget(
                    onPressed: () {
                      setState(() {
                        _selectedTypes.clear();
                      });
                      ref.read(filterNotifierProvider.notifier).updateState(
                        selectedPropertyTypes: [],
                      );
                      Navigator.pop(context);
                    },
                  ),
          ),
          Spacing.sizedBoxH_16(),
          typeState.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (failure) => Center(
                child: Text(failure.message ?? 'Error loading property types')),
            success: (success) {
              final typeList = (success as List)
                  .map((e) => PropertyTypeModel.fromJson(e))
                  .toList();
              return typeList.isNotEmpty
                  ? Wrap(
                      spacing: 10,
                      children: typeList.map((type) {
                        final isSelected =
                            _selectedTypes.any((t) => t.id == type.id);
                        return FilterChip(
                          label: Text(type.name ?? ''),
                          selected: isSelected,
                          onSelected: (_) => _togglePropertyType(type),
                          backgroundColor: Colors.white,
                          selectedColor: AppColors.primary.withOpacity(0.2),
                          checkmarkColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color:
                                isSelected ? AppColors.primary : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                          ),
                        );
                      }).toList(),
                    )
                  : const Center(child: Text('No property types available'));
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
                    ref.read(filterNotifierProvider.notifier).updateState(
                          selectedPropertyTypes: _selectedTypes,
                        );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
