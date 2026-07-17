import 'package:flutter/material.dart';

/// Shared data models for all equipment sub-category screens.

class EquipmentSubCategory {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const EquipmentSubCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}

class EquipmentGuide {
  final String id;
  final String subCategoryId;
  final String title;
  final String description;
  final List<String> essentialItems;
  final List<String> niceToHaveItems;
  final List<String> buyingTips;
  final List<String> careTips;

  const EquipmentGuide({
    required this.id,
    required this.subCategoryId,
    required this.title,
    required this.description,
    required this.essentialItems,
    required this.niceToHaveItems,
    required this.buyingTips,
    required this.careTips,
  });
}
