import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
          style: TextStyle(
            color: AppTheme.charcoal,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _PolicyHeader(
            title: 'Your Privacy Matters',
            subtitle: 'Last updated: June 2025',
          ),
          SizedBox(height: 20),
          _PolicySection(
            title: '1. Information We Collect',
            content:
                'We collect information you provide directly to us, such as when you create an account, update your profile, or contact us for support. This includes your name, email address, and any other information you choose to provide.\n\nWe also automatically collect certain information about your device and how you interact with our services, including usage data, log files, and device identifiers.',
          ),
          _PolicySection(
            title: '2. How We Use Your Information',
            content:
                'We use the information we collect to provide, maintain, and improve our services, personalize your experience, send you technical notices and support messages, and respond to your comments and questions.\n\nWe do not sell, trade, or rent your personal information to third parties without your consent.',
          ),
          _PolicySection(
            title: '3. Data Storage & Security',
            content:
                'Your data is stored securely using Firebase services provided by Google. We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.\n\nAll data transmissions are encrypted using SSL/TLS protocols.',
          ),
          _PolicySection(
            title: '4. Cookies & Tracking',
            content:
                'Our app does not use traditional web cookies. We may use similar technologies such as local storage and device identifiers to maintain session information and preferences.',
          ),
          _PolicySection(
            title: '5. Third-Party Services',
            content:
                'We use Firebase Authentication and Firebase Analytics which are services by Google. These services have their own privacy policies that govern the use of information we send them. We encourage you to review Google\'s Privacy Policy.',
          ),
          _PolicySection(
            title: '6. Your Rights',
            content:
                'You have the right to access, update, or delete your personal information at any time through your profile settings. You may also request a copy of the data we hold about you by contacting us at privacy@orcapp.com.',
          ),
          _PolicySection(
            title: '7. Children\'s Privacy',
            content:
                'Our services are not directed to children under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that a child under 13 has provided us with personal information, we will take steps to delete such information.',
          ),
          _PolicySection(
            title: '8. Changes to This Policy',
            content:
                'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy in the app and updating the "Last updated" date. Your continued use of the app after changes constitutes acceptance of the updated policy.',
          ),
          _PolicySection(
            title: '9. Contact Us',
            content:
                'If you have any questions about this Privacy Policy or our data practices, please contact us at:\n\nEmail: privacy@orcapp.com\nAddress: ORC App, Sri Lanka',
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _PolicyHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PolicyHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.forestGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.privacy_tip_outlined, color: Colors.white, size: 36),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
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

class _PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const _PolicySection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
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
          const SizedBox(height: 8),
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
    );
  }
}