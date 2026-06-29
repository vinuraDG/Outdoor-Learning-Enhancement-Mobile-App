import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'first_aid/first_aid_categories_screen.dart';

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
      // Add more cases here as you build them:
      // case 'Emergency Signals': return const EmergencySignalsScreen();
      // case 'Risk Management':   return const RiskManagementScreen();
      // case 'Wildlife Safety':   return const WildlifeSafetyScreen();
      // case 'Fire Safety':       return const FireSafetyScreen();
      default:
        return _SafetyPlaceholderScreen(item: item);
    }
  }
}

// Placeholder for items not yet built
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
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.charcoal),
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