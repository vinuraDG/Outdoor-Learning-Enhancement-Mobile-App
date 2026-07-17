import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../theme/app_theme.dart';
import 'weather_data.dart';

/// Full-screen lesson for a weather education topic.
class WeatherLessonScreen extends StatefulWidget {
  final WeatherLesson lesson;

  const WeatherLessonScreen({super.key, required this.lesson});

  @override
  State<WeatherLessonScreen> createState() => _WeatherLessonScreenState();
}

class _WeatherLessonScreenState extends State<WeatherLessonScreen> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.lesson.youtubeVideoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;

    return YoutubePlayerBuilder(
      onEnterFullScreen: () => setState(() => _isFullScreen = true),
      onExitFullScreen: () => setState(() => _isFullScreen = false),
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: lesson.color,
      ),
      builder: (context, player) => Scaffold(
        backgroundColor: const Color(0xFFF4F6F4),
        body: Column(
          children: [
            // ── Video panel ─────────────────────────────────────
            Stack(
              children: [
                Container(color: Colors.black, child: player),
                if (!_isFullScreen)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // ── Scrollable content ──────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey.shade500),
                    ),
                    const SizedBox(height: 16),

                    // Introduction card
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

                    // Key points card
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
                    const SizedBox(height: 16),

                    // Watch video button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _controller.play(),
                        icon: const Icon(Icons.play_circle_outlined),
                        label: const Text('Watch Video'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lesson.color,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
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
