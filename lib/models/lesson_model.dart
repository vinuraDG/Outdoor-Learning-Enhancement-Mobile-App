import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}

class LessonModel {
  final String id;
  final String title;
  final String categoryId;
  final String categoryName;
  final Color categoryColor;
  final String duration;
  final double progress;
  final String description;
  final List<LessonSection> sections;
  final String? thumbnailAsset;

  const LessonModel({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.categoryName,
    required this.categoryColor,
    required this.duration,
    required this.progress,
    required this.description,
    required this.sections,
    this.thumbnailAsset,
  });
}

class LessonSection {
  final String title;
  final String duration;

  const LessonSection({required this.title, required this.duration});
}

class AchievementModel {
  final String id;
  final String title;
  final String status; // 'completed' | 'in_progress'
  final IconData icon;
  final Color color;

  const AchievementModel({
    required this.id,
    required this.title,
    required this.status,
    required this.icon,
    required this.color,
  });
}

class CommunityItem {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const CommunityItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}