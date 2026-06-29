import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../theme/app_theme.dart';
import 'first_aid_data.dart';

class FirstAidLessonScreen extends StatefulWidget {
  final FirstAidCategory category;
  final FirstAidLesson lesson;

  const FirstAidLessonScreen({
    super.key,
    required this.category,
    required this.lesson,
  });

  @override
  State<FirstAidLessonScreen> createState() => _FirstAidLessonScreenState();
}

class _FirstAidLessonScreenState extends State<FirstAidLessonScreen> {
  late YoutubePlayerController _ytController;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _ytController = YoutubePlayerController(
      initialVideoId: widget.lesson.youtubeVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        captionLanguage: 'en',
      ),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cat = widget.category;
    final lesson = widget.lesson;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _ytController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: cat.color,
        progressColors: ProgressBarColors(
          playedColor: cat.color,
          handleColor: cat.color,
        ),
        onReady: () => _ytController.addListener(() {}),
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: const Color(0xFFF4F6F4),
          body: Column(
            children: [
              // ── Video player (stays at top, full-width) ───
              Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    player,
                    // Back button overlay (only when not fullscreen)
                    if (!_isFullScreen)
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        left: 8,
                        child: SafeArea(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white, size: 22),
                            onPressed: () => Navigator.pop(context),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black45,
                              padding: const EdgeInsets.all(6),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // ── Scrollable content below video ────────────
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

                      // Title
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

                      // Meta row: duration
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

                      // Description
                      Text(
                        lesson.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ── Introduction card ─────────────────
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

                      // ── Key Points card ───────────────────
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 22,
                                        height: 22,
                                        margin:
                                            const EdgeInsets.only(top: 1),
                                        decoration: BoxDecoration(
                                          color:
                                              cat.color.withOpacity(0.12),
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
                      const SizedBox(height: 24),

                      // ── CTA button ────────────────────────
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _ytController.play(),
                          icon: const Icon(Icons.play_arrow_rounded,
                              size: 20),
                          label: const Text('Watch Video'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cat.color,
                            foregroundColor: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Reusable section card ──────────────────────────────────────
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
            color: Colors.black.withOpacity(0.04),
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
                  color: accentColor.withOpacity(0.1),
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