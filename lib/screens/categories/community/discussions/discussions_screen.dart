import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../community_data.dart';

class DiscussionsScreen extends StatefulWidget {
  final String? openThreadId;

  const DiscussionsScreen({super.key, this.openThreadId});

  @override
  State<DiscussionsScreen> createState() => _DiscussionsScreenState();
}

class _DiscussionsScreenState extends State<DiscussionsScreen> {
  String _filter = 'All';
  static const List<String> _filters = [
    'All', 'Announcement', 'Gear', 'Safety', 'Weather', 'Ethics',
    'Navigation', 'Planning',
  ];

  static const Color _purple = Color(0xFF6A1B9A);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.openThreadId != null) {
        final thread = CommunityData.discussions.firstWhere(
          (t) => t.id == widget.openThreadId,
          orElse: () => CommunityData.discussions.first,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ThreadDetailScreen(thread: thread),
          ),
        );
      }
    });
  }

  List<DiscussionThread> get _filtered => _filter == 'All'
      ? CommunityData.discussions
      : CommunityData.discussions
          .where((t) => t.category == _filter)
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            backgroundColor: _purple,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Discussions',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(52),
              child: Container(
                height: 52,
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    final active = _filter == _filters[i];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _filter = _filters[i]),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: active
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _filters[i],
                          style: TextStyle(
                            color: active ? _purple : Colors.white,
                            fontWeight: active
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _filtered.length,
          itemBuilder: (context, i) {
            final thread = _filtered[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ThreadDetailScreen(thread: thread),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: thread.isPinned
                        ? Border.all(
                            color: _purple.withValues(alpha: 0.3),
                            width: 1.5)
                        : null,
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
                      // Header row
                      Row(
                        children: [
                          _CircleAvatar(
                              letter: thread.avatarLetter,
                              color: thread.avatarColor,
                              size: 32),
                          const SizedBox(width: 8),
                          Text(thread.author,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.charcoal)),
                          const Spacer(),
                          if (thread.isPinned)
                            const Icon(Icons.push_pin_outlined,
                                color: Color(0xFF6A1B9A), size: 14),
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: thread.categoryColor
                                  .withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(thread.category,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: thread.categoryColor)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        thread.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppTheme.charcoal,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        thread.excerpt,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                            height: 1.4),
                      ),
                      const SizedBox(height: 10),
                      // Tags row
                      Wrap(
                        spacing: 6,
                        children: thread.tags
                            .map((t) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text('#$t',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade600)),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                      // Footer
                      Row(
                        children: [
                          Icon(Icons.chat_bubble_outline,
                              size: 13, color: Colors.grey.shade400),
                          const SizedBox(width: 4),
                          Text('${thread.replies}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500)),
                          const SizedBox(width: 12),
                          Icon(Icons.visibility_outlined,
                              size: 13, color: Colors.grey.shade400),
                          const SizedBox(width: 4),
                          Text('${thread.views}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500)),
                          const Spacer(),
                          Icon(Icons.schedule_outlined,
                              size: 12, color: Colors.grey.shade400),
                          const SizedBox(width: 4),
                          Text(thread.lastActive,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade400)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: _purple,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('New Thread',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// ── Thread detail screen ──────────────────────────────────────
class ThreadDetailScreen extends StatelessWidget {
  final DiscussionThread thread;

  const ThreadDetailScreen({super.key, required this.thread});

  static const Color _purple = Color(0xFF6A1B9A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: _purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          thread.category,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thread card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _CircleAvatar(
                          letter: thread.avatarLetter,
                          color: thread.avatarColor,
                          size: 40),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(thread.author,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppTheme.charcoal)),
                          Text(thread.lastActive,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade400)),
                        ],
                      ),
                      const Spacer(),
                      if (thread.isPinned)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _purple.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.push_pin_outlined,
                                  color: _purple, size: 12),
                              SizedBox(width: 4),
                              Text('Pinned',
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    thread.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.charcoal,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    thread.excerpt,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.charcoal,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: thread.tags
                        .map((t) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 4),
                              decoration: BoxDecoration(
                                color: _purple.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('#$t',
                                  style: const TextStyle(
                                      fontSize: 11, color: _purple)),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _StatPill(
                          icon: Icons.chat_bubble_outline,
                          value: '${thread.replies} replies'),
                      const SizedBox(width: 10),
                      _StatPill(
                          icon: Icons.visibility_outlined,
                          value: '${thread.views} views'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Reply preview cards
            const Text('Replies',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.charcoal)),
            const SizedBox(height: 10),
            ..._sampleReplies(thread).map((r) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _ReplyCard(reply: r),
                )),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.reply_outlined),
                label: const Text('Join the Discussion'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  List<_Reply> _sampleReplies(DiscussionThread t) => [
        _Reply(
          avatarLetter: 'D',
          avatarColor: const Color(0xFF2D6A4F),
          author: 'Dilshan W.',
          time: '3 hours ago',
          body: 'Great point! I have been wondering about this too. From my experience, '
              'the best approach is to prepare thoroughly before your trip and always '
              'share your itinerary with someone you trust.',
        ),
        _Reply(
          avatarLetter: 'N',
          avatarColor: const Color(0xFFE53935),
          author: 'Nimasha S.',
          time: '5 hours ago',
          body: 'Completely agree. I would also add that checking the weather forecast '
              '48 hours in advance is essential — conditions in the highlands can '
              'change dramatically within a few hours.',
        ),
        _Reply(
          avatarLetter: 'A',
          avatarColor: const Color(0xFF0097A7),
          author: 'Amali F.',
          time: '1 day ago',
          body: 'Useful discussion. One more thing worth mentioning is the importance '
              'of having a reliable water source plan. Stream water in many areas '
              'needs treatment before drinking.',
        ),
      ];
}

class _Reply {
  final String avatarLetter;
  final Color avatarColor;
  final String author;
  final String time;
  final String body;

  const _Reply({
    required this.avatarLetter,
    required this.avatarColor,
    required this.author,
    required this.time,
    required this.body,
  });
}

class _ReplyCard extends StatelessWidget {
  final _Reply reply;

  const _ReplyCard({required this.reply});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _CircleAvatar(
                  letter: reply.avatarLetter,
                  color: reply.avatarColor,
                  size: 30),
              const SizedBox(width: 8),
              Text(reply.author,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppTheme.charcoal)),
              const Spacer(),
              Text(reply.time,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.shade400)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            reply.body,
            style: const TextStyle(
                fontSize: 13, color: AppTheme.charcoal, height: 1.55),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.thumb_up_outlined,
                  size: 14, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Text('Like',
                  style:
                      TextStyle(fontSize: 12, color: Colors.grey.shade400)),
              const SizedBox(width: 16),
              Icon(Icons.reply_outlined,
                  size: 14, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Text('Reply',
                  style:
                      TextStyle(fontSize: 12, color: Colors.grey.shade400)),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatPill({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: Colors.grey.shade500),
          const SizedBox(width: 5),
          Text(value,
              style:
                  TextStyle(fontSize: 12, color: Colors.grey.shade500)),
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
