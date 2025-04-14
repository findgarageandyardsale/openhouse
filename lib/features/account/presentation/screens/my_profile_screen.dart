import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/presentation/widgets/circular_user_image_widget.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:open_house/shared/constants/spacing.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/action_button.dart';

@RoutePage()
class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SafeArea(child: SingleChildScrollView(child: ProfileAccount())),
    );
  }
}

class ProfileAccount extends ConsumerWidget {
  const ProfileAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserProvider);
    final user = userModel.value;

    String? getAddress(LocationModel? model) {
      if (model == null) {
        return null;
      } else {
        final appartNumber =
            model.apartmentNumber != null ? '${model.apartmentNumber}, ' : '';

        final suiteApp =
            model.subLocality != null ? '${model.subLocality}, ' : '';
        final streetName =
            model.throughfare != null ? '${model.throughfare}, ' : '';
        final streetNumber =
            model.subThoroughfare != null ? '${model.subThoroughfare}, ' : '';
        final cityName = model.locality != null ? '${model.locality}, ' : '';
        final state = model.adminArea != null ? '${model.adminArea}, ' : '';
        final zipcode = model.zipCode != null ? '${model.zipCode}' : '';
        return '$appartNumber$suiteApp$streetNumber$streetName$cityName$state$zipcode';
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacing.sizedBoxH_20(),
              CircularUserImageWidget(
                firstName: user?.firstName,
                lastName: user?.lastName,
                file: user?.profile?.file,
              ),
              Spacing.sizedBoxH_16(),
              Text(
                '${user?.firstName} ${user?.lastName}',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              Spacing.sizedBoxH_30(),
              ActionButton(
                textColor: Colors.white,
                borderColor: Theme.of(context).primaryColor,
                label: 'Edit Profile',
                onPressed: () {
                  context.router.push(const EditProfileScreen());
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Personal Information',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 10),

        ProfileInfoListTileWidget(
          icon: Icons.mail_outline,
          title: 'Email',
          subTitle: '${user?.email}',
        ),
        ProfileInfoListTileWidget(
          icon: Icons.call_outlined,
          title: 'Phone',
          subTitle: '${user?.phoneNumber}',
        ),
        if (user?.address != null)
          ProfileInfoListTileWidget(
            icon: Icons.location_on_outlined,
            title: 'Address',
            subTitle: getAddress(user?.address) ?? '',
          ),
        const Divider(color: AppColors.lightGrey, thickness: 1),

        if (user?.isOwner == false) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Realtor Detail',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          ProfileInfoListTileWidget(
            icon: Icons.apartment_outlined,
            title: 'Realty Name',
            subTitle: user?.realtyName ?? '-',
          ),
          ProfileInfoListTileWidget(
            icon: Icons.contact_mail_outlined,
            title: 'License Number',
            subTitle: user?.licenseNumber ?? '-',
          ),
          if (user?.address != null)
            ProfileInfoListTileWidget(
              icon: Icons.location_on_outlined,
              title: 'Address',
              subTitle: getAddress(user?.address) ?? '-',
            ),
          const SizedBox(height: 10),
          const Divider(color: AppColors.lightGrey, thickness: 1),
        ],
      ],
    );
  }
}

class ProfileInfoListTileWidget extends StatelessWidget {
  const ProfileInfoListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.lightPrimaryColor,
        child: Icon(icon, size: 20, color: AppColors.primary),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.tileColor,
        ),
      ),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
      onTap: () {},
    );
  }
}
