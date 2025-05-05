import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:open_house/core/ext/currency_extension.dart';
import 'package:open_house/features/post_detail/presentation/widgets/custom_carousel.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/theme/test_styles.dart';
import 'package:open_house/shared/utils/app_utils.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/widgets/action_button.dart';
import 'package:open_house/shared/widgets/amenities_line.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';
import 'package:open_house/shared/widgets/location_text.dart';
import '../constants/spacing.dart';
import '../theme/app_colors.dart';
import 'timer_text.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget locationWidget() {
      return LocationText(
        fromDetail: false,
        location: AppUtils.formatLocationAsAddress(
          singlePost?.location ?? const LocationModel(),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        context.router.push(
          PostDetailScreen(garageayard: singlePost!, isActive: isActive),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCarousel(
            attachments: singlePost?.openHouseProperty?.attachments ?? [],
            radius: 12,
          ),
          Spacing.sizedBoxW_16(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${singlePost?.openHouseProperty?.price?.englishFormatCurrency()}',
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  singlePost?.openHouseProperty?.name ?? '',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                locationWidget(),
                AmenitiesLine(
                  bedroom:
                      singlePost?.propertySize?.bedrooms?.toString() ?? '0',
                  bathroom:
                      singlePost?.propertySize?.bathrooms?.toString() ?? '0',
                  size:
                      '${singlePost?.propertySize?.coveredArea?.toStringAsFixed(0) ?? '0'} sq.ft',
                  lotSize:
                      '${singlePost?.propertySize?.lotSize?.toStringAsFixed(0) ?? '0'} sq.ft',
                ),
                Divider(color: AppColors.extraLightGrey),
                TimerText(
                  fromDetail: false,
                  date: CustomDateUtils.formatDate(
                    singlePost?.propertySize?.availableTimeSlots?[0].date ??
                        DateTime.now(),
                  ),
                  time:
                      '${CustomDateUtils.convertTo12HourFormat(singlePost?.propertySize?.availableTimeSlots?[0].startTime)} - ${CustomDateUtils.convertTo12HourFormat(singlePost?.propertySize?.availableTimeSlots?[0].endTime)}',
                  days: ((singlePost?.propertySize?.availableTimeSlots ?? [])
                              .length -
                          1)
                      .toString(),
                ),
                Spacing.sizedBoxH_08(),
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        height: 36,
                        buttonColor: Colors.white,
                        borderColor: AppColors.primary,
                        onPressed: () {
                          context.router.push(
                            PostDetailScreen(
                                garageayard: singlePost!, isActive: isActive),
                          );
                        },
                        label: 'View Detail',
                        textStyle: Theme.of(
                          context,
                        ).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                      ),
                    ),
                    Spacing.sizedBoxW_10(),
                    Expanded(
                      child: ActionButton(
                        onPressed: () {
                          if (isActive != null) {
                            context.router.push(
                              AddEditPostSaleScreen(
                                garageayard: singlePost!,
                              ),
                            );
                          } else {
                            if (singlePost?.location?.latitude == null ||
                                singlePost?.location?.longitude == null) {
                              CustomToast.showToast('Location not available',
                                  status: ToastStatus.error);
                              return;
                            }
                            AppUtils.openAppDirections(
                                singlePost?.location?.latitude ?? 0.0,
                                singlePost?.location?.longitude ?? 0.0);
                          }
                        },
                        label: isActive == null
                            ? 'Get Directions'
                            : isActive == true
                                ? 'Edit Sale'
                                : 'Extend Expiry',
                        height: 36,
                        textStyle: Theme.of(
                          context,
                        ).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColors.extraLightGrey, height: 20, thickness: 20),
        ],
      ),
    );
  }
}
