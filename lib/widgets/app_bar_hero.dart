import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A reusable hero section used at the top of the Home tab.
/// Shows a background image (or gradient fallback), a top bar with logo
/// and notifications, a greeting with the user's name, and a search bar.
class AppBarHero extends StatelessWidget {
  final String name;
  final String greeting;
  final String? backgroundAsset;
  final int notificationCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onSearchTap;

  const AppBarHero({
    super.key,
    required this.name,
    required this.greeting,
    this.backgroundAsset,
    this.notificationCount = 0,
    this.onNotificationTap,
    this.onFilterTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── BACKGROUND ──
          _Background(asset: backgroundAsset),

          // ── GRADIENT OVERLAY ──
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x99000000),
                  Color(0x55000000),
                  Color(0x22000000),
                  Color(0x00000000),
                ],
              ),
            ),
          ),

          // ── CONTENT ──
          Column(
            children: [
              // Top bar (safe area aware)
              SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      // Logo + name
                      const Icon(Icons.explore, color: Colors.white, size: 24),
                      const SizedBox(width: 8),
                      const Text(
                        'ORC SUSL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                      const Spacer(),
                      // Notification bell
                      GestureDetector(
                        onTap: onNotificationTap,
                        child: Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            if (notificationCount > 0)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.forestGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      notificationCount > 9
                                          ? '9+'
                                          : '$notificationCount',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Greeting + search
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$greeting,',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '$name!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Ready for today's outdoor learning adventure?",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Search row
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: onSearchTap,
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 14),
                                  Icon(Icons.search,
                                      color: Colors.grey.shade400, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Search lessons, gear, or tips...',
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: onFilterTap,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(Icons.tune,
                                color: Colors.grey.shade600, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Background layer — tries to load an asset image,
/// falls back to a deep green gradient if the asset is missing.
class _Background extends StatelessWidget {
  final String? asset;
  const _Background({this.asset});

  @override
  Widget build(BuildContext context) {
    if (asset == null) return const _FallbackGradient();

    return Image.asset(
      asset!,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      errorBuilder: (_, __, ___) => const _FallbackGradient(),
    );
  }
}

class _FallbackGradient extends StatelessWidget {
  const _FallbackGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1B4332),
            Color(0xFF2D6A4F),
            Color(0xFF40916C),
          ],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.landscape_outlined,
          color: Colors.white24,
          size: 80,
        ),
      ),
    );
  }
}