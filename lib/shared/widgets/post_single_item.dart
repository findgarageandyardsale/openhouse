import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:open_house/core/ext/currency_extension.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/theme/test_styles.dart';
import 'package:open_house/shared/utils/app_utils.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/widgets/file_image_builder.dart';

class PostSingleItem extends StatelessWidget {
  const PostSingleItem({
    super.key,
    this.isActive,
    required this.singlePost,
    this.onTap,
    this.fromMap,
  });

  final bool? isActive;
  final OpenHouse? singlePost;
  final Function()? onTap;
  final bool? fromMap;

  static const double _imageSize = 120;

  @override
  Widget build(BuildContext context) {
    final attachments = singlePost?.openHouseProperty?.attachments ?? const [];
    final firstImageUrl = attachments.isNotEmpty ? (attachments.first.file ?? '') : '';
    final propertyType = singlePost?.openHouseProperty?.propertyType?.name;
    final isSale = propertyType?.toLowerCase() == 'sale';
    final priceText = singlePost?.openHouseProperty?.price?.englishFormatCurrency() ?? '';
    final priceLabel = isSale ? priceText : '$priceText/mo';

    final propertyName = singlePost?.openHouseProperty?.name ?? '';
    final locationText = AppUtils.formatLocationAsAddress(
      singlePost?.location ?? const LocationModel(),
    );

    final beds = singlePost?.propertySize?.bedrooms?.toString() ?? '0';
    final baths = singlePost?.propertySize?.bathrooms?.toString() ?? '0';
    final coveredArea = singlePost?.propertySize?.coveredArea;
    final sqftText = coveredArea != null && coveredArea > 0
        ? '${coveredArea.toStringAsFixed(0)} sqft'
        : null;
    final metaParts = <String>[
      '$beds bd',
      '$baths ba',
      if (sqftText != null) sqftText,
    ];
    final metaLine = metaParts.join(' · ');

    final slots = singlePost?.propertySize?.availableTimeSlots ?? const [];
    String? slotLine;
    int extraDays = 0;
    if (slots.isNotEmpty) {
      final first = slots.first;
      final date = CustomDateUtils.formatDate(first.date ?? DateTime.now());
      final start = CustomDateUtils.convertTo12HourFormat(first.startTime);
      final end = CustomDateUtils.convertTo12HourFormat(first.endTime);
      slotLine = '$date · $start – $end';
      extraDays = slots.length - 1;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ??
          () {
            if (singlePost == null) return;
            context.router.push(
              PostDetailScreen(garageayard: singlePost!, isActive: isActive),
            );
          },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.extraLightGrey),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImage(firstImageUrl, attachments.length),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Price + optional status pill
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              priceLabel,
                              style: AppTextStyles.titleMedium.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _StatusPill(isActive: isActive),
                        ],
                      ),
                      if (propertyName.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          propertyName,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      if (locationText.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          locationText,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.lightGrey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      const SizedBox(height: 6),
                      Text(
                        metaLine,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (slotLine != null) ...[
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 13,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                slotLine,
                                style: AppTextStyles.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (extraDays > 0) ...[
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '+$extraDays',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String url, int totalImages) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      ),
      child: SizedBox(
        width: _imageSize,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (url.isNotEmpty)
              FileImageBuilder(
                url: url,
                clickUrl: url,
                width: _imageSize,
                height: _imageSize,
                fit: BoxFit.cover,
                radius: 0,
              )
            else
              Container(
                color: AppColors.extraLightGrey,
                child: const Icon(
                  Icons.image_outlined,
                  color: AppColors.lightGrey,
                  size: 32,
                ),
              ),
            if (totalImages > 1)
              Positioned(
                right: 6,
                bottom: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.photo_library_outlined,
                        color: Colors.white,
                        size: 11,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '$totalImages',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.isActive});

  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    if (isActive == null) return const SizedBox.shrink();

    final active = isActive!;
    final bg = active
        ? const Color(0xffE7F7EC)
        : const Color(0xffFDECEC);
    final fg = active
        ? const Color(0xff1E8E3E)
        : const Color(0xffC5221F);
    final label = active ? 'Active' : 'Expired';

    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: fg,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }
}
