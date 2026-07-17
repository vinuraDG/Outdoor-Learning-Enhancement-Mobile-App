import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'first_aid/first_aid_categories_screen.dart';
import 'safety_topic_screen.dart';
import 'emergency_signals/emergency_signals_data.dart';
import 'risk_management/risk_management_data.dart';
import 'wildlife_safety/wildlife_safety_data.dart';
import 'fire_safety/fire_safety_data.dart';

/// Routes each safety item to its dedicated sub-screen.
class SafetyDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const SafetyDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final title = item['title'] as String;

    switch (title) {
      case 'Basic First Aid':
        return const FirstAidCategoriesScreen();

      case 'Emergency Signals':
        return const SafetyTopicScreen(
          topicTitle: 'Emergency Signals',
          tagline: 'Be Seen. Be Heard. Be Found.',
          taglineSubtitle: 'Choose a signaling method to learn the technique.',
          themeColor: Color(0xFFF57F17),
          themeIcon: Icons.sos_outlined,
          categories: EmergencySignalsData.categories,
          lessons: EmergencySignalsData.lessons,
        );

      case 'Risk Management':
        return const SafetyTopicScreen(
          topicTitle: 'Risk Management',
          tagline: 'Plan Smart. Stay Safe.',
          taglineSubtitle: 'Learn to identify and manage outdoor risks.',
          themeColor: Color(0xFFFBC02D),
          themeIcon: Icons.warning_amber_outlined,
          categories: RiskManagementData.categories,
          lessons: RiskManagementData.lessons,
        );

      case 'Wildlife Safety':
        return const SafetyTopicScreen(
          topicTitle: 'Wildlife Safety',
          tagline: 'Respect the Wild.',
          taglineSubtitle: 'Know how to react to any wildlife encounter.',
          themeColor: Color(0xFF2D6A4F),
          themeIcon: Icons.pets_outlined,
          categories: WildlifeSafetyData.categories,
          lessons: WildlifeSafetyData.lessons,
        );

      case 'Fire Safety':
        return const SafetyTopicScreen(
          topicTitle: 'Fire Safety',
          tagline: 'Fire is a Tool, Not a Toy.',
          taglineSubtitle: 'Master campfire safety and wildfire awareness.',
          themeColor: Color(0xFFE64A19),
          themeIcon: Icons.local_fire_department_outlined,
          categories: FireSafetyData.categories,
          lessons: FireSafetyData.lessons,
        );

      default:
        return _SafetyPlaceholderScreen(item: item);
    }
  }
}

// Fallback placeholder for any future topics not yet built
class _SafetyPlaceholderScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  const _SafetyPlaceholderScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    final color = item['color'] as Color;
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
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
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
