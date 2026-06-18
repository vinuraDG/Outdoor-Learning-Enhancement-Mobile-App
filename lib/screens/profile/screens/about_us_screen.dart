import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../theme/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  static const String _appVersion = '1.0.0';
  static const String _websiteUrl = 'https://orcapp.com';
  static const String _linkedInUrl = 'https://linkedin.com/company/orcapp';

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'About Us',
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
          // Hero branding block
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppTheme.forestGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 40,
                    color: AppTheme.forestGreen,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'ORC App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Learn. Grow. Achieve.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Version $_appVersion',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Mission
          _InfoCard(
            icon: Icons.flag_outlined,
            title: 'Our Mission',
            content:
                'ORC App is built to make quality education accessible to everyone in Sri Lanka and beyond. We believe that the right knowledge, delivered at the right time, can transform lives and communities.',
          ),
          const SizedBox(height: 12),

          // What we offer
          _InfoCard(
            icon: Icons.auto_stories_outlined,
            title: 'What We Offer',
            content:
                'Expert-led courses across technology, business, and creative fields. Structured learning paths, interactive lessons, progress tracking, and a vibrant community of learners — all in one place.',
          ),
          const SizedBox(height: 20),

          // Stats row
          const _SectionLabel(label: 'By the Numbers'),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(child: _StatCard(value: '50+', label: 'Courses')),
              SizedBox(width: 10),
              Expanded(child: _StatCard(value: '200+', label: 'Lessons')),
              SizedBox(width: 10),
              Expanded(child: _StatCard(value: '5K+', label: 'Learners')),
            ],
          ),
          const SizedBox(height: 20),

          // Team
          
          const SizedBox(height: 20),

          // Social & links
          const _SectionLabel(label: 'Connect With Us'),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _LinkTile(
                  icon: Icons.language_outlined,
                  label: 'Website',
                  value: 'orcapp.com',
                  onTap: () => _launch(_websiteUrl),
                ),
                const Divider(height: 1, indent: 52),
                _LinkTile(
                  icon: Icons.work_outline,
                  label: 'LinkedIn',
                  value: 'ORC App',
                  onTap: () => _launch(_linkedInUrl),
                ),
                const Divider(height: 1, indent: 52),
                _LinkTile(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: 'hello@orcapp.com',
                  onTap: () => _launch('mailto:hello@orcapp.com'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          const Center(
            child: Text(
              '© 2025 ORC App. Made with ❤️ in Sri Lanka.',
              style: TextStyle(fontSize: 12, color: AppTheme.softGray),
            ),
          ),
          const SizedBox(height: 24),
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

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _InfoCard({required this.icon, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.charcoal,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.softGray,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppTheme.forestGreen,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppTheme.softGray),
          ),
        ],
      ),
    );
  }
}

class _TeamMember extends StatelessWidget {
  final String name;
  final String role;
  const _TeamMember({required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppTheme.forestGreen.withOpacity(0.15),
            child: Text(
              name[0],
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppTheme.forestGreen,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.charcoal,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                role,
                style: const TextStyle(fontSize: 12, color: AppTheme.softGray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _LinkTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppTheme.softGray, size: 20),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppTheme.charcoal,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: const TextStyle(fontSize: 12, color: AppTheme.softGray)),
          const SizedBox(width: 6),
          const Icon(Icons.open_in_new, size: 14, color: AppTheme.softGray),
        ],
      ),
    );
  }
}