import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _isLoading = true; _errorMessage = null; });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = _getErrorMessage(e.code);
      });
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() { _isLoading = true; _errorMessage = null; });
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) { setState(() => _isLoading = false); return; }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _getErrorMessage(e.code));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found': return 'No account found with this email.';
      case 'wrong-password': return 'Incorrect password. Please try again.';
      case 'invalid-email': return 'Invalid email address.';
      case 'user-disabled': return 'This account has been disabled.';
      case 'too-many-requests': return 'Too many attempts. Try later.';
      default: return 'Sign in failed. Please try again.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE8F5E9), Color(0xFFF1F8F4), Colors.white],
              ),
            ),
          ),

          // Top decorative blobs
          Positioned(
            top: -60,
            left: -40,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.forestGreen.withOpacity(0.08),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: -30,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.accentGold.withOpacity(0.1),
              ),
            ),
          ),

          // Scrollable content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 24),

                        // Logos row
                        _LogosRow(),

                        const SizedBox(height: 36),

                        // ORC Logo
                        Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [AppTheme.forestGreen, AppTheme.deepGreen],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.forestGreen.withOpacity(0.35),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.explore, color: Colors.white, size: 48),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Center(
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.charcoal,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Center(
                          child: Text(
                            'Sign in to continue your outdoor\nlearning journey',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.softGray,
                              height: 1.5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Email field
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined,
                                color: AppTheme.softGray),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Enter your email';
                            if (!v.contains('@')) return 'Enter a valid email';
                            return null;
                          },
                        ),

                        const SizedBox(height: 14),

                        // Password field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: AppTheme.softGray),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppTheme.softGray,
                              ),
                              onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Enter your password';
                            if (v.length < 6) return 'Min 6 characters';
                            return null;
                          },
                        ),

                        const SizedBox(height: 8),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _showForgotPassword,
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppTheme.forestGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        // Error message
                        if (_errorMessage != null) ...[
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.error_outline,
                                    color: Colors.red, size: 18),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        // Sign In button
                        ElevatedButton(
                          onPressed: _isLoading ? null : _signIn,
                          child: _isLoading
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text('Sign In'),
                        ),

                        const SizedBox(height: 20),

                        // Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey.shade300)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text('OR',
                                  style: TextStyle(
                                      color: Colors.grey.shade500, fontSize: 12)),
                            ),
                            Expanded(child: Divider(color: Colors.grey.shade300)),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Google Sign In
                        _SocialButton(
                          onTap: _isLoading ? null : _signInWithGoogle,
                          icon: _GoogleIcon(),
                          label: 'Continue with Google',
                        ),

                        const SizedBox(height: 28),

                        // Sign Up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(color: AppTheme.softGray)),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const RegisterScreen()),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: AppTheme.forestGreen,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showForgotPassword() {
    final emailCtrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 24, right: 24, top: 24,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Reset Password',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Enter your email to receive a reset link.'),
            const SizedBox(height: 16),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailCtrl.text.trim());
                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Reset email sent! Check your inbox.')),
                    );
                  }
                } catch (_) {}
              },
              child: const Text('Send Reset Email'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final String label;

  const _SocialButton({
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE0E0E0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 12),
            Text(label,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('G',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ));
  }
}

class _LogosRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.school, color: AppTheme.forestGreen, size: 28),
        const SizedBox(width: 8),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Co-funded by the',
                style: TextStyle(fontSize: 9, color: AppTheme.softGray)),
            Text('Erasmus+ Programme',
                style: TextStyle(
                    fontSize: 9,
                    color: AppTheme.softGray,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(width: 12),
        Container(width: 1, height: 28, color: Colors.grey.shade300),
        const SizedBox(width: 12),
        const Icon(Icons.explore, color: AppTheme.forestGreen, size: 28),
        const SizedBox(width: 4),
        const Text('ORC SUSL',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: AppTheme.deepGreen,
                letterSpacing: 1)),
      ],
    );
  }
}
