import 'package:flutter/material.dart';

/// Shared data models used by all safety topic sub-screens
/// (Emergency Signals, Risk Management, Wildlife Safety, Fire Safety).
/// Basic First Aid keeps its own models in first_aid/first_aid_data.dart.

class SafetyCategory {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const SafetyCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}

class SafetyLesson {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final String duration;
  final String youtubeVideoId;
  final String introduction;
  final List<String> keyPoints;

  const SafetyLesson({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.duration,
    required this.youtubeVideoId,
    required this.introduction,
    required this.keyPoints,
  });
}
