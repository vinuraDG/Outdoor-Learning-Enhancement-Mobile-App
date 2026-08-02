import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'community_data.dart';
import 'discussions/discussions_screen.dart';
import 'trip_stories/trip_stories_screen.dart';
import 'events/events_screen.dart';
import 'find_partners/find_partners_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  static const Color _purple = Color(0xFF6A1B9A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          // ── Hero AppBar ──────────────────────────────────
          SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            backgroundColor: _purple,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Community',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/community.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xB34A148C), Color(0x736A1B9A)],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Connect & Share',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Join Sri Lanka\'s outdoor learning community.',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 12,
                            runSpacing: 8,
                            children: [
                              _StatChip(
                                value:
                                    '${(CommunityData.memberCount / 1000).toStringAsFixed(1)}K',
                                label: 'Members',
                              ),
                              _StatChip(
                                value: '${CommunityData.postCount}',
                                label: 'Posts',
                              ),
                              _StatChip(
                                value: '${CommunityData.eventCount}',
                                label: 'Events',
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
          ),

          // ── Featured Discussion ──────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: _FeaturedDiscussionCard(
                thread: CommunityData.discussions.first,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiscussionsScreen(
                      openThreadId: CommunityData.discussions.first.id,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Browse by Type ───────────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Text(
                'Browse by Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.30,
              ),
              delegate: SliverChildListDelegate([
                _SectionCard(
                  icon: Icons.forum_outlined,
                  label: 'Discussions',
                  subtitle: '${CommunityData.discussions.length} active threads',
                  color: _purple,
                  bgColor: const Color(0xFFF3E5F5),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const DiscussionsScreen())),
                ),
                _SectionCard(
                  icon: Icons.auto_stories_outlined,
                  label: 'Trip Stories',
                  subtitle: '${CommunityData.stories.length} stories shared',
                  color: const Color(0xFF2D6A4F),
                  bgColor: const Color(0xFFE8F5E9),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const TripStoriesScreen())),
                ),
                _SectionCard(
                  icon: Icons.event_outlined,
                  label: 'Events',
                  subtitle: '${CommunityData.events.length} upcoming events',
                  color: const Color(0xFF0097A7),
                  bgColor: const Color(0xFFE0F7FA),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const EventsScreen())),
                ),
                _SectionCard(
                  icon: Icons.people_outline,
                  label: 'Find Partners',
                  subtitle: '${CommunityData.partners.length} looking for hike partners',
                  color: const Color(0xFFF57F17),
                  bgColor: const Color(0xFFFFF3E0),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const FindPartnersScreen())),
                ),
              ]),
            ),
          ),

          // ── Recent Activity ──────────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final items = _buildActivityItems();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _ActivityTile(item: items[i]),
                  );
                },
                childCount: _buildActivityItems().length,
              ),
            ),
          ),

          // ── Upcoming Events Preview ──────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 148,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: CommunityData.events.take(4).length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final ev = CommunityData.events[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventsScreen(openEventId: ev.id),
                      ),
                    ),
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color:
                                      ev.themeColor.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Icon(ev.icon,
                                    color: ev.themeColor, size: 18),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                decoration: BoxDecoration(
                                  color: ev.themeColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(ev.type,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: ev.themeColor)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ev.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: AppTheme.charcoal,
                              height: 1.3,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(Icons.calendar_today_outlined,
                                  size: 11,
                                  color: Colors.grey.shade400),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  ev.date,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DiscussionsScreen()),
        ),
        backgroundColor: _purple,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('New Post',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }

  List<_ActivityItem> _buildActivityItems() => [
        _ActivityItem(
          avatarLetter: 'R',
          avatarColor: const Color(0xFFF57F17),
          text: 'Roshan M. shared a new trip story — "Three Days in Knuckles"',
          time: '2 hours ago',
          icon: Icons.auto_stories_outlined,
          iconColor: const Color(0xFF2D6A4F),
        ),
        _ActivityItem(
          avatarLetter: 'K',
          avatarColor: const Color(0xFF1565C0),
          text: 'Kasun P. asked: "Best budget hiking boots for beginners?"',
          time: '4 hours ago',
          icon: Icons.forum_outlined,
          iconColor: _purple,
        ),
        _ActivityItem(
          avatarLetter: 'A',
          avatarColor: const Color(0xFF0097A7),
          text: 'Amali F. joined the Sinharaja Biodiversity Walk event',
          time: '6 hours ago',
          icon: Icons.event_outlined,
          iconColor: const Color(0xFF0097A7),
        ),
        _ActivityItem(
          avatarLetter: 'N',
          avatarColor: const Color(0xFFE53935),
          text: 'Nimasha S. is looking for hiking partners for Horton Plains',
          time: '1 day ago',
          icon: Icons.people_outline,
          iconColor: const Color(0xFFF57F17),
        ),
        _ActivityItem(
          avatarLetter: 'D',
          avatarColor: const Color(0xFF2D6A4F),
          text: 'Dilshan W. started a discussion about LNT at high-use campsites',
          time: '3 days ago',
          icon: Icons.forum_outlined,
          iconColor: _purple,
        ),
      ];
}

