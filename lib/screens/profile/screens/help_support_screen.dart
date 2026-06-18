import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../theme/app_theme.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  final List<_FaqItem> _faqs = const [
    _FaqItem(
      question: 'How do I reset my password?',
      answer:
          'Go to the login screen and tap "Forgot Password". Enter your registered email address and we\'ll send you a link to reset your password within a few minutes.',
    ),
    _FaqItem(
      question: 'How do I update my profile information?',
      answer:
          'Navigate to Profile tab → Edit Profile. You can update your name, phone number, bio, and profile photo. Tap "Save" when done.',
    ),
    _FaqItem(
      question: 'How do I track my learning progress?',
      answer:
          'Your progress is automatically tracked as you complete lessons. Visit the Progress tab to see detailed stats on your completed courses, streaks, and certificates.',
    ),
    _FaqItem(
      question: 'Can I download lessons for offline use?',
      answer:
          'Currently, offline mode is not supported. All lesson content requires an active internet connection. We are working on adding offline support in a future update.',
    ),
    _FaqItem(
      question: 'How do I enrol in a course?',
      answer:
          'Browse courses in the Explore tab, tap on a course you like, and then tap "Enrol". Free courses are available immediately; premium courses require a subscription.',
    ),
    _FaqItem(
      question: 'How do I contact a course instructor?',
      answer:
          'Inside any course, tap the "Community" tab to ask questions. Instructors typically respond within 24–48 hours.',
    ),
    _FaqItem(
      question: 'Is my payment information secure?',
      answer:
          'Yes. We use industry-standard encryption and do not store your card details on our servers. All payments are processed through secure, PCI-compliant payment gateways.',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _launchEmail() async {
    final uri = Uri(scheme: 'mailto', path: 'support@orcapp.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _faqs
        .where((f) =>
            _searchQuery.isEmpty ||
            f.question.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            f.answer.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppTheme.charcoal),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: AppTheme.charcoal,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _searchQuery = v),
              style: const TextStyle(fontSize: 14, color: AppTheme.charcoal),
              decoration: InputDecoration(
                hintText: 'Search help articles...',
                hintStyle: const TextStyle(color: AppTheme.softGray, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: AppTheme.softGray, size: 20),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, size: 18, color: AppTheme.softGray),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Contact cards
          const _SectionLabel(label: 'Get in Touch'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _ContactCard(
                  icon: Icons.email_outlined,
                  title: 'Email Us',
                  subtitle: 'support@orcapp.com',
                  onTap: _launchEmail,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ContactCard(
                  icon: Icons.chat_bubble_outline,
                  title: 'Live Chat',
                  subtitle: 'Mon–Fri, 9am–6pm',
                  onTap: () {
                    // TODO: Integrate live chat (e.g. Intercom, Freshchat)
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // FAQ
          const _SectionLabel(label: 'Frequently Asked Questions'),
          const SizedBox(height: 8),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  Icon(Icons.search_off, size: 48, color: AppTheme.softGray),
                  const SizedBox(height: 12),
                  Text(
                    'No results for "$_searchQuery"',
                    style: const TextStyle(color: AppTheme.softGray, fontSize: 14),
                  ),
                ],
              ),
            )
          else
            ...filtered.map((faq) => _FaqTile(item: faq)),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppTheme.softGray,
        letterSpacing: 0.6,
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppTheme.forestGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppTheme.forestGreen, size: 18),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppTheme.charcoal,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 11, color: AppTheme.softGray),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqItem {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});
}

class _FaqTile extends StatefulWidget {
  final _FaqItem item;
  const _FaqTile({required this.item});

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (v) => setState(() => _expanded = v),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(Icons.keyboard_arrow_down, color: AppTheme.softGray),
          ),
          title: Text(
            widget.item.question,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.charcoal,
            ),
          ),
          children: [
            Text(
              widget.item.answer,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.softGray,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}