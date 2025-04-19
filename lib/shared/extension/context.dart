import 'package:flutter/material.dart';
import 'package:open_house/shared/theme/app_colors.dart';
import 'package:open_house/shared/widgets/action_button.dart';

extension GarageScaffold on BuildContext {
  doublePos(
      {required Widget content,
      List<Widget>? actions,
      VoidCallback? onPosPressed,
      VoidCallback? onNegPressed,
      bool? isActive,
      String? statusText,
      AppBar? appbar,
      Color? backgroundColor,
      bool? showBottomBar}) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: backgroundColor ?? Colors.white,
      body: content,
      bottomNavigationBar: (actions ?? []).length == 1 || showBottomBar == false
          ? null
          : isActive == null
              ? Container(
                  margin: const EdgeInsets.all(16),
                  child: ActionButton(
                    label: statusText ?? 'Get Directions ',
                    onPressed: onPosPressed,
                    borderColor: AppColors.primary,
                    buttonColor: AppColors.primary,
                    textColor: AppColors.white,
                  ),
                )
              : isActive
                  ? Container(
                      margin: const EdgeInsets.all(16),
                      child: ActionButton(
                        label: 'Edit Sale ',
                        onPressed: onPosPressed,
                        borderColor: AppColors.primary,
                        buttonColor: AppColors.primary,
                        textColor: AppColors.white,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.all(16),
                      child: ActionButton(
                        label: 'Extend Expiry',
                        onPressed: onPosPressed,
                        borderColor: AppColors.primary,
                        buttonColor: AppColors.primary,
                        textColor: AppColors.white,
                      ),
                    ),
    );
  }
}