// ── Stat chip ─────────────────────────────────────────────────
class _StatChip extends StatelessWidget {
  final String value;
  final String label;

  const _StatChip({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16)),
          Text(label,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 10)),
        ],
      ),
    );
  }
}

// ── Featured discussion card ──────────────────────────────────
class _FeaturedDiscussionCard extends StatelessWidget {
  final DiscussionThread thread;
  final VoidCallback onTap;

  const _FeaturedDiscussionCard(
      {required this.thread, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A148C), Color(0xFF6A1B9A)],
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6A1B9A).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Featured',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF69F0AE),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                const Text('Pinned',
                    style:
                        TextStyle(color: Colors.white70, fontSize: 11)),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              thread.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              thread.excerpt,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.75),
                fontSize: 12,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _CircleAvatar(
                    letter: thread.avatarLetter,
                    color: thread.avatarColor,
                    size: 26),
                const SizedBox(width: 8),
                Text(thread.author,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12)),
                const Spacer(),
                Icon(Icons.chat_bubble_outline,
                    color: Colors.white54, size: 14),
                const SizedBox(width: 4),
                Text('${thread.replies}',
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 12)),
                const SizedBox(width: 12),
                Icon(Icons.visibility_outlined,
                    color: Colors.white54, size: 14),
                const SizedBox(width: 4),
                Text('${thread.views}',
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section card ──────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final Color bgColor;
  final VoidCallback onTap;

  const _SectionCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(height: 8),
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: AppTheme.charcoal)),
            const SizedBox(height: 2),
            Text(subtitle,
                style: TextStyle(
                    fontSize: 10, color: Colors.grey.shade500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

// ── Activity item data class ──────────────────────────────────
class _ActivityItem {
  final String avatarLetter;
  final Color avatarColor;
  final String text;
  final String time;
  final IconData icon;
  final Color iconColor;

  const _ActivityItem({
    required this.avatarLetter,
    required this.avatarColor,
    required this.text,
    required this.time,
    required this.icon,
    required this.iconColor,
  });
}

// ── Activity tile ─────────────────────────────────────────────
class _ActivityTile extends StatelessWidget {
  final _ActivityItem item;

  const _ActivityTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _CircleAvatar(
              letter: item.avatarLetter,
              color: item.avatarColor,
              size: 38),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.text,
                  style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.charcoal,
                      height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(item.time,
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey.shade400)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(item.icon, color: item.iconColor, size: 18),
        ],
      ),
    );
  }
}

// ── Shared circle avatar ──────────────────────────────────────
class _CircleAvatar extends StatelessWidget {
  final String letter;
  final Color color;
  final double size;

  const _CircleAvatar(
      {required this.letter, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.42,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
