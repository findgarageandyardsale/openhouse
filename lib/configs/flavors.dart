import 'package:flutter/material.dart';

enum Flavor {
  openhouse,
  streetfood,
}

class FlavorValues {
  final String title;
  final String baseUrl;
  final Color primaryColor;
  final String? appIcon;

  FlavorValues({
    required this.title,
    required this.baseUrl,
    required this.primaryColor,
    this.appIcon,
  });
}

class FlavorValue {
  static Flavor? _appFlavor;
  static final Map<Flavor, FlavorValues> _configs = {
    Flavor.openhouse: FlavorValues(
        title: 'Open House',
        baseUrl: 'http://54.209.76.200:8000',
        primaryColor: const Color(0xffED2939),
        appIcon: 'assets/launcher.png'),
    Flavor.streetfood: FlavorValues(
      title: 'Street Food',
      baseUrl: 'http://35.171.98.209:8000',
      primaryColor: const Color(0xFF9102E),
      appIcon: 'assets/streetfood.png',
    ),
  };

  // Set flavor dynamically using Flavor enum
  static set appFlavor(Flavor flavor) {
    _appFlavor = flavor;
  }

  // Static accessors for flavor properties
  static Flavor get flavor {
    if (_appFlavor == null) {
      throw Exception(
          'FlavorValue.appFlavor must be set before accessing properties');
    }
    return _appFlavor!;
  }

  static String get title {
    return _getValues().title;
  }

  static String get baseUrl {
    return _getValues().baseUrl;
  }

  static String? get appIcon {
    return _getValues().appIcon;
  }

  static Color get primaryColor {
    return _getValues().primaryColor;
  }

  // Helper to get FlavorValues
  static FlavorValues _getValues() {
    if (_appFlavor == null) {
      throw Exception(
          'FlavorValue.appFlavor must be set before accessing properties');
    }
    return _configs[_appFlavor!]!;
  }
}
