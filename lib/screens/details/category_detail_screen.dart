import 'package:flutter/material.dart';
import 'package:orc_app/screens/details/lesson_detail_screen.dart';
import '../../models/lesson_model.dart';
import '../../models/mock_data.dart';
import '../../theme/app_theme.dart';

class CategoryDetailScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailScreen({super.key, required this.category});

  List<Map<String, dynamic>> get _items {
    switch (category.id) {
      case 'safety':
        return MockData.safetyItems;
      case 'equipment':
        return MockData.equipmentItems;
      case 'navigation':
        return MockData.navigationItems;
      case 'weather':
        return MockData.weatherItems;
      case 'learn':
        return MockData.learnItems;
      default:
        return [];
    }
  }

  String get _heroSubtitle {
    switch (category.id) {
      case 'safety':
        return 'Stay Safe, Stay Prepared\nLearn essential safety skills and be ready for any situation.';
      case 'equipment':
        return 'Gear Up for Adventure\nExplore essential outdoor gear and learn how to use it.';
      case 'navigation':
        return 'Find Your Way\nMaster navigation skills and explore with confidence.';
      case 'weather':
        return 'Understand the Weather\nCheck conditions and learn how to adapt to nature.';
      case 'learn':
        return 'Grow Your Knowledge\nAccess guides, articles and tips to become a better adventurer.';
      case 'community':
        return 'Connect & Share\nJoin a community of outdoor learners and share experiences.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Community gets its own layout
    if (category.id == 'community') {
      return _CommunityDetailScreen(category: category);
    }

    // Weather gets a special layout
    if (category.id == 'weather') {
      return _WeatherDetailScreen(category: category, items: _items);
    }

    final lessons = MockData.lessons
        .where((l) => l.categoryId == category.id)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          // Hero app bar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: category.color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              category.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [category.color, category.color.withOpacity(0.7)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: _heroSubtitle
                          .split('\n')
                          .asMap()
                          .entries
                          .map(
                            (e) => Text(
                              e.value,
                              style: TextStyle(
                                color: Colors.white.withOpacity(e.key == 0 ? 1 : 0.85),
                                fontSize: e.key == 0 ? 18 : 13,
                                fontWeight: e.key == 0
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Items list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = _items[index];
                final matchingLesson = lessons.isNotEmpty
                    ? lessons[index % lessons.length]
                    : null;
                return GestureDetector(
                  onTap: matchingLesson != null
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LessonDetailScreen(
                                  lesson: matchingLesson),
                            ),
                          )
                      : null,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: (item['color'] as Color).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            item['icon'] as IconData,
                            color: item['color'] as Color,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] as String,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.charcoal,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                item['subtitle'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right,
                            color: Colors.grey.shade400, size: 20),
                      ],
                    ),
                  ),
                );
              },
              childCount: _items.length,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

// ── WEATHER DETAIL ──────────────────────────────────────────
class _WeatherDetailScreen extends StatelessWidget {
  final CategoryModel category;
  final List<Map<String, dynamic>> items;

  const _WeatherDetailScreen(
      {required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    final weather = MockData.currentWeather;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.charcoal),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Weather',
            style: TextStyle(
                color: AppTheme.charcoal, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Current weather card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(weather['location'] as String,
                      style: const TextStyle(
                          color: AppTheme.softGray, fontSize: 13)),
                  Row(
                    children: [
                      Text(
                        weather['temperature'] as String,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.charcoal,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.wb_cloudy_outlined,
                          size: 48, color: Color(0xFFF57F17)),
                    ],
                  ),
                  Text(weather['condition'] as String,
                      style: const TextStyle(
                          color: AppTheme.softGray, fontSize: 14)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _WeatherStat('Wind', weather['wind'] as String,
                          Icons.air),
                      _WeatherStat('Humidity', weather['humidity'] as String,
                          Icons.water_drop_outlined),
                      _WeatherStat('Rain', weather['rainChance'] as String,
                          Icons.umbrella_outlined),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Weather topics
            ...items.map(
              (item) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: (item['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(item['icon'] as IconData,
                          color: item['color'] as Color, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title'] as String,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppTheme.charcoal)),
                          Text(item['subtitle'] as String,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right,
                        color: Colors.grey.shade400, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _WeatherStat(this.label, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.softGray, size: 18),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: AppTheme.charcoal)),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppTheme.softGray)),
      ],
    );
  }
}

// ── COMMUNITY DETAIL ────────────────────────────────────────
class _CommunityDetailScreen extends StatelessWidget {
  final CategoryModel category;

  const _CommunityDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: category.color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Community',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [category.color, category.color.withOpacity(0.7)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Connect & Share',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      Text(
                          'Join a community of outdoor learners and share experiences.',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = MockData.communityItems[index];
                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: item.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(item.icon, color: item.color, size: 24),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppTheme.charcoal)),
                            Text(item.subtitle,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right,
                          color: Colors.grey.shade400, size: 20),
                    ],
                  ),
                );
              },
              childCount: MockData.communityItems.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: category.color,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}