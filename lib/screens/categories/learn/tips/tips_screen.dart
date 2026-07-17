import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../learn_data.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: LearnData.tipCategories.length, vsync: this);
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
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFFF57F17),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Tips & Tricks',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: LearnData.tipCategories
                  .map((c) => Tab(text: c.title))
                  .toList(),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: LearnData.tipCategories
              .map((cat) => _TipCategoryView(category: cat))
              .toList(),
        ),
      ),
    );
  }
}

class _TipCategoryView extends StatelessWidget {
  final TipCategory category;

  const _TipCategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: category.tips.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: category.bgColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      color: category.color,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: category.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Tip ${i + 1}',
                          style: TextStyle(
                            fontSize: 11,
                            color: category.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      category.tips[i],
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.charcoal,
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
