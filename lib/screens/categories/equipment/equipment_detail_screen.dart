import 'package:flutter/material.dart';
import 'equipment_topic_screen.dart';
import 'backpacks/backpacks_data.dart';
import 'tents/tents_data.dart';
import 'clothing/clothing_data.dart';
import 'cooking_gear/cooking_gear_data.dart';
import 'tools/tools_data.dart';

/// Routes each equipment item to its dedicated sub-category topic screen.
class EquipmentDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const EquipmentDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final title = item['title'] as String;

    switch (title) {
      case 'Backpacks':
        return const EquipmentTopicScreen(
          topicTitle: 'Backpacks',
          tagline: 'Carry Smart. Hike Far.',
          taglineSubtitle: 'Choose your pack type and build the perfect kit.',
          themeColor: Color(0xFF1A7A6E),
          themeIcon: Icons.backpack_outlined,
          categories: BackpacksData.categories,
          guides: BackpacksData.guides,
        );

      case 'Tents & Shelters':
        return const EquipmentTopicScreen(
          topicTitle: 'Tents & Shelters',
          tagline: 'Shelter from the Storm.',
          taglineSubtitle: 'Find the right shelter for every season and terrain.',
          themeColor: Color(0xFF2D6A4F),
          themeIcon: Icons.night_shelter_outlined,
          categories: TentsData.categories,
          guides: TentsData.guides,
        );

      case 'Clothing':
        return const EquipmentTopicScreen(
          topicTitle: 'Clothing',
          tagline: 'Layer Up. Stay Comfortable.',
          taglineSubtitle:
              'Build a clothing system for every weather condition.',
          themeColor: Color(0xFF1565C0),
          themeIcon: Icons.dry_cleaning_outlined,
          categories: ClothingData.categories,
          guides: ClothingData.guides,
        );

      case 'Cooking Gear':
        return const EquipmentTopicScreen(
          topicTitle: 'Cooking Gear',
          tagline: 'Fuel Your Adventure.',
          taglineSubtitle:
              'Choose the right stove, cookware, and food system.',
          themeColor: Color(0xFFE64A19),
          themeIcon: Icons.soup_kitchen_outlined,
          categories: CookingGearData.categories,
          guides: CookingGearData.guides,
        );

      case 'Tools & Accessories':
        return const EquipmentTopicScreen(
          topicTitle: 'Tools & Accessories',
          tagline: 'Ready for Anything.',
          taglineSubtitle: 'The tools that keep you safe and self-sufficient.',
          themeColor: Color(0xFF5D4037),
          themeIcon: Icons.handyman_outlined,
          categories: ToolsData.categories,
          guides: ToolsData.guides,
        );

      default:
        return _EquipmentPlaceholder(item: item);
    }
  }
}

class _EquipmentPlaceholder extends StatelessWidget {
  final Map<String, dynamic> item;
  const _EquipmentPlaceholder({required this.item});

  @override
  Widget build(BuildContext context) {
    final color = item['color'] as Color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          item['title'] as String,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item['icon'] as IconData, color: color, size: 64),
            const SizedBox(height: 16),
            Text(
              item['title'] as String,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text('Coming soon'),
          ],
        ),
      ),
    );
  }
}
