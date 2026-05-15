import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<_CategoryItem> _categories = const [
    _CategoryItem('Safety', Icons.verified_user_outlined,
        AppTheme.forestGreen, Color(0xFFE8F5E9),
        'Learn safety skills, watch lessons and stay prepared.'),
    _CategoryItem('Equipment', Icons.backpack_outlined,
        Color(0xFF0097A7), Color(0xFFE0F7FA),
        'Explore and review outdoor gear for better decisions.'),
    _CategoryItem('Navigation', Icons.map_outlined,
        Color(0xFF2E7D32), Color(0xFFE8F5E9),
        'Master maps, compass and GPS skills for any adventure.'),
    _CategoryItem('Weather', Icons.wb_sunny_outlined,
        Color(0xFFF57F17), Color(0xFFFFFDE7),
        'Check weather updates and learn how to adapt.'),
    _CategoryItem('Learn', Icons.menu_book_outlined,
        Color(0xFF1565C0), Color(0xFFE3F2FD),
        'Access guides, articles and tips to improve outdoor knowledge.'),
    _CategoryItem('Community', Icons.group_outlined,
        Color(0xFF6A1B9A), Color(0xFFF3E5F5),
        'Connect with fellow learners and share experiences.'),
  ];

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

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

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _HomeTab(
            greeting: _greeting,
            name: name,
            categories: _categories,
            user: user,
          ),
          const _PlaceholderTab('My Learning', Icons.school_outlined),
          const _PlaceholderTab('Explore', Icons.explore_outlined),
          const _PlaceholderTab('Progress', Icons.bar_chart_outlined),
          _ProfileTab(user: user, onSignOut: _signOut),
        ],
      ),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

// ═══════════════════════════════════════════
// HOME TAB
// ═══════════════════════════════════════════
class _HomeTab extends StatelessWidget {
  final String greeting;
  final String name;
  final List<_CategoryItem> categories;
  final User? user;

  const _HomeTab({
    required this.greeting,
    required this.name,
    required this.categories,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        // ── HERO SECTION ──
        SliverToBoxAdapter(
          child: Stack(
            children: [
              // Hero background image
              SizedBox(
                height: 340,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/hero_bg.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),

              // Dark gradient overlay
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

              // ── TOP BAR ──
              Positioned(
                top: 0, left: 0, right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.explore,
                            color: Colors.white, size: 26),
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
                              child: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 22),
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

              // ── GREETING + SEARCH ──
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back,',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
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
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Search bar
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
                                      color: Colors.grey.shade400,
                                      size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Search lessons, gear, or tips...',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 13),
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

        // ── CATEGORIES GRID (3 columns) ──
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
              (context, index) => _CategoryCard(item: categories[index]),
              childCount: categories.length,
            ),
          ),
        ),

        // ── CONTINUE LEARNING HEADER ──
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue Learning',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.charcoal,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppTheme.forestGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    Icon(Icons.chevron_right,
                        color: AppTheme.forestGreen, size: 18),
                  ],
                ),
              ],
            ),
          ),
        ),

        // ── LESSON CARDS (horizontal scroll) ──
        SliverToBoxAdapter(
          child: SizedBox(
            height: 140,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: const [
                _LessonCard(
                  title: 'How to Tie a Figure-8 Knot',
                  tag: 'Safety',
                  progress: 0.6,
                  color: AppTheme.forestGreen,
                ),
                _LessonCard(
                  title: 'Reading Topographic Maps',
                  tag: 'Navigation',
                  progress: 0.3,
                  color: Color(0xFF2E7D32),
                ),
              ],
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),
      ],
    );
  }
}

// ═══════════════════════════════════════════
// CATEGORY CARD
// ═══════════════════════════════════════════
class _CategoryCard extends StatelessWidget {
  final _CategoryItem item;
  const _CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 10,
            decoration: BoxDecoration(
              color: item.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            item.name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: item.color,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              item.description,
              style: TextStyle(
                fontSize: 10.5,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: item.bgColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(Icons.arrow_outward, color: item.color, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// LESSON CARD
// ═══════════════════════════════════════════
class _LessonCard extends StatelessWidget {
  final String title;
  final String tag;
  final double progress;
  final Color color;

  const _LessonCard({
    required this.title,
    required this.tag,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                borderRadius: BorderRadius.circular(4),
                minHeight: 5,
              ),
              const SizedBox(height: 4),
              Text(
                '${(progress * 100).toInt()}% Completed',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// PROFILE TAB
// ═══════════════════════════════════════════
class _ProfileTab extends StatelessWidget {
  final User? user;
  final VoidCallback onSignOut;

  const _ProfileTab({required this.user, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 48,
              backgroundColor: AppTheme.forestGreen,
              child: Text(
                (user?.displayName ?? 'U')[0].toUpperCase(),
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              user?.displayName ?? 'Explorer',
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Text(
              user?.email ?? '',
              style: const TextStyle(color: AppTheme.softGray),
            ),
            const SizedBox(height: 28),
            _ProfileTile(Icons.person_outline, 'Edit Profile', () {}),
            _ProfileTile(
                Icons.notifications_outlined, 'Notifications', () {}),
            _ProfileTile(Icons.language, 'Language', () {}),
            _ProfileTile(Icons.help_outline, 'Help & Support', () {}),
            const SizedBox(height: 8),
            _ProfileTile(Icons.logout, 'Sign Out', onSignOut,
                isDestructive: true),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileTile(this.icon, this.label, this.onTap,
      {this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : AppTheme.charcoal;
    return Container(
      
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, color: color),
        title: Text(label,
            style:
                TextStyle(color: color, fontWeight: FontWeight.w500)),
        trailing: isDestructive
            ? null
            : const Icon(Icons.chevron_right, color: AppTheme.softGray),
      ),
    );
  }
}

// ═══════════════════════════════════════════
// PLACEHOLDER TAB
// ═══════════════════════════════════════════
class _PlaceholderTab extends StatelessWidget {
  final String title;
  final IconData icon;

  const _PlaceholderTab(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 56,
              color: AppTheme.forestGreen.withOpacity(0.4)),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.charcoal)),
          const SizedBox(height: 4),
          const Text('Coming soon...',
              style: TextStyle(color: AppTheme.softGray)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// BOTTOM NAV
// ═══════════════════════════════════════════
class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppTheme.forestGreen,
        unselectedItemColor: Colors.grey.shade400,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              activeIcon: Icon(Icons.school),
              label: 'My Learning'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.bar_chart),
              label: 'Progress'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// DATA MODEL
// ═══════════════════════════════════════════
class _CategoryItem {
  final String name;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final String description;

  const _CategoryItem(
      this.name, this.icon, this.color, this.bgColor, this.description);
}