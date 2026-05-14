import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController _bgController;
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _particleController;

  late Animation<double> _bgAnimation;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<Offset> _taglineSlide;
  late Animation<double> _taglineOpacity;
  late Animation<double> _particleAnimation;

  @override
  void initState() {
    super.initState();

    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _bgAnimation = CurvedAnimation(parent: _bgController, curve: Curves.easeOut);
    _logoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );
    _taglineSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));
    _taglineOpacity = Tween<double>(begin: 0, end: 1).animate(_textController);
    _particleAnimation = CurvedAnimation(parent: _particleController, curve: Curves.linear);

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _bgController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 600));
    _textController.forward();
    await Future.delayed(const Duration(seconds: 3));
    _navigateNext();
  }

  void _navigateNext() {
    final user = FirebaseAuth.instance.currentUser;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            user != null ? const HomeScreen() : const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _bgAnimation, _logoController, _textController, _particleAnimation
        ]),
        builder: (context, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // ── Gradient Background ──
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1B4332),
                      Color(0xFF2D6A4F),
                      Color(0xFF40916C),
                      Color(0xFF1B4332),
                    ],
                    stops: [0.0, 0.35, 0.65, 1.0],
                  ),
                ),
              ),

              // ── Animated Circles (nature rings) ──
              ..._buildNatureRings(),

              // ── Mountain Silhouette ──
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: _bgAnimation.value * 0.35,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 200),
                    painter: _MountainPainter(),
                  ),
                ),
              ),

              // ── Floating Particles ──
              ..._buildParticles(context),

              // ── Main Content ──
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo circle
                    ScaleTransition(
                      scale: _logoScale,
                      child: FadeTransition(
                        opacity: _logoOpacity,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                            child: _ORCLogo(),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // App Name
                    FadeTransition(
                      opacity: _logoOpacity,
                      child: const Text(
                        'ORC SUSL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 6,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Tagline
                    SlideTransition(
                      position: _taglineSlide,
                      child: FadeTransition(
                        opacity: _taglineOpacity,
                        child: Column(
                          children: [
                            Text(
                              'Outdoor Recreation Center',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppTheme.accentGold.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppTheme.accentGold.withOpacity(0.5),
                                ),
                              ),
                              child: const Text(
                                'SUSUL YOUR LIFE',
                                style: TextStyle(
                                  color: AppTheme.accentGold,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    // Loading dots
                    FadeTransition(
                      opacity: _taglineOpacity,
                      child: _LoadingDots(),
                    ),

                    const SizedBox(height: 16),

                    FadeTransition(
                      opacity: _taglineOpacity,
                      child: Text(
                        'Co-funded by the Erasmus+ Programme',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildNatureRings() {
    return [
      Positioned(
        top: -80,
        right: -80,
        child: Opacity(
          opacity: 0.08 * _bgAnimation.value,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: -100,
        left: -60,
        child: Opacity(
          opacity: 0.06 * _bgAnimation.value,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.accentGold, width: 1),
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildParticles(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = _particleAnimation.value;
    final particles = [
      _ParticleData(0.15, 0.3, 6, AppTheme.lightGreen),
      _ParticleData(0.8, 0.15, 4, Colors.white),
      _ParticleData(0.7, 0.7, 5, AppTheme.accentGold),
      _ParticleData(0.2, 0.75, 3, AppTheme.skyBlue),
      _ParticleData(0.5, 0.2, 4, Colors.white),
      _ParticleData(0.9, 0.5, 3, AppTheme.lightGreen),
    ];

    return particles.map((p) {
      final yOffset = (((t + p.phase) % 1.0) - 0.5) * 40;
      return Positioned(
        left: p.x * size.width,
        top: p.y * size.height + yOffset,
        child: Opacity(
          opacity: 0.4 * _bgAnimation.value,
          child: Container(
            width: p.size,
            height: p.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: p.color,
            ),
          ),
        ),
      );
    }).toList();
  }
}

class _ParticleData {
  final double x, y, phase, size;
  final Color color;
  _ParticleData(this.x, this.y, this.size, this.color) : phase = x * 0.7;
}

class _MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.15, size.height * 0.2)
      ..lineTo(size.width * 0.28, size.height * 0.45)
      ..lineTo(size.width * 0.42, size.height * 0.05)
      ..lineTo(size.width * 0.55, size.height * 0.35)
      ..lineTo(size.width * 0.68, size.height * 0.15)
      ..lineTo(size.width * 0.82, size.height * 0.4)
      ..lineTo(size.width, size.height * 0.25)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ORCLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
          ),
        ),
        const Icon(Icons.explore, color: Colors.white, size: 44),
        Positioned(
          top: 14,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.accentGold,
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingDots extends StatefulWidget {
  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _anims;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (i) => AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    ));
    _anims = _controllers.map((c) =>
        Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: c, curve: Curves.easeInOut),
        )).toList();

    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) _controllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) => AnimatedBuilder(
        animation: _anims[i],
        builder: (_, __) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3 + 0.7 * _anims[i].value),
          ),
        ),
      )),
    );
  }
}