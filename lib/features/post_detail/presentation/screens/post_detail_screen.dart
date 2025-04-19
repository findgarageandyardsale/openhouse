import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/presentation/screens/my_profile_screen.dart';
import 'package:open_house/features/explore/presentation/providers/explore_state_provider.dart';
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
    Future.microtask(() {
      ref
          .read(detailPageProvider.notifier)
          .fetchPostDetails((widget.garageayard.id));
    });
    // _loadCustomMarker();
  }

  Widget locationWidget(OpenHouse garageayard) {
    return LocationText(
      fromDetail: false,
      location: AppUtils.formatLocationAsAddress(
        garageayard.location ?? const LocationModel(),
      ),
    );
  }

  void _loadCustomMarker(OpenHouse garageayard) async {
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
          garageayard.location?.latitude ?? 27.6782,
          garageayard.location?.longitude ?? 85.3808,
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
    final detailState = ref.watch(detailPageProvider);
    Widget buildcontextWidget(OpenHouse garageayard) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCarousel(
              attachments: garageayard.openHouseProperty?.attachments ?? [],
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
                        '\$${garageayard.openHouseProperty?.price}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${garageayard.openHouseProperty?.name}',
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      locationWidget(garageayard),
                      Row(
                        children: [
                          Icon(Icons.home_outlined, size: 18),
                          Spacing.sizedBoxW_04(),
                          Expanded(
                            child: Text(
                              '${garageayard.openHouseProperty?.propertyType?.name}',
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
                        bedroom:
                            garageayard.propertySize?.bedrooms?.toString() ??
                                '0',
                        bathroom:
                            garageayard.propertySize?.bathrooms?.toString() ??
                                '0',
                        size:
                            '${garageayard.propertySize?.coveredArea?.toStringAsFixed(0) ?? '0'} sq.ft',
                        lotSize:
                            '${garageayard.propertySize?.lotSize?.toStringAsFixed(0) ?? '0'} sf min.',
                      ),
                      DescriptionChip(
                          text: garageayard.openHouseProperty?.category?.name ??
                              ''),
                      SizedBox(
                        height: 8,
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      ...garageayard.propertySize?.availableTimeSlots
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
                        garageayard.openHouseProperty?.description ?? '',
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
                //             garageayard.amenities
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
                        garageayard.location?.latitude ?? 27.6782,
                        garageayard.location?.longitude ?? 85.3808,
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
                          'Posted by ${garageayard.createdBy?.firstName} ${garageayard.createdBy?.lastName}',
                      subTitle: CustomDateUtils.formatDate(
                          garageayard.createdAt ?? DateTime.now()),
                    ),
                    ProfileInfoListTileWidget(
                      icon: Icons.mail_outline,
                      title: 'Email',
                      subTitle: garageayard.createdBy?.email ?? '',
                    ),
                    ProfileInfoListTileWidget(
                      icon: Icons.call_outlined,
                      title: 'Phone',
                      subTitle: garageayard.createdBy?.phoneNumber ?? '',
                    ),
                    ProfileInfoListTileWidget(
                      icon: Icons.location_on_outlined,
                      title: 'Address',
                      subTitle: garageayard.createdBy?.officeAddress ?? '',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    return context.doublePos(
        appbar: AppBar(
          title: detailState.maybeWhen(orElse: () {
            return const Text('Post Details');
          }, success: (data) {
            return Text(data.openHouseProperty?.name ?? '');
          }),
        ),
        isActive: widget.isActive,
        showBottomBar: detailState.maybeWhen(
            orElse: () => null,
            success: (data) {
              return true;
            },
            loading: () {
              return false;
            },
            failure: (e) => null),
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
          detailState.maybeWhen(
              orElse: () {},
              success: (garageayard) {
                if (widget.isActive == null) {
                  if (garageayard.location?.latitude == null ||
                      garageayard.location?.longitude == null) {
                    CustomToast.showToast(
                      'Location not available',
                      status: ToastStatus.error,
                    );
                    return;
                  }
                  AppUtils.openAppDirections(
                    garageayard.location?.latitude ?? 0.0,
                    garageayard.location?.longitude ?? 0.0,
                  );
                } else if (widget.isActive == true ||
                    widget.isActive == false) {
                  context.router
                      .push(AddEditPostSaleScreen(garageayard: garageayard))
                      .then((val) {
                    if (val == true) {
                      ref.read(saleNotifierProvider.notifier)
                        ..resetState()
                        ..fetchExplorePosts();
                      Navigator.pop(context);
                    }
                  });
                }
              });
        },
        content: detailState.when(
          initial: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          failure: (error) {
            return buildcontextWidget(widget.garageayard);
          },
          success: (val) {
            final OpenHouse garageayard =
                val is OpenHouse ? val : widget.garageayard;
            _loadCustomMarker(garageayard);

            return buildcontextWidget(garageayard);
          },
        ));
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
