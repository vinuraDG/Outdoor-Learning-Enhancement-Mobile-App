import 'package:flutter/material.dart';
import '../../models/lesson_model.dart';
import '../../theme/app_theme.dart';
import '../../services/progress_service.dart';

class LessonDetailScreen extends StatefulWidget {
  final LessonModel lesson;

  const LessonDetailScreen({super.key, required this.lesson});

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    _isComplete = ProgressService.isComplete(widget.lesson.id);
  }

  void _markComplete() {
    setState(() => _isComplete = true);
    ProgressService.markComplete(widget.lesson.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Lesson marked as complete!'),
        backgroundColor: AppTheme.forestGreen,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppTheme.charcoal),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined,
                    color: AppTheme.charcoal),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_border,
                    color: AppTheme.charcoal),
                onPressed: () {},
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video thumbnail
                Container(
                  height: 220,
                  width: double.infinity,
                  color: lesson.categoryColor.withAlpha(38),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.landscape_outlined,
                        size: 80,
                        color: lesson.categoryColor.withAlpha(77),
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(230),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(26),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: lesson.categoryColor,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category tag
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: lesson.categoryColor.withAlpha(26),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          lesson.categoryName,
                          style: TextStyle(
                            color: lesson.categoryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        lesson.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.charcoal,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        lesson.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Progress bar
                      Row(
                        children: [
                          const Text(
                            'Progress',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: AppTheme.charcoal,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _isComplete
                                ? '100% Completed'
                                : '${(lesson.progress * 100).toInt()}% Completed',
                            style: TextStyle(
                              fontSize: 12,
                              color: lesson.categoryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      LinearProgressIndicator(
                        value: _isComplete ? 1.0 : lesson.progress,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            lesson.categoryColor),
                        borderRadius: BorderRadius.circular(4),
                        minHeight: 6,
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Lesson Content',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.charcoal,
                        ),
                      ),
                      const SizedBox(height: 12),

                      ...lesson.sections.asMap().entries.map(
                            (entry) => _SectionTile(
                              index: entry.key,
                              section: entry.value,
                              color: lesson.categoryColor,
                              isCompleted: _isComplete ||
                                  entry.key <
                                      (lesson.progress *
                                              lesson.sections.length)
                                          .floor(),
                            ),
                          ),

                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: _isComplete ? null : _markComplete,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                _isComplete ? Colors.grey.shade300 : AppTheme.forestGreen,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: Text(
            _isComplete ? 'Completed' : 'Mark as Complete',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  final int index;
  final LessonSection section;
  final Color color;
  final bool isCompleted;

  const _SectionTile({
    required this.index,
    required this.section,
    required this.color,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted ? color : color.withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              section.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.charcoal,
              ),
            ),
          ),
          Text(
            section.duration,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.softGray,
            ),
          ),
        ],
      ),
    );
  }
}
