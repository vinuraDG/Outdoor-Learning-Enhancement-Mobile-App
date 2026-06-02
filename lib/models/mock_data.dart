import 'package:flutter/material.dart';
import 'lesson_model.dart';

class MockData {
  // ─── CATEGORIES ───────────────────────────────────────────
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'safety',
      name: 'Safety',
      description: 'Learn safety skills, watch lessons and stay prepared.',
      icon: Icons.verified_user_outlined,
      color: Color(0xFF2D6A4F),
      bgColor: Color(0xFFE8F5E9),
    ),
    CategoryModel(
      id: 'equipment',
      name: 'Equipment',
      description: 'Explore and review outdoor gear for better decisions.',
      icon: Icons.backpack_outlined,
      color: Color(0xFF0097A7),
      bgColor: Color(0xFFE0F7FA),
    ),
    CategoryModel(
      id: 'navigation',
      name: 'Navigation',
      description: 'Master maps, compass and GPS skills for any adventure.',
      icon: Icons.map_outlined,
      color: Color(0xFF2E7D32),
      bgColor: Color(0xFFE8F5E9),
    ),
    CategoryModel(
      id: 'weather',
      name: 'Weather',
      description: 'Check weather updates and learn how to adapt.',
      icon: Icons.wb_sunny_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFFDE7),
    ),
    CategoryModel(
      id: 'learn',
      name: 'Learn',
      description: 'Access guides, articles and tips to improve outdoor knowledge.',
      icon: Icons.menu_book_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    CategoryModel(
      id: 'community',
      name: 'Community',
      description: 'Connect with fellow learners and share experiences.',
      icon: Icons.group_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
  ];

  // ─── SAFETY ITEMS ─────────────────────────────────────────
  static const List<Map<String, dynamic>> safetyItems = [
    {'title': 'Basic First Aid', 'subtitle': 'Learn how to respond to common injuries.', 'icon': Icons.medical_services_outlined, 'color': Color(0xFFE53935)},
    {'title': 'Emergency Signals', 'subtitle': 'Understand how to signal for help.', 'icon': Icons.sos_outlined, 'color': Color(0xFFF57F17)},
    {'title': 'Risk Management', 'subtitle': 'Identify risks and learn how to avoid them.', 'icon': Icons.warning_amber_outlined, 'color': Color(0xFFFBC02D)},
    {'title': 'Wildlife Safety', 'subtitle': 'Stay safe around animals in the wild.', 'icon': Icons.pets_outlined, 'color': Color(0xFF2D6A4F)},
    {'title': 'Fire Safety', 'subtitle': 'Learn how to handle fire safely outdoors.', 'icon': Icons.local_fire_department_outlined, 'color': Color(0xFFE64A19)},
  ];

  // ─── EQUIPMENT ITEMS ──────────────────────────────────────
  static const List<Map<String, dynamic>> equipmentItems = [
    {'title': 'Backpacks', 'subtitle': 'Choose the right backpack for your trip.', 'icon': Icons.backpack_outlined, 'color': Color(0xFF0097A7)},
    {'title': 'Tents & Shelters', 'subtitle': 'Learn about different types of shelters.', 'icon': Icons.cabin_outlined, 'color': Color(0xFF2D6A4F)},
    {'title': 'Clothing', 'subtitle': 'Dress smart for the outdoors.', 'icon': Icons.checkroom_outlined, 'color': Color(0xFF1565C0)},
    {'title': 'Cooking Gear', 'subtitle': 'Essential gear for outdoor cooking.', 'icon': Icons.outdoor_grill_outlined, 'color': Color(0xFFF57F17)},
    {'title': 'Tools & Accessories', 'subtitle': 'Must-have tools for every adventure.', 'icon': Icons.build_outlined, 'color': Color(0xFF6A1B9A)},
  ];

  // ─── NAVIGATION ITEMS ─────────────────────────────────────
  static const List<Map<String, dynamic>> navigationItems = [
    {'title': 'Map Reading', 'subtitle': 'Learn how to read topographic maps.', 'icon': Icons.map_outlined, 'color': Color(0xFF2E7D32)},
    {'title': 'Compass Skills', 'subtitle': 'Navigate using a compass effectively.', 'icon': Icons.explore_outlined, 'color': Color(0xFF1565C0)},
    {'title': 'GPS Basics', 'subtitle': 'Understand GPS and how to use it.', 'icon': Icons.gps_fixed_outlined, 'color': Color(0xFF0097A7)},
    {'title': 'Route Planning', 'subtitle': 'Plan your route and stay on track.', 'icon': Icons.alt_route_outlined, 'color': Color(0xFFF57F17)},
    {'title': 'Landmarks', 'subtitle': 'Use natural clues to navigate.', 'icon': Icons.landscape_outlined, 'color': Color(0xFF6A1B9A)},
  ];

  // ─── WEATHER ITEMS ────────────────────────────────────────
  static const List<Map<String, dynamic>> weatherItems = [
    {'title': 'Weather Updates', 'subtitle': 'Check the latest forecasts.', 'icon': Icons.cloud_outlined, 'color': Color(0xFF1565C0)},
    {'title': 'Weather Safety', 'subtitle': 'Learn how to stay safe in extreme weather.', 'icon': Icons.umbrella_outlined, 'color': Color(0xFFE53935)},
    {'title': 'Seasonal Tips', 'subtitle': 'Prepare for different seasons and conditions.', 'icon': Icons.ac_unit_outlined, 'color': Color(0xFF0097A7)},
  ];

  // ─── LEARN ITEMS ──────────────────────────────────────────
  static const List<Map<String, dynamic>> learnItems = [
    {'title': 'Guides', 'subtitle': 'In-depth outdoor guides and tutorials.', 'icon': Icons.book_outlined, 'color': Color(0xFF1565C0)},
    {'title': 'Articles', 'subtitle': 'Read expert tips and outdoor stories.', 'icon': Icons.article_outlined, 'color': Color(0xFF2D6A4F)},
    {'title': 'Tips & Tricks', 'subtitle': 'Quick tips to improve your skills.', 'icon': Icons.tips_and_updates_outlined, 'color': Color(0xFFF57F17)},
    {'title': 'Videos', 'subtitle': 'Watch and learn from instructional videos.', 'icon': Icons.play_circle_outline, 'color': Color(0xFFE53935)},
    {'title': 'Quizzes', 'subtitle': 'Test your knowledge and track improvement.', 'icon': Icons.quiz_outlined, 'color': Color(0xFF6A1B9A)},
  ];

  // ─── COMMUNITY ITEMS ──────────────────────────────────────
  static const List<CommunityItem> communityItems = [
    CommunityItem(id: 'discussions', title: 'Discussions', subtitle: 'Join conversations and share your thoughts.', icon: Icons.forum_outlined, color: Color(0xFF6A1B9A)),
    CommunityItem(id: 'trip_stories', title: 'Trip Stories', subtitle: 'Read and share adventure stories.', icon: Icons.auto_stories_outlined, color: Color(0xFF2D6A4F)),
    CommunityItem(id: 'events', title: 'Events', subtitle: 'Find and join outdoor events.', icon: Icons.event_outlined, color: Color(0xFF0097A7)),
    CommunityItem(id: 'find_partners', title: 'Find Partners', subtitle: 'Connect with adventure partners.', icon: Icons.people_outline, color: Color(0xFFF57F17)),
  ];

  // ─── LESSONS ──────────────────────────────────────────────
  static const List<LessonModel> lessons = [
    LessonModel(
      id: 'l1',
      title: 'How to Tie a Figure-8 Knot',
      categoryId: 'safety',
      categoryName: 'Safety',
      categoryColor: Color(0xFF2D6A4F),
      duration: '8 min',
      progress: 0.6,
      description: 'Learn how to tie a figure-8 knot, a strong and reliable knot used in climbing and rescue.',
      sections: [
        LessonSection(title: 'Introduction', duration: '1:23'),
        LessonSection(title: 'Step-by-Step Instructions', duration: '4:45'),
        LessonSection(title: 'Common Mistakes', duration: '2:10'),
        LessonSection(title: 'Practice Activity', duration: '3:30'),
      ],
    ),
    LessonModel(
      id: 'l2',
      title: 'Reading Topographic Maps',
      categoryId: 'navigation',
      categoryName: 'Navigation',
      categoryColor: Color(0xFF2E7D32),
      duration: '12 min',
      progress: 0.3,
      description: 'Master the skill of reading topographic maps to navigate safely in the outdoors.',
      sections: [
        LessonSection(title: 'What is a Topo Map?', duration: '2:00'),
        LessonSection(title: 'Contour Lines Explained', duration: '3:30'),
        LessonSection(title: 'Finding Your Location', duration: '4:15'),
        LessonSection(title: 'Practice Exercise', duration: '2:45'),
      ],
    ),
    LessonModel(
      id: 'l3',
      title: 'Setting Up a Tent',
      categoryId: 'equipment',
      categoryName: 'Equipment',
      categoryColor: Color(0xFF0097A7),
      duration: '10 min',
      progress: 0.8,
      description: 'Learn how to set up a tent quickly and correctly in any outdoor condition.',
      sections: [
        LessonSection(title: 'Choosing Your Site', duration: '1:30'),
        LessonSection(title: 'Assembling the Tent', duration: '5:00'),
        LessonSection(title: 'Weatherproofing Tips', duration: '2:30'),
        LessonSection(title: 'Pack-Down Guide', duration: '1:00'),
      ],
    ),
    LessonModel(
      id: 'l4',
      title: 'Topographic Map Basics',
      categoryId: 'navigation',
      categoryName: 'Navigation',
      categoryColor: Color(0xFF2E7D32),
      duration: '9 min',
      progress: 0.45,
      description: 'An introduction to topographic maps and how to interpret them for navigation.',
      sections: [
        LessonSection(title: 'Map Symbols', duration: '2:00'),
        LessonSection(title: 'Scale and Distance', duration: '3:00'),
        LessonSection(title: 'Elevation Reading', duration: '4:00'),
      ],
    ),
    LessonModel(
      id: 'l5',
      title: 'Weather Awareness',
      categoryId: 'weather',
      categoryName: 'Weather',
      categoryColor: Color(0xFFF57F17),
      duration: '7 min',
      progress: 0.4,
      description: 'Learn to read weather signs and stay safe in changing conditions.',
      sections: [
        LessonSection(title: 'Cloud Types', duration: '2:00'),
        LessonSection(title: 'Storm Warning Signs', duration: '3:00'),
        LessonSection(title: 'Emergency Protocols', duration: '2:00'),
      ],
    ),
    LessonModel(
      id: 'l6',
      title: 'Leave No Trace Principles',
      categoryId: 'learn',
      categoryName: 'Learn',
      categoryColor: Color(0xFF1565C0),
      duration: '6 min',
      progress: 0.15,
      description: 'Understand the seven Leave No Trace principles for responsible outdoor ethics.',
      sections: [
        LessonSection(title: 'Why It Matters', duration: '1:30'),
        LessonSection(title: 'The 7 Principles', duration: '3:30'),
        LessonSection(title: 'Practical Application', duration: '1:00'),
      ],
    ),
  ];

  // ─── ACHIEVEMENTS ─────────────────────────────────────────
  static const List<AchievementModel> achievements = [
    AchievementModel(id: 'a1', title: 'First Aid Basics', status: 'completed', icon: Icons.medical_services_outlined, color: Color(0xFF2D6A4F)),
    AchievementModel(id: 'a2', title: 'Map Reading Basics', status: 'completed', icon: Icons.map_outlined, color: Color(0xFF2D6A4F)),
    AchievementModel(id: 'a3', title: 'Tent Setup', status: 'completed', icon: Icons.cabin_outlined, color: Color(0xFF2D6A4F)),
    AchievementModel(id: 'a4', title: 'Leave No Trace', status: 'completed', icon: Icons.eco_outlined, color: Color(0xFF2D6A4F)),
  ];

  // ─── PROGRESS STATS ───────────────────────────────────────
  static const Map<String, int> progressStats = {
    'completedLessons': 26,
    'inProgress': 8,
    'certificates': 3,
    'overallPercent': 65,
  };

  // ─── WEATHER DATA ─────────────────────────────────────────
  static const Map<String, dynamic> currentWeather = {
    'location': 'Current Location',
    'temperature': '22°C',
    'condition': 'Partly Cloudy',
    'wind': '12 km/h',
    'humidity': '68%',
    'rainChance': '20%',
  };
}