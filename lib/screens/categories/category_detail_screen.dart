import 'package:flutter/material.dart';
import 'package:orc_app/screens/navigation/navigation_screen.dart';
import '../../models/lesson_model.dart';

// Category screens
import 'safety/safety_screen.dart';
import 'equipment/equipment_screen.dart';
import 'weather/weather_screen.dart';
import 'learn/learn_screen.dart';
import 'community/community_screen.dart';

/// Routes a [CategoryModel] to its dedicated screen.
/// All actual UI lives in the per-category files.
class CategoryDetailScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    switch (category.id) {
      case 'safety':
        return const SafetyScreen();
      case 'equipment':
        return const EquipmentScreen();
      case 'navigation':
        return const NavigationScreen();
      case 'weather':
        return const WeatherScreen();
      case 'learn':
        return const LearnScreen();
      case 'community':
        return const CommunityScreen();
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(category.name),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: const Center(child: Text('Coming soon')),
        );
    }
  }
}