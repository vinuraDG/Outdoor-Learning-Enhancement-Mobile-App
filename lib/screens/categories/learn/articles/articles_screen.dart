import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../learn_data.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFF1A7A6E),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Articles',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${LearnData.articles.length} expert outdoor articles',
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
                  final article = LearnData.articles[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ArticleReaderScreen(article: article),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category tag + read time
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: article.categoryColor
                                        .withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    article.category,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: article.categoryColor),
                                  ),
                                ),
                                const Spacer(),
                                Icon(Icons.schedule_outlined,
                                    size: 12,
                                    color: Colors.grey.shade400),
                                const SizedBox(width: 4),
                                Text(
                                  article.readTime,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: AppTheme.charcoal,
                                          height: 1.3,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        article.intro,
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
                                const SizedBox(width: 12),
                                Container(
                                  width: 52,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: article.categoryColor
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(article.icon,
                                      color: article.categoryColor, size: 26),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'By ${article.author}',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade400),
                                ),
                                const Spacer(),
                                Text(
                                  'Read article',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: article.categoryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(Icons.arrow_forward_outlined,
                                    size: 14,
                                    color: article.categoryColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: LearnData.articles.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Article reader screen ─────────────────────────────────────
class ArticleReaderScreen extends StatelessWidget {
  final OutdoorArticle article;

  const ArticleReaderScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: article.categoryColor,
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
                      article.categoryColor,
                      article.categoryColor.withValues(alpha: 0.75)
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(article.category,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11)),
                            ),
                            const SizedBox(width: 10),
                            Text(article.readTime,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 11)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          article.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By ${article.author}',
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey.shade400),
                    ),
                    const SizedBox(height: 16),
                    // Intro (bold lead paragraph)
                    Text(
                      article.intro,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.charcoal,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Body paragraphs
                    ...article.paragraphs.map((para) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Text(
                            para,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.charcoal,
                              height: 1.7,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
