import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../learn_data.dart';

/// List of guides + inline guide reader.
class GuidesScreen extends StatelessWidget {
  final String? openGuideId;

  const GuidesScreen({super.key, this.openGuideId});

  @override
  Widget build(BuildContext context) {
    // If a specific guide should be opened immediately, push its reader
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (openGuideId != null) {
        final guide = LearnData.guides.firstWhere((g) => g.id == openGuideId,
            orElse: () => LearnData.guides.first);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => GuideReaderScreen(guide: guide)),
        );
      }
    });

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
            title: const Text('Guides',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${LearnData.guides.length} in-depth outdoor guides',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final guide = LearnData.guides[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GuideReaderScreen(guide: guide),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
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
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: guide.color.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(guide.icon,
                                  color: guide.color, size: 26),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    guide.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: AppTheme.charcoal,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule_outlined,
                                          size: 12,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text(
                                        guide.readTime,
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade400),
                                      ),
                                      const SizedBox(width: 10),
                                      Icon(Icons.list_outlined,
                                          size: 12,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${guide.sections.length} sections',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade400),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    guide.summary,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                        height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.chevron_right,
                                color: Colors.grey.shade400),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: LearnData.guides.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Guide reader screen ───────────────────────────────────────
class GuideReaderScreen extends StatelessWidget {
  final OutdoorGuide guide;

  const GuideReaderScreen({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: guide.color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              guide.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [guide.color, guide.color.withValues(alpha: 0.75)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.schedule_outlined,
                                  color: Colors.white70, size: 13),
                              const SizedBox(width: 5),
                              Text(guide.readTime,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                              const SizedBox(width: 12),
                              const Icon(Icons.list_outlined,
                                  color: Colors.white70, size: 13),
                              const SizedBox(width: 5),
                              Text('${guide.sections.length} sections',
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          guide.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          guide.summary,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final section = guide.sections[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
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
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: guide.color,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${i + 1}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  section.heading,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: guide.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            section.body,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.charcoal,
                              height: 1.65,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: guide.sections.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
