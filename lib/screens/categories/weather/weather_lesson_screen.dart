import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/youtube_player_view.dart';
import 'weather_data.dart';

class WeatherLessonScreen extends StatelessWidget {
  final WeatherLesson lesson;

  const WeatherLessonScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: Column(
        children: [
          // ── Video player ──────────────────────────────────────
          SafeArea(
            bottom: false,
            child: YoutubePlayerView(
              videoId: lesson.youtubeVideoId,
              accentColor: lesson.color,
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
                      color: lesson.bgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(lesson.icon, color: lesson.color, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          'Weather Education',
                          style: TextStyle(
                              color: lesson.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
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
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    lesson.subtitle,
                    style:
                        TextStyle(fontSize: 13, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 16),

                  _SectionCard(
                    icon: Icons.info_outline,
                    title: 'Introduction',
                    color: lesson.color,
                    child: Text(
                      lesson.description,
                      style: const TextStyle(
                          fontSize: 14,
                          color: AppTheme.charcoal,
                          height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 14),

                  _SectionCard(
                    icon: Icons.checklist_outlined,
                    title: 'Key Points',
                    color: lesson.color,
                    child: Column(
                      children: lesson.keyPoints.asMap().entries.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: lesson.color,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${e.key + 1}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  e.value,
                                  style: const TextStyle(
                                      fontSize: 13.5,
                                      color: AppTheme.charcoal,
                                      height: 1.5),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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
  final IconData icon;
  final String title;
  final Color color;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.charcoal),
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
