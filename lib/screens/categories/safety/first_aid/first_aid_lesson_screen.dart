import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/youtube_player_view.dart';
import 'first_aid_data.dart';

class FirstAidLessonScreen extends StatelessWidget {
  final FirstAidCategory category;
  final FirstAidLesson lesson;

  const FirstAidLessonScreen({
    super.key,
    required this.category,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    final cat = category;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: Column(
        children: [
          // ── Video player ──────────────────────────────────────
          SafeArea(
            bottom: false,
            child: YoutubePlayerView(
              videoId: lesson.youtubeVideoId,
              accentColor: cat.color,
            ),
          ),

          // ── Scrollable content ────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,
                            size: 16, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Text('Back',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Category chip
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: cat.bgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(cat.icon, color: cat.color, size: 13),
                        const SizedBox(width: 5),
                        Text(
                          cat.title,
                          style: TextStyle(
                            color: cat.color,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    lesson.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.charcoal,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(Icons.timer_outlined,
                          size: 14, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        lesson.duration,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Text(
                    lesson.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _SectionCard(
                    accentColor: cat.color,
                    icon: Icons.info_outline,
                    title: 'Introduction',
                    child: Text(
                      lesson.introduction,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.65,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _SectionCard(
                    accentColor: cat.color,
                    icon: Icons.checklist_outlined,
                    title: 'Key Points',
                    child: Column(
                      children: lesson.keyPoints
                          .asMap()
                          .entries
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    margin: const EdgeInsets.only(top: 1),
                                    decoration: BoxDecoration(
                                      color: cat.color
                                          .withValues(alpha: 0.12),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${e.key + 1}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: cat.color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      e.value,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade700,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final Color accentColor;
  final IconData icon;
  final String title;
  final Widget child;

  const _SectionCard({
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.child,
  });

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
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
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
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: accentColor, size: 16),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
