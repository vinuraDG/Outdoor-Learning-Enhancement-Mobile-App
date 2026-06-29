import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orc_app/screens/categories/category_detail_screen.dart';
import 'package:orc_app/screens/details/lesson_detail_screen.dart';
import '../../models/mock_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/category_card.dart';
import '../../widgets/lesson_card.dart';
import '../../widgets/section_header.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? user?.email?.split('@')[0] ?? 'Explorer';

    return CustomScrollView(
      slivers: [
        // ── HERO SECTION ──
        SliverToBoxAdapter(
          child: Stack(
            children: [
              SizedBox(
                height: 340,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/hero_bg.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppTheme.deepGreen,
                    child: const Center(
                      child: Icon(Icons.landscape, color: Colors.white54, size: 64),
                    ),
                  ),
                ),
              ),
              Container(
                height: 340,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x88000000),
                      Color(0x55000000),
                      Color(0x33000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
              // Top bar
              Positioned(
                top: 0, left: 0, right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.explore, color: Colors.white, size: 26),
                        const SizedBox(width: 8),
                        const Text(
                          'ORC SUSL',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.notifications_outlined,
                                  color: Colors.white, size: 22),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: AppTheme.forestGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text('3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Greeting + Search
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$_greeting,',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9), fontSize: 16),
                      ),
                      Text(
                        '$name!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Ready for today's outdoor learning adventure?",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.85), fontSize: 13),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 14),
                                  Icon(Icons.search,
                                      color: Colors.grey.shade400, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Search lessons, gear, or tips...',
                                    style: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(Icons.tune,
                                color: Colors.grey.shade600, size: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── CATEGORIES GRID ──
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.78,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => CategoryCard(
                item: MockData.categories[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailScreen(
                      category: MockData.categories[index],
                    ),
                  ),
                ),
              ),
              childCount: MockData.categories.length,
            ),
          ),
        ),

        // ── CONTINUE LEARNING ──
        SliverToBoxAdapter(
          child: SectionHeader(title: 'Continue Learning', onViewAll: () {}),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 140,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: MockData.lessons.length,
              itemBuilder: (context, index) => LessonCard(
                lesson: MockData.lessons[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        LessonDetailScreen(lesson: MockData.lessons[index]),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),
      ],
    );
  }
}
