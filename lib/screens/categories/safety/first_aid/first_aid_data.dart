import 'package:flutter/material.dart';

class FirstAidCategory {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const FirstAidCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}

class FirstAidLesson {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final String duration;
  final String youtubeVideoId; // e.g. 'dQw4w9WgXcQ'
  final String introduction;
  final List<String> keyPoints;

  const FirstAidLesson({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.duration,
    required this.youtubeVideoId,
    required this.introduction,
    required this.keyPoints,
  });
}

class FirstAidData {
  // ── Categories ────────────────────────────────────────────
  static const List<FirstAidCategory> categories = [
    FirstAidCategory(
      id: 'water',
      title: 'Water Emergencies',
      subtitle: 'Drowning rescue, water safety & aquatic first aid.',
      icon: Icons.water_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    FirstAidCategory(
      id: 'air',
      title: 'Breathing & Airway',
      subtitle: 'CPR, choking response & rescue breathing.',
      icon: Icons.air_outlined,
      color: Color(0xFF0097A7),
      bgColor: Color(0xFFE0F7FA),
    ),
    FirstAidCategory(
      id: 'hiking',
      title: 'Hiking Injuries',
      subtitle: 'Blisters, sprains, fractures & trail emergencies.',
      icon: Icons.hiking_outlined,
      color: Color(0xFF2D6A4F),
      bgColor: Color(0xFFE8F5E9),
    ),
    FirstAidCategory(
      id: 'wounds',
      title: 'Wounds & Bleeding',
      subtitle: 'Cuts, abrasions, deep wounds & bleeding control.',
      icon: Icons.healing_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
    ),
    FirstAidCategory(
      id: 'burns',
      title: 'Burns & Heat',
      subtitle: 'Sunburn, heat stroke, fire burns & treatment.',
      icon: Icons.local_fire_department_outlined,
      color: Color(0xFFE64A19),
      bgColor: Color(0xFFFBE9E7),
    ),
    FirstAidCategory(
      id: 'bites',
      title: 'Bites & Stings',
      subtitle: 'Snake bites, insect stings & allergic reactions.',
      icon: Icons.pest_control_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
  ];

  // ── Lessons (one per category) ────────────────────────────
  static const List<FirstAidLesson> lessons = [
    FirstAidLesson(
      id: 'fa_water_1',
      categoryId: 'water',
      title: 'Water Emergency Response',
      description: 'How to respond to drowning and water-related emergencies safely and effectively.',
      duration: '9 min',
      youtubeVideoId: 'KMrDg4e8K9A', // Water rescue first aid
      introduction:
          'Water emergencies can happen in seconds. Whether you\'re at a river, lake, or pool, '
          'knowing how to respond can save a life. This lesson covers safe rescue techniques, '
          'what to do once a victim is out of the water, and how to perform CPR in aquatic contexts.',
      keyPoints: [
        'Never enter the water unless you are a trained rescue swimmer.',
        'Use the "Reach, Throw, Don\'t Go" method first.',
        'Check for breathing immediately after rescue.',
        'Call emergency services as soon as possible.',
        'Begin CPR if the victim is unresponsive and not breathing.',
      ],
    ),
    FirstAidLesson(
      id: 'fa_air_1',
      categoryId: 'air',
      title: 'CPR & Rescue Breathing',
      description: 'Master the fundamentals of CPR and how to open and maintain a clear airway.',
      duration: '11 min',
      youtubeVideoId: 'cosVnrcABSQ', // CPR tutorial
      introduction:
          'Cardiac arrest and choking are among the most time-critical emergencies you can face outdoors. '
          'Early CPR can double or triple survival rates. Learn how to assess an unconscious person, '
          'deliver effective chest compressions, and provide rescue breaths until help arrives.',
      keyPoints: [
        'Check for responsiveness before starting CPR.',
        'Call 112/911 or send someone to call while you begin.',
        'Push hard and fast — at least 5 cm deep, 100–120 compressions per minute.',
        'Give 2 rescue breaths after every 30 compressions (30:2 ratio).',
        'Use an AED as soon as one is available.',
      ],
    ),
    FirstAidLesson(
      id: 'fa_hiking_1',
      categoryId: 'hiking',
      title: 'Trail Injury Management',
      description: 'Treating sprains, fractures, blisters and other common hiking injuries in the field.',
      duration: '8 min',
      youtubeVideoId: 'NMBPSbpvLaA', // Hiking first aid
      introduction:
          'Remote trails mean limited access to medical care. Knowing how to treat common injuries '
          'on the spot can prevent a minor problem from becoming a serious one. This lesson walks you '
          'through the most frequent hiking injuries and practical field treatments you can carry out '
          'with a standard first aid kit.',
      keyPoints: [
        'RICE method for sprains: Rest, Ice, Compression, Elevation.',
        'Improvise splints using trekking poles or sticks for fractures.',
        'Drain and dress blisters correctly to prevent infection.',
        'Recognise signs of altitude sickness and descend immediately.',
        'Always carry a personal first aid kit on any hike.',
      ],
    ),
    FirstAidLesson(
      id: 'fa_wounds_1',
      categoryId: 'wounds',
      title: 'Wound Care & Bleeding Control',
      description: 'How to clean wounds, control bleeding, and prevent infection outdoors.',
      duration: '7 min',
      youtubeVideoId: 'AKQkMBhxrBc', // Wound care
      introduction:
          'Uncontrolled bleeding is one of the leading causes of preventable death in outdoor emergencies. '
          'Even a minor cut can become infected without proper care. This lesson teaches you how to '
          'apply pressure, use tourniquets correctly, clean and cover wounds, and identify when a wound '
          'requires professional medical attention.',
      keyPoints: [
        'Apply direct pressure with a clean cloth for at least 10 minutes.',
        'Do not remove embedded objects — stabilise them in place.',
        'Clean wounds with clean water; avoid hydrogen peroxide on deep wounds.',
        'Cover with a sterile dressing and change daily.',
        'Use a tourniquet only for severe limb bleeding that cannot be controlled.',
      ],
    ),
    FirstAidLesson(
      id: 'fa_burns_1',
      categoryId: 'burns',
      title: 'Burns & Heat Emergencies',
      description: 'Treating burns, heat exhaustion and heat stroke in outdoor settings.',
      duration: '8 min',
      youtubeVideoId: '6kIfLJl3BiE', // Burns first aid
      introduction:
          'Heat-related illnesses and burns are common outdoor hazards. Heat stroke is a life-threatening '
          'condition that requires immediate cooling. This lesson explains how to classify burns by '
          'severity, what to do (and what NOT to do) when treating them, and how to recognise and '
          'respond to heat exhaustion and heat stroke.',
      keyPoints: [
        'Cool burns under cool running water for at least 20 minutes.',
        'Do NOT use ice, butter, or toothpaste on burns.',
        'Cover burns loosely with a clean, non-fluffy dressing.',
        'For heat stroke: move to shade, cool the body, call emergency services.',
        'Keep the person hydrated with water or electrolyte drinks for heat exhaustion.',
      ],
    ),
    FirstAidLesson(
      id: 'fa_bites_1',
      categoryId: 'bites',
      title: 'Bites, Stings & Allergic Reactions',
      description: 'First aid for snake bites, insect stings, bee stings and anaphylaxis.',
      duration: '10 min',
      youtubeVideoId: 'xJbSAHFd_Bc', // Snake bite first aid
      introduction:
          'Encounters with wildlife are part of the outdoor experience, but some can be dangerous. '
          'Knowing how to respond to a snake bite, severe allergic reaction, or swarm of bee stings '
          'could be the difference between life and death. This lesson covers practical steps for '
          'every common biting and stinging scenario you might face in nature.',
      keyPoints: [
        'Keep the victim calm and still — movement spreads venom faster.',
        'Do NOT cut, suck, or tourniquet a snake bite.',
        'Remove bee stingers by scraping sideways, not pinching.',
        'Use an EpiPen immediately if anaphylaxis is suspected.',
        'Mark the time of the bite and describe the animal to medical staff.',
      ],
    ),
  ];

  static FirstAidLesson? lessonForCategory(String categoryId) {
    try {
      return lessons.firstWhere((l) => l.categoryId == categoryId);
    } catch (_) {
      return null;
    }
  }
}