import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../community_data.dart';

class TripStoriesScreen extends StatelessWidget {
  const TripStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFF2D6A4F),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Trip Stories',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${CommunityData.stories.length} stories from our community',
                  style:
                      const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final story = CommunityData.stories[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StoryDetailScreen(story: story),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cover
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(18)),
                              child: Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      story.coverColor,
                                      story.coverColor.withValues(alpha: 0.7),
                                    ],
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Icon(
                                        story.coverIcon,
                                        color: Colors.white
                                            .withValues(alpha: 0.2),
                                        size: 80,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      left: 14,
                                      right: 14,
                                      child: Row(
                                        children: [
                                          _CircleAvatar(
                                            letter: story.avatarLetter,
                                            color: story.avatarColor,
                                            size: 32,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            story.author,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13),
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4),
                                            decoration: BoxDecoration(
                                              color: story.difficultyColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              story.difficulty,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Body
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 13,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          story.location,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade500),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(story.date,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade400)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    story.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: AppTheme.charcoal,
                                      height: 1.3,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    story.excerpt,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade500,
                                        height: 1.4),
                                  ),
                                  const SizedBox(height: 10),
                                  // Chips
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        _InfoChip(
                                          icon: Icons.schedule_outlined,
                                          label: story.duration,
                                        ),
                                        const SizedBox(width: 8),
                                        ...story.tags.take(2).map((t) =>
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text('#$t',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors
                                                            .grey.shade600)),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.favorite_border_outlined,
                                          size: 15,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text('${story.likes}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade500)),
                                      const SizedBox(width: 12),
                                      Icon(Icons.chat_bubble_outline,
                                          size: 14,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text('${story.comments}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade500)),
                                      const Spacer(),
                                      Text('Read story',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: story.coverColor,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(width: 4),
                                      Icon(Icons.arrow_forward_outlined,
                                          size: 14,
                                          color: story.coverColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: CommunityData.stories.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF2D6A4F),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Share Story',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// ── Story detail screen ───────────────────────────────────────
class StoryDetailScreen extends StatelessWidget {
  final TripStory story;

  const StoryDetailScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: story.coverColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      story.coverColor,
                      story.coverColor.withValues(alpha: 0.7)
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        story.coverIcon,
                        color: Colors.white.withValues(alpha: 0.15),
                        size: 120,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20, 56, 20, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: story.difficultyColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(story.difficulty,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700)),
                                ),
                                const SizedBox(width: 8),
                                Text(story.duration,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12)),
                                const SizedBox(width: 8),
                                Text('•  ${story.date}',
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              story.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  // Author + stats row
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2))
                      ],
                    ),
                    child: Row(
                      children: [
                        _CircleAvatar(
                            letter: story.avatarLetter,
                            color: story.avatarColor,
                            size: 40),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(story.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: AppTheme.charcoal)),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    size: 12,
                                    color: Colors.grey.shade400),
                                const SizedBox(width: 4),
                                Text(story.location,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade500)),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Icon(Icons.favorite_border_outlined,
                                color: Colors.grey.shade400, size: 18),
                            Text('${story.likes}',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade400)),
                          ],
                        ),
                        const SizedBox(width: 14),
                        Column(
                          children: [
                            Icon(Icons.chat_bubble_outline,
                                color: Colors.grey.shade400, size: 18),
                            Text('${story.comments}',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Story body
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2))
                      ],
                    ),
                    child: Text(
                      story.body,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.charcoal,
                        height: 1.75,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: story.tags
                        .map((t) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color:
                                    story.coverColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('#$t',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: story.coverColor,
                                      fontWeight: FontWeight.w500)),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Add a Comment'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: story.coverColor,
                        side: BorderSide(color: story.coverColor),
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Helpers ───────────────────────────────────────────────────
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 11, color: Colors.grey.shade500),
          const SizedBox(width: 4),
          Text(label,
              style:
                  TextStyle(fontSize: 10, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

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
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(letter,
            style: TextStyle(
                color: Colors.white,
                fontSize: size * 0.42,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
