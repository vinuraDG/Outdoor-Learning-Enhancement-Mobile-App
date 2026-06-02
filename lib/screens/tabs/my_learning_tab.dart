import 'package:flutter/material.dart';
import 'package:orc_app/screens/details/lesson_detail_screen.dart';
import '../../models/mock_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/lesson_list_tile.dart';

class MyLearningTab extends StatefulWidget {
  const MyLearningTab({super.key});

  @override
  State<MyLearningTab> createState() => _MyLearningTabState();
}

class _MyLearningTabState extends State<MyLearningTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Learning',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppTheme.charcoal,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.forestGreen,
          unselectedLabelColor: AppTheme.softGray,
          indicatorColor: AppTheme.forestGreen,
          indicatorWeight: 2.5,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          tabs: const [
            Tab(text: 'In Progress'),
            Tab(text: 'Completed'),
            Tab(text: 'Saved'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _LessonList(
            lessons: MockData.lessons
                .where((l) => l.progress > 0 && l.progress < 1.0)
                .toList(),
          ),
          _LessonList(
            lessons: MockData.lessons
                .where((l) => l.progress >= 1.0)
                .toList(),
            emptyMessage: 'No completed lessons yet.\nKeep learning!',
          ),
          _LessonList(
            lessons: MockData.lessons.take(2).toList(),
            showBookmark: true,
            emptyMessage: 'No saved lessons yet.',
          ),
        ],
      ),
    );
  }
}

class _LessonList extends StatelessWidget {
  final List lessons;
  final bool showBookmark;
  final String emptyMessage;

  const _LessonList({
    required this.lessons,
    this.showBookmark = false,
    this.emptyMessage = 'Nothing here yet.',
  });

  @override
  Widget build(BuildContext context) {
    if (lessons.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppTheme.softGray, fontSize: 15),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lessons.length,
      itemBuilder: (context, index) => LessonListTile(
        lesson: lessons[index],
        showBookmark: showBookmark,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LessonDetailScreen(lesson: lessons[index]),
          ),
        ),
      ),
    );
  }
}