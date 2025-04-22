import 'package:flutter/material.dart';
import 'package:open_house/configs/flavors.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      FlavorValue.appIcon ?? 'assets/launcher.png',
      height: size ?? 150,
      width: size ?? 150,
    );
  }
}
