import 'package:flutter/material.dart';
import '../safety_topic_model.dart';

class RiskManagementData {
  // ── Categories ────────────────────────────────────────────
  static const List<SafetyCategory> categories = [
    SafetyCategory(
      id: 'stop_method',
      title: 'The STOP Principle',
      subtitle: 'Stop, Think, Observe, Plan — the foundation of survival.',
      icon: Icons.pause_circle_outline,
      color: Color(0xFFFBC02D),
      bgColor: Color(0xFFFFFDE7),
    ),
    SafetyCategory(
      id: 'hazard_id',
      title: 'Hazard Identification',
      subtitle: 'Spot dangers before they turn into emergencies.',
      icon: Icons.search_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    SafetyCategory(
      id: 'trip_planning',
      title: 'Trip Planning & Preparation',
      subtitle: 'Pre-trip checklists, route plans, and emergency contacts.',
      icon: Icons.checklist_outlined,
      color: Color(0xFF2E7D32),
      bgColor: Color(0xFFE8F5E9),
    ),
    SafetyCategory(
      id: 'weather_risk',
      title: 'Weather Risk Assessment',
      subtitle: 'Make go/no-go decisions based on conditions.',
      icon: Icons.cloud_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    SafetyCategory(
      id: 'group_safety',
      title: 'Group Safety Management',
      subtitle: 'Leadership, communication, and team safety protocols.',
      icon: Icons.group_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
    SafetyCategory(
      id: 'emergency_plans',
      title: 'Emergency Action Plans',
      subtitle: 'What to do when things go wrong in the field.',
      icon: Icons.emergency_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
    ),
  ];

  // ── Lessons (one per category) ────────────────────────────
  static const List<SafetyLesson> lessons = [
    SafetyLesson(
      id: 'rm_stop_1',
      categoryId: 'stop_method',
      title: 'The STOP Principle in Survival',
      description:
          'How the STOP method — Stop, Think, Observe, Plan — prevents panic and leads to better decisions in emergencies.',
      duration: '7 min',
      youtubeVideoId: 'ZNuXWgOv7io', // STOP survival method explained
      introduction:
          'In any outdoor emergency, the biggest enemy is panic. The STOP method is a proven psychological '
          'framework used by wilderness survival experts worldwide to slow down, assess the situation, and '
          'make rational decisions under pressure. Panic burns precious energy, leads to poor choices, '
          'and can transform a manageable situation into a fatal one. By deliberately following STOP, '
          'you override the panic response and keep your mind clear and your actions purposeful.',
      keyPoints: [
        'S — Stop: Sit down immediately. Do not keep moving when you are lost, injured, or unsure.',
        'T — Think: What are your immediate dangers? What resources — food, water, shelter, signaling — do you have?',
        'O — Observe: Look around carefully. Where is shelter, water, high ground? What direction is the wind blowing?',
        'P — Plan: Choose ONE clear, simple action. Tell others your plan before you act on it.',
        'Revisit STOP every time the situation changes significantly — do not just act once and forget the framework.',
      ],
    ),
    SafetyLesson(
      id: 'rm_hazard_1',
      categoryId: 'hazard_id',
      title: 'Outdoor Hazard Identification',
      description:
          'Recognising environmental, terrain, weather, and human hazards before they cause harm.',
      duration: '9 min',
      youtubeVideoId: 'QdF6-u2XNMQ', // Hazard identification outdoors
      introduction:
          'The best way to manage risk is to identify hazards before they become emergencies. '
          'Outdoors hazards fall into four broad categories: environmental (rockfall, flooding), '
          'terrain (steep slopes, unstable river crossings), weather (lightning, flash floods, hypothermia), '
          'and human factors (fatigue, poor decisions, inadequate gear). Learning to spot these categories '
          'early allows you to take preventive action rather than being forced into reactive, high-stakes choices.',
      keyPoints: [
        'Environmental hazards: unstable rocks, dead overhead trees (widow-makers), rising water, soft snow.',
        'Terrain hazards: cliff edges, river crossings, loose scree slopes, and avalanche runout zones.',
        'Weather hazards: lightning (leave ridges and summits when thunderstorms build nearby), flash floods, wind chill.',
        'Human hazards: fatigue impairs judgment — schedule rest breaks every 45–60 minutes on long days.',
        'Use the "what if" question constantly: "What if the weather changes? What if someone gets injured here?"',
      ],
    ),
    SafetyLesson(
      id: 'rm_planning_1',
      categoryId: 'trip_planning',
      title: 'Trip Planning & Pre-Departure Checklist',
      description:
          'How to plan a safe outdoor trip — route cards, emergency contacts, gear checks, and turnaround points.',
      duration: '10 min',
      youtubeVideoId: 'iZUUPrjOJiU', // Outdoor trip planning and preparation
      introduction:
          'Good planning is the single most powerful risk management tool you have access to. '
          'The majority of outdoor emergencies are preventable through thorough pre-trip preparation. '
          'This includes researching your route in detail, checking multi-source weather forecasts, '
          'filing a trip plan with a trusted contact at home, verifying that every member of the group '
          'carries appropriate gear for the conditions, and — critically — setting clear turnaround '
          'times and committing to them before you leave, not on the hill.',
      keyPoints: [
        'Leave a trip plan with someone at home: exact route, expected return time, and who to call if you are overdue.',
        'Research the route thoroughly — topographic maps, known hazards, water sources, and emergency escape routes.',
        'Check weather forecasts from at least two independent sources for the 48-hour window of your trip.',
        'Set a turnaround time before departing and honour it regardless of how close the summit or destination feels.',
        'The Ten Essentials: navigation tools, sun protection, insulation layers, illumination, first aid kit, fire-starting, repair tools, nutrition, hydration, and emergency shelter.',
      ],
    ),
    SafetyLesson(
      id: 'rm_weather_1',
      categoryId: 'weather_risk',
      title: 'Weather Risk Assessment',
      description:
          'Reading weather patterns, understanding terrain effects, and making confident go/no-go decisions in the field.',
      duration: '9 min',
      youtubeVideoId: 'p3vEJkNPSQ4', // Mountain and outdoor weather risk
      introduction:
          'Weather is the single most common contributing factor in outdoor emergencies worldwide. '
          'The ability to read weather signs, understand how terrain shapes local conditions, and make '
          'conservative go/no-go decisions can be the difference between a great adventure and a tragedy. '
          'Mountain weather in particular can change within minutes — conditions on an exposed summit '
          'may be drastically different from what you see at the trailhead car park. '
          'Developing weather literacy is a skill that takes years of practice, but the basics can be learned quickly.',
      keyPoints: [
        'Cumulonimbus (anvil-shaped) clouds signal imminent thunderstorm. Lenticular clouds indicate strong winds aloft.',
        'The 30-30 rule: if thunder follows lightning in 30 seconds or less, seek shelter; wait 30 minutes after the last thunder before resuming activity.',
        'Wind speed increases significantly with altitude — double the valley wind speed for exposed ridgelines.',
        'Wet conditions dramatically lower the hypothermia threshold — 10°C with rain and wind can be life-threatening.',
        'When in doubt, turn around. No summit is worth your life — the route will still be there another day.',
      ],
    ),
    SafetyLesson(
      id: 'rm_group_1',
      categoryId: 'group_safety',
      title: 'Group Safety & Leadership',
      description:
          'How to manage group dynamics, communication, and collective decision-making to keep everyone safe outdoors.',
      duration: '8 min',
      youtubeVideoId: '6FeJJ7YKBCE', // Group outdoor leadership and safety
      introduction:
          'Groups face unique safety challenges that solo travellers do not encounter. Pressure to keep '
          'up with faster members, social reluctance to voice safety concerns, and ambiguous leadership '
          'can all lead to dangerous situations. Effective group safety requires a designated leader, '
          'open communication, and a genuine culture where any participant can call a halt without '
          'embarrassment or judgment. In outdoor education this is often called the "challenge by choice" '
          'principle — the freedom to stop is as important as the freedom to push forward.',
      keyPoints: [
        'Designate a clear leader AND a sweep (tail-end Charlie) — nobody moves faster than the sweep.',
        'Establish a turnaround time together before departure and treat it as a binding group decision.',
        'Create a culture where any member can say "I am not comfortable" and the group listens without judgment.',
        'Set meeting points at regular intervals so that if someone falls behind, everyone knows exactly where to wait.',
        'Brief the entire group on emergency procedures: who carries the first aid kit, who has the emergency contact number.',
      ],
    ),
    SafetyLesson(
      id: 'rm_emergency_1',
      categoryId: 'emergency_plans',
      title: 'Emergency Action Plans',
      description:
          'Step-by-step protocols for responding effectively to emergencies in the outdoors.',
      duration: '10 min',
      youtubeVideoId: 'BELkRkVoetA', // Emergency action planning outdoors
      introduction:
          'An Emergency Action Plan (EAP) is a pre-thought-out response framework that guides your '
          'actions when time is critical and stress is high. In a genuine emergency, adrenaline and '
          'cognitive load impair decision-making dramatically. Having a practiced plan means you act '
          'instead of freeze. The core framework is: Scene safety first — patient assessment — '
          'call for help — provide care — prepare for evacuation. This sequence should be second nature '
          'for any group leader before departing on a trip.',
      keyPoints: [
        '1. Scene Safety: Is it safe to approach? Hazard control first — never create a second victim.',
        '2. Assess: Is the patient responsive? Are they breathing? Is there obvious life-threatening bleeding?',
        '3. Send for help: Dispatch the fittest person with the GPS location, nature of emergency, and a contact number.',
        '4. Provide care: Manage ABCs — Airway, Breathing, Circulation — and keep the patient warm and still.',
        '5. Prepare for evacuation: Gather all group gear, note GPS coordinates, and mark the location visibly for rescuers.',
      ],
    ),
  ];

  static SafetyLesson? lessonForCategory(String categoryId) {
    try {
      return lessons.firstWhere((l) => l.categoryId == categoryId);
    } catch (_) {
      return null;
    }
  }
}
