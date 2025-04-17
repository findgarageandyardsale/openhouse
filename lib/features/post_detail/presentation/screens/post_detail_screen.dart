import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/presentation/screens/my_profile_screen.dart';
import 'package:open_house/features/sales/presentation/provider/sale_state_provider.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/shared/extension/context.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/theme/test_styles.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/widgets/amenities_line.dart';
import 'package:open_house/shared/widgets/custom_toast.dart';
import 'package:open_house/shared/widgets/timer_text.dart';
import '../../../../services/user_cache_service/domain/providers/current_user_provider.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../shared/domain/models/open_house/open_house.dart';
import '../../../../shared/domain/models/user/user_model.dart';
import '../../../../shared/utils/app_utils.dart';
import '../../../../shared/widgets/decription_chip.dart';
import '../../../../shared/widgets/location_text.dart';
import '../widgets/custom_carousel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class PostDetailScreen extends ConsumerStatefulWidget {
  const PostDetailScreen({super.key, required this.garageayard, this.isActive});
  final OpenHouse garageayard;
  final bool? isActive;

  @override
  ConsumerState<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {
  late GoogleMapController mapController;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  Widget locationWidget() {
    return LocationText(
      fromDetail: false,
      location: AppUtils.formatLocationAsAddress(
        widget.garageayard.location ?? const LocationModel(),
      ),
    );
  }

  void _loadCustomMarker() async {
    // Load the custom marker from assets
    BitmapDescriptor customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(16, 26)),
      'assets/garage.png',
    );

    // Add a marker using the custom icon
    _markers.add(
      Marker(
        markerId: const MarkerId('customMarker'),
        position: LatLng(
          widget.garageayard.location?.latitude ?? 27.6782,
          widget.garageayard.location?.longitude ?? 85.3808,
        ),
        icon: customIcon,
        // consumeTapEvents: true,
      ),
    );

    setState(() {}); // Update the UI to display the marker
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final currentUserAsyncValue = ref.watch(currentUserProvider);

    return context.doublePos(
      appbar:
          AppBar(title: Text(widget.garageayard.openHouseProperty?.name ?? '')),
      isActive: widget.isActive,
      statusText: widget.isActive == null
          ? 'Get Directions'
          : widget.isActive == true
              ? 'Edit Sale'
              : 'Extend Expiry',
      actions: currentUserAsyncValue.when(
        data: (User? data) {
          if (data == null) {
            return [const SizedBox.shrink()];
          } else {
            return [];
          }
        },
        error: (Object error, StackTrace stackTrace) {
          return [const SizedBox.shrink()];
        },
        loading: () {
          return [const SizedBox.shrink()];
        },
      ),
      onPosPressed: () async {
        if (widget.isActive == null) {
          if (widget.garageayard.location?.latitude == null ||
              widget.garageayard.location?.longitude == null) {
            CustomToast.showToast(
              'Location not available',
              status: ToastStatus.error,
            );
            return;
          }
          AppUtils.openAppDirections(
            widget.garageayard.location?.latitude ?? 0.0,
            widget.garageayard.location?.longitude ?? 0.0,
          );
        } else if (widget.isActive == true || widget.isActive == false) {
          context.router
              .push(AddEditPostSaleScreen(garageayard: widget.garageayard))
              .then((val) {
            if (val == true) {
              ref.read(saleNotifierProvider.notifier)
                ..resetState()
                ..fetchExplorePosts();
              Navigator.pop(context);
            }
          });
        }
      },
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCarousel(
              attachments:
                  widget.garageayard.openHouseProperty?.attachments ?? [],
            ),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${widget.garageayard.openHouseProperty?.price}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${widget.garageayard.openHouseProperty?.name}',
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      locationWidget(),
                      Row(
                        children: [
                          Icon(Icons.home_outlined, size: 18),
                          Spacing.sizedBoxW_04(),
                          Expanded(
                            child: Text(
                              '${widget.garageayard.openHouseProperty?.propertyType?.name}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      AmenitiesLine(
                        bedroom: widget.garageayard.propertySize?.bedrooms
                                ?.toString() ??
                            '0',
                        bathroom: widget.garageayard.propertySize?.bathrooms
                                ?.toString() ??
                            '0',
                        size:
                            '${widget.garageayard.propertySize?.coveredArea?.toStringAsFixed(0) ?? '0'} sq.ft',
                        lotSize:
                            '${widget.garageayard.propertySize?.lotSize?.toStringAsFixed(0) ?? '0'} sf min.',
                      ),
                      DescriptionChip(
                          text: widget.garageayard.openHouseProperty?.category
                                  ?.name ??
                              ''),
                      SizedBox(
                        height: 8,
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      ...widget.garageayard.propertySize?.availableTimeSlots
                              ?.map((e) => TimerText(
                                    fromDetail: false,
                                    date: CustomDateUtils.formatDate(
                                        e.date ?? DateTime.now()),
                                    time:
                                        '${CustomDateUtils.convertTo12HourFormat(e.startTime)} - ${CustomDateUtils.convertTo12HourFormat(e.endTime)}',
                                    days: '0',
                                  ))
                              .toList() ??
                          [],
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                  child: Divider(color: Colors.grey.shade300, thickness: 4),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      Spacing.sizedBoxH_08(),
                      Text(
                        widget.garageayard.openHouseProperty?.description ?? '',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 8,
                  child: Divider(color: Colors.grey.shade300, thickness: 4),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16),
                //   child: Column(
                //     spacing: 8,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Features and Amenities',
                //         style: AppTextStyles.bodyMedium.copyWith(
                //           fontWeight: FontWeight.w500,
                //           color: AppColors.textPrimaryColor,
                //         ),
                //       ),

                //       RowTitleValuwWidget(
                //         title: 'Furnished',
                //         value: 'Fully Furnished',
                //       ),
                //       RowTitleValuwWidget(
                //         title: 'Amenities',
                //         childWidget: Wrap(
                //           spacing: 4,
                //           runSpacing: 4,
                //           children:
                //               widget.garageayard.amenities
                //                   ?.map((e) => DescriptionChip(text: e))
                //                   .toList() ??
                //               [],
                //         ),
                //       ),
                //       RowTitleValuwWidget(title: 'Pet Friendly', value: 'Yes'),

                //       RowTitleValuwWidget(title: 'Utility', value: 'Included'),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 8,
                  child: Divider(color: Colors.grey.shade300, thickness: 4),
                ),
                SizedBox(
                  height: 320,
                  child: GoogleMap(
                    mapType: MapType.terrain,
                    onMapCreated: _onMapCreated,
                    myLocationButtonEnabled: false,
                    markers: _markers,
                    mapToolbarEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        widget.garageayard.location?.latitude ?? 27.6782,
                        widget.garageayard.location?.longitude ?? 85.3808,
                      ),
                      zoom: 15,
                    ),
                  ),
                ),

                SizedBox(
                  height: 8,
                  child: Divider(color: Colors.grey.shade300, thickness: 4),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileInfoListTileWidget(
                      icon: Icons.person_outline,
                      title:
                          'Posted by ${widget.garageayard.createdBy?.firstName} ${widget.garageayard.createdBy?.lastName}',
                      subTitle: CustomDateUtils.formatDate(
                          widget.garageayard.createdAt ?? DateTime.now()),
                    ),
                    ProfileInfoListTileWidget(
                      icon: Icons.mail_outline,
                      title: 'Email',
                      subTitle: widget.garageayard.createdBy?.email ?? '',
                    ),
                    ProfileInfoListTileWidget(
                      icon: Icons.call_outlined,
                      title: 'Phone',
                      subTitle: widget.garageayard.createdBy?.phoneNumber ?? '',
                    ),
                    ProfileInfoListTileWidget(
                      icon: Icons.location_on_outlined,
                      title: 'Address',
                      subTitle:
                          widget.garageayard.createdBy?.officeAddress ?? '',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowTitleValuwWidget extends StatelessWidget {
  const RowTitleValuwWidget({
    super.key,
    required this.title,
    this.value,
    this.childWidget,
  });
  final String? title, value;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Expanded(child: Text(title ?? '', style: AppTextStyles.titleSmall)),
        Expanded(
          flex: 2,
          child:
              childWidget ?? Text(value ?? '', style: AppTextStyles.bodyMedium),
        ),
      ],
    );
  }
}
