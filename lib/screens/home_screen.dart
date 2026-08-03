import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'emergency_call_screen.dart';
import 'tabs/home_tab.dart';
import 'tabs/my_learning_tab.dart';
import 'tabs/explore_tab.dart';
import 'tabs/progress_tab.dart';
import 'tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    MyLearningTab(),
    ExploreTab(),
    ProgressTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmergencyCallScreen()),
        ),
        backgroundColor: Colors.red,
        shape: const StadiumBorder(),
        icon: const Icon(Icons.phone),
        label: const Text('Emergency'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}