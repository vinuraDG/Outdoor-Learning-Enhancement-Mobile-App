import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orc_app/screens/profile/screens/about_us_screen.dart';
import 'package:orc_app/screens/profile/screens/edit_profile_screen.dart';
import 'package:orc_app/screens/profile/screens/help_support_screen.dart';
import 'package:orc_app/screens/profile/screens/privacy_policy_screen.dart';
import '../../theme/app_theme.dart';
import '../../services/auth_service.dart';
import '../login_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: AppTheme.forestGreen,
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : null,
                      child: user?.photoURL == null
                          ? Text(
                              (user?.displayName ?? 'U')[0].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user?.displayName ?? 'Explorer',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.charcoal,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user?.email ?? '',
                      style: const TextStyle(color: AppTheme.softGray, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Sri Lanka',
                      style: TextStyle(color: AppTheme.softGray, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Account section
              _SectionLabel(label: 'Account'),
              _ProfileTile(
                icon: Icons.person_outline,
                label: 'Edit Profile',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                ),
              ),
              _ProfileTile(
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () {
                  // TODO: Navigate to Settings screen
                },
              ),
              _ProfileTile(
                icon: Icons.notifications_outlined,
                label: 'Notifications',
                onTap: () {
                  // TODO: Navigate to Notifications screen
                },
              ),
              _ProfileTile(
                icon: Icons.privacy_tip_outlined,
                label: 'Privacy Policy',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
                ),
              ),

              const SizedBox(height: 8),

              // Support section
              _SectionLabel(label: 'Support'),
              _ProfileTile(
                icon: Icons.help_outline,
                label: 'Help & Support',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpSupportScreen()),
                ),
              ),
              _ProfileTile(
                icon: Icons.info_outline,
                label: 'About Us',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                ),
              ),

              const SizedBox(height: 8),

              // Sign out
              _ProfileTile(
                icon: Icons.logout,
                label: 'Log Out',
                onTap: () async {
                  await AuthService.signOut();
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (route) => false,
                    );
                  }
                },
                isDestructive: true,
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.softGray,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : AppTheme.charcoal;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 6),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, color: color, size: 22),
        title: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        trailing: isDestructive
            ? null
            : const Icon(Icons.chevron_right, color: AppTheme.softGray, size: 20),
      ),
    );
  }
}