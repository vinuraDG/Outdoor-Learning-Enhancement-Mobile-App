import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class NavigationDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const NavigationDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final color = item['color'] as Color;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
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
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color, color.withOpacity(0.7)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(item['icon'] as IconData,
                              color: Colors.white, size: 28),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['subtitle'] as String,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ContentCard(
                    title: 'Overview',
                    child: Text(
                      item['description'] as String? ??
                          'Master ${item['title']} to navigate safely and confidently '
                          'through any terrain, from dense forests to open wilderness.',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ContentCard(
                    title: 'Core Skills',
                    child: Column(
                      children: [
                        _KeyPoint(color: color, text: 'Reading topographic maps accurately'),
                        _KeyPoint(color: color, text: 'Using a compass for bearings'),
                        _KeyPoint(color: color, text: 'Identifying landmarks and terrain features'),
                        _KeyPoint(color: color, text: 'Planning and following a route'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ContentCard(
                    title: 'Practice Tips',
                    child: Column(
                      children: [
                        'Start with familiar trails before venturing into unknown terrain.',
                        'Practice map-and-compass navigation without GPS first.',
                        'Always carry a backup navigation tool.',
                      ]
                          .map(
                            (tip) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.explore_outlined,
                                      color: color, size: 16),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(tip,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade700,
                                            height: 1.5)),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Start Learning',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _ContentCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _KeyPoint extends StatelessWidget {
  final Color color;
  final String text;

  const _KeyPoint({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: TextStyle(
                    fontSize: 13, color: Colors.grey.shade700, height: 1.5)),
          ),
        ],
      ),
    );
  }
}