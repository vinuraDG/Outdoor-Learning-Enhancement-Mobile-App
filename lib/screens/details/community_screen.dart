import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          // ── HERO HEADER ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF6A1B9A), Color(0xFF9C27B0)],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row
                      Row(
                        children: [
                          const Icon(Icons.group, color: Colors.white, size: 24),
                          const SizedBox(width: 8),
                          const Text(
                            'Community',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          _IconBtn(
                            icon: Icons.notifications_outlined,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _IconBtn(
                            icon: Icons.search,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Connect & Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Join a community of outdoor learners\nand share your experiences.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Stats row
                      Row(
                        children: [
                          _StatChip(label: '2.4k Members'),
                          const SizedBox(width: 10),
                          _StatChip(label: '180 Posts'),
                          const SizedBox(width: 10),
                          _StatChip(label: '12 Events'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── SECTION TABS ──
          SliverToBoxAdapter(
            child: _CommunityTabs(),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),

      // FAB for new post
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF6A1B9A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

// ── TABS CONTROLLER ──────────────────────────────────────────
class _CommunityTabs extends StatefulWidget {
  @override
  State<_CommunityTabs> createState() => _CommunityTabsState();
}

class _CommunityTabsState extends State<_CommunityTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF6A1B9A),
            unselectedLabelColor: AppTheme.softGray,
            indicatorColor: const Color(0xFF6A1B9A),
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            tabs: const [
              Tab(text: 'Discussions'),
              Tab(text: 'Trip Stories'),
              Tab(text: 'Events'),
              Tab(text: 'Partners'),
            ],
          ),
        ),
        SizedBox(
          // Fixed height for the tab content area
          height: 520,
          child: TabBarView(
            controller: _tabController,
            children: const [
              _DiscussionsTab(),
              _TripStoriesTab(),
              _EventsTab(),
              _PartnersTab(),
            ],
          ),
        ),
      ],
    );
  }
}

// ── DISCUSSIONS TAB ──────────────────────────────────────────
class _DiscussionsTab extends StatelessWidget {
  const _DiscussionsTab();

  static const List<_DiscussionData> _items = [
    _DiscussionData(
      avatar: 'DM',
      name: 'Dinusha M.',
      time: '2h ago',
      title: 'Best gear for monsoon hiking?',
      body: 'Planning a hike during the rainy season. What waterproof gear do you recommend for Sri Lanka trails?',
      replies: 14,
      likes: 32,
      tag: 'Equipment',
      tagColor: Color(0xFF0097A7),
    ),
    _DiscussionData(
      avatar: 'KP',
      name: 'Kasun P.',
      time: '5h ago',
      title: 'Navigation without signal in Knuckles',
      body: 'Has anyone done the Knuckles range without mobile signal? How did you navigate?',
      replies: 8,
      likes: 21,
      tag: 'Navigation',
      tagColor: Color(0xFF2E7D32),
    ),
    _DiscussionData(
      avatar: 'SL',
      name: 'Sachini L.',
      time: '1d ago',
      title: 'Wildlife safety tips for Sinharaja',
      body: 'First time visiting Sinharaja. Any advice on staying safe around wildlife?',
      replies: 22,
      likes: 47,
      tag: 'Safety',
      tagColor: Color(0xFF2D6A4F),
    ),
    _DiscussionData(
      avatar: 'RM',
      name: 'Ravindu M.',
      time: '2d ago',
      title: 'Leave No Trace — are we doing enough?',
      body: 'Visited Horton Plains last weekend and was shocked by the litter. What can we do as a community?',
      replies: 35,
      likes: 89,
      tag: 'Learn',
      tagColor: Color(0xFF1565C0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _items.length,
      itemBuilder: (_, i) => _DiscussionCard(data: _items[i]),
    );
  }
}

class _DiscussionData {
  final String avatar;
  final String name;
  final String time;
  final String title;
  final String body;
  final int replies;
  final int likes;
  final String tag;
  final Color tagColor;

  const _DiscussionData({
    required this.avatar,
    required this.name,
    required this.time,
    required this.title,
    required this.body,
    required this.replies,
    required this.likes,
    required this.tag,
    required this.tagColor,
  });
}

class _DiscussionCard extends StatelessWidget {
  final _DiscussionData data;
  const _DiscussionCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author row
          Row(
            children: [
              _Avatar(initials: data.avatar, color: const Color(0xFF6A1B9A)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppTheme.charcoal)),
                    Text(data.time,
                        style: const TextStyle(
                            fontSize: 11, color: AppTheme.softGray)),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: data.tagColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  data.tag,
                  style: TextStyle(
                    color: data.tagColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(data.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppTheme.charcoal)),
          const SizedBox(height: 4),
          Text(
            data.body,
            style: TextStyle(
                fontSize: 12, color: Colors.grey.shade600, height: 1.5),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _ActionChip(
                icon: Icons.chat_bubble_outline,
                label: '${data.replies}',
              ),
              const SizedBox(width: 12),
              _ActionChip(
                icon: Icons.favorite_border,
                label: '${data.likes}',
              ),
              const Spacer(),
              Icon(Icons.share_outlined,
                  size: 16, color: Colors.grey.shade400),
            ],
          ),
        ],
      ),
    );
  }
}

// ── TRIP STORIES TAB ─────────────────────────────────────────
class _TripStoriesTab extends StatelessWidget {
  const _TripStoriesTab();

  static const List<_StoryData> _stories = [
    _StoryData(
      avatar: 'NF',
      name: 'Nimal F.',
      location: 'Adam\'s Peak, Sri Lanka',
      time: '3d ago',
      title: 'Sunrise Trek to Adam\'s Peak',
      body: 'Started at midnight, reached the summit just as the golden sun broke over the horizon. The shadow triangle phenomenon was breathtaking...',
      likes: 124,
      color: Color(0xFF2D6A4F),
    ),
    _StoryData(
      avatar: 'PW',
      name: 'Priya W.',
      location: 'Horton Plains, Sri Lanka',
      time: '1w ago',
      title: 'World\'s End — Worth Every Step',
      body: 'The 9km loop through cloud forest was misty and magical. World\'s End cliff drop into nothingness was surreal...',
      likes: 98,
      color: Color(0xFF1565C0),
    ),
    _StoryData(
      avatar: 'AK',
      name: 'Aruna K.',
      location: 'Knuckles Range, Sri Lanka',
      time: '2w ago',
      title: '3-Day Knuckles Traverse',
      body: 'Three days of pure wilderness. No signal, no roads — just mountains, rivers and the most incredible biodiversity...',
      likes: 203,
      color: Color(0xFF6A1B9A),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _stories.length,
      itemBuilder: (_, i) => _StoryCard(data: _stories[i]),
    );
  }
}

class _StoryData {
  final String avatar;
  final String name;
  final String location;
  final String time;
  final String title;
  final String body;
  final int likes;
  final Color color;

  const _StoryData({
    required this.avatar,
    required this.name,
    required this.location,
    required this.time,
    required this.title,
    required this.body,
    required this.likes,
    required this.color,
  });
}

class _StoryCard extends StatelessWidget {
  final _StoryData data;
  const _StoryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.12),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(Icons.landscape_outlined,
                  size: 48, color: data.color.withOpacity(0.4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _Avatar(initials: data.avatar, color: data.color),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: AppTheme.charcoal)),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 11,
                                  color: Colors.grey.shade400),
                              const SizedBox(width: 2),
                              Text(data.location,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade500)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(data.time,
                        style: const TextStyle(
                            fontSize: 11, color: AppTheme.softGray)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppTheme.charcoal)),
                const SizedBox(height: 4),
                Text(
                  data.body,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      height: 1.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _ActionChip(
                        icon: Icons.favorite_border, label: '${data.likes}'),
                    const SizedBox(width: 12),
                    _ActionChip(icon: Icons.chat_bubble_outline, label: 'Reply'),
                    const Spacer(),
                    Icon(Icons.bookmark_border,
                        size: 16, color: Colors.grey.shade400),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── EVENTS TAB ───────────────────────────────────────────────
class _EventsTab extends StatelessWidget {
  const _EventsTab();

  static const List<_EventData> _events = [
    _EventData(
      title: 'Weekend Trail Cleanup',
      location: 'Sinharaja Forest Reserve',
      date: 'Jun 14, 2026',
      time: '6:00 AM',
      spots: 18,
      totalSpots: 30,
      color: Color(0xFF2D6A4F),
      icon: Icons.cleaning_services_outlined,
    ),
    _EventData(
      title: 'Beginner Navigation Workshop',
      location: 'SUSL Campus Grounds',
      date: 'Jun 21, 2026',
      time: '9:00 AM',
      spots: 6,
      totalSpots: 20,
      color: Color(0xFF1565C0),
      icon: Icons.explore_outlined,
    ),
    _EventData(
      title: 'Knuckles Group Trek',
      location: 'Knuckles Range, Matale',
      date: 'Jul 5, 2026',
      time: '5:30 AM',
      spots: 4,
      totalSpots: 12,
      color: Color(0xFF6A1B9A),
      icon: Icons.hiking_outlined,
    ),
    _EventData(
      title: 'First Aid & Wilderness Safety',
      location: 'SUSL Medical Faculty',
      date: 'Jul 12, 2026',
      time: '10:00 AM',
      spots: 25,
      totalSpots: 40,
      color: Color(0xFFE53935),
      icon: Icons.medical_services_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _events.length,
      itemBuilder: (_, i) => _EventCard(data: _events[i]),
    );
  }
}

class _EventData {
  final String title;
  final String location;
  final String date;
  final String time;
  final int spots;
  final int totalSpots;
  final Color color;
  final IconData icon;

  const _EventData({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.spots,
    required this.totalSpots,
    required this.color,
    required this.icon,
  });
}

class _EventCard extends StatelessWidget {
  final _EventData data;
  const _EventCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final spotsLeft = data.totalSpots - data.spots;
    final isFull = spotsLeft == 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date block
          Container(
            width: 52,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(data.icon, color: data.color, size: 22),
                const SizedBox(height: 4),
                Text(
                  data.date.split(' ')[1].replaceAll(',', ''),
                  style: TextStyle(
                    color: data.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  data.date.split(' ')[0],
                  style: TextStyle(
                    color: data.color.withOpacity(0.7),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppTheme.charcoal)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(data.location,
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined,
                        size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 3),
                    Text(data.time,
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade600)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      isFull ? 'Full' : '$spotsLeft spots left',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isFull ? Colors.red : data.color,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                          color: isFull
                              ? Colors.grey.shade200
                              : data.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isFull ? 'Full' : 'Join',
                          style: TextStyle(
                            color: isFull
                                ? Colors.grey.shade500
                                : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── PARTNERS TAB ─────────────────────────────────────────────
class _PartnersTab extends StatelessWidget {
  const _PartnersTab();

  static const List<_PartnerData> _partners = [
    _PartnerData(
      avatar: 'TK',
      name: 'Thilak K.',
      level: 'Intermediate',
      interests: ['Trekking', 'Navigation'],
      location: 'Kandy',
      color: Color(0xFF2D6A4F),
    ),
    _PartnerData(
      avatar: 'MW',
      name: 'Malini W.',
      level: 'Beginner',
      interests: ['Safety', 'Learn'],
      location: 'Colombo',
      color: Color(0xFF1565C0),
    ),
    _PartnerData(
      avatar: 'BS',
      name: 'Binura S.',
      level: 'Advanced',
      interests: ['Equipment', 'Community'],
      location: 'Gampaha',
      color: Color(0xFF6A1B9A),
    ),
    _PartnerData(
      avatar: 'CF',
      name: 'Chamari F.',
      level: 'Intermediate',
      interests: ['Weather', 'Trekking'],
      location: 'Matara',
      color: Color(0xFFF57F17),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _partners.length,
      itemBuilder: (_, i) => _PartnerCard(data: _partners[i]),
    );
  }
}

class _PartnerData {
  final String avatar;
  final String name;
  final String level;
  final List<String> interests;
  final String location;
  final Color color;

  const _PartnerData({
    required this.avatar,
    required this.name,
    required this.level,
    required this.interests,
    required this.location,
    required this.color,
  });
}

class _PartnerCard extends StatelessWidget {
  final _PartnerData data;
  const _PartnerCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _Avatar(initials: data.avatar, color: data.color, size: 48),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(data.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppTheme.charcoal)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: data.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(data.level,
                          style: TextStyle(
                              color: data.color,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 3),
                    Text(data.location,
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade500)),
                  ],
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 5,
                  children: data.interests
                      .map(
                        (i) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(i,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade700)),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF6A1B9A),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Text('Connect',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── SHARED SMALL WIDGETS ─────────────────────────────────────
class _Avatar extends StatelessWidget {
  final String initials;
  final Color color;
  final double size;

  const _Avatar({
    required this.initials,
    required this.color,
    this.size = 38,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            color: color,
            fontSize: size * 0.33,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade400),
        const SizedBox(width: 4),
        Text(label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  const _StatChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}