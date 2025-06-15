import 'package:flutter/material.dart';

class NameOnTap {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;
  final bool? hasSwitch;
  final bool? hasLanguage;

  NameOnTap({
    required this.title,
    required this.onTap,
    this.iconData,
    this.hasSwitch,
    this.hasLanguage,
  });
}
