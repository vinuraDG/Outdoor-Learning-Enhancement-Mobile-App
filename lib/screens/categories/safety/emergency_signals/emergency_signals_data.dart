import 'package:flutter/material.dart';
import '../safety_topic_model.dart';

class EmergencySignalsData {
  // ── Categories ────────────────────────────────────────────
  static const List<SafetyCategory> categories = [
    SafetyCategory(
      id: 'signal_fire',
      title: 'Signal Fires & Smoke',
      subtitle: 'Create visible fire and smoke signals for aerial rescue.',
      icon: Icons.local_fire_department_outlined,
      color: Color(0xFFE64A19),
      bgColor: Color(0xFFFBE9E7),
    ),
    SafetyCategory(
      id: 'whistle',
      title: 'Whistle & Sound Signals',
      subtitle: 'International distress codes using a survival whistle.',
      icon: Icons.volume_up_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    SafetyCategory(
      id: 'mirror',
      title: 'Mirror & Reflective Signaling',
      subtitle: 'Use sunlight and reflective surfaces to signal rescuers.',
      icon: Icons.wb_sunny_outlined,
      color: Color(0xFFFBC02D),
      bgColor: Color(0xFFFFFDE7),
    ),
    SafetyCategory(
      id: 'ground_symbols',
      title: 'Ground-to-Air Symbols',
      subtitle: 'Patterns and symbols visible to rescue aircraft overhead.',
      icon: Icons.map_outlined,
      color: Color(0xFF2E7D32),
      bgColor: Color(0xFFE8F5E9),
    ),
    SafetyCategory(
      id: 'electronic',
      title: 'Electronic Distress Devices',
      subtitle: 'PLBs, EPIRBs, and satellite messengers for SOS.',
      icon: Icons.satellite_alt_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    SafetyCategory(
      id: 'night_signal',
      title: 'Night Signaling',
      subtitle: 'Flashlights, glow sticks and fire signals in the dark.',
      icon: Icons.nights_stay_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
  ];

  // ── Lessons (one per category) ────────────────────────────
  static const List<SafetyLesson> lessons = [
    SafetyLesson(
      id: 'es_fire_1',
      categoryId: 'signal_fire',
      title: 'Signal Fires & Smoke Signals',
      description:
          'How to build and sustain a visible fire or smoke column to attract rescue teams on land or in the air.',
      duration: '8 min',
      youtubeVideoId: 'v-dkLDdOvOI', // Survival signal fire technique
      introduction:
          'A signal fire is one of the oldest and most reliable methods of calling for rescue. '
          'The key is creating maximum visibility — a fire that produces thick white smoke during the day '
          'and a bright flame at night. Location is critical: always build your signal fire in an open '
          'clearing, ridgeline, or beach where it can be seen from the air or across large distances. '
          'Three fires arranged in a triangle is the internationally recognised distress signal.',
      keyPoints: [
        'The international distress signal is THREE fires in a triangle, spaced 25–30 m apart.',
        'Use green leaves, wet wood, or rubber to create thick white or black smoke visible from the air.',
        'Choose an open, elevated location — a hilltop, clearing, or beach is ideal.',
        'Keep tinder pre-laid and ready to ignite immediately when you hear aircraft.',
        'Never let your signal fire become uncontrolled — keep water or soil nearby at all times.',
      ],
    ),
    SafetyLesson(
      id: 'es_whistle_1',
      categoryId: 'whistle',
      title: 'Whistle & Sound Distress Signals',
      description:
          'Master the universal whistle distress code and other sound-based signaling methods for rescue situations.',
      duration: '6 min',
      youtubeVideoId: 'FSXrfaGSUhU', // Survival whistle signaling
      introduction:
          'A whistle is one of the most essential survival tools you can carry. It can be heard up to '
          '1 km away in still conditions — far further than a human shout. The universal distress signal '
          'of three short blasts is recognised worldwide by rescue teams and fellow outdoor travellers. '
          'A quality pealess whistle (such as the Fox 40 or Storm Whistle) requires no batteries, '
          'functions when wet, and is audible even in strong wind. Always carry one on your person, '
          'not buried in your pack.',
      keyPoints: [
        'Three short blasts = universal distress signal. Repeat every minute.',
        'Wait silently between signals — listen for a response (two blasts means acknowledged).',
        'A pealess whistle performs better in cold and wet conditions than a ball-bearing type.',
        'Attach your whistle to a lanyard on your life jacket or jacket zipper pull for instant access.',
        'Pots, rocks, or any object can be struck rhythmically to create audible distress signals if no whistle is available.',
      ],
    ),
    SafetyLesson(
      id: 'es_mirror_1',
      categoryId: 'mirror',
      title: 'Mirror & Reflective Signaling',
      description:
          'How to use a signal mirror, watch face, or any reflective surface to signal aircraft or distant rescuers.',
      duration: '7 min',
      youtubeVideoId: '7M1UXSQJNng', // Signal mirror technique
      introduction:
          'A signal mirror is one of the most powerful long-range signaling tools available to a survivor. '
          'In bright sunlight, a standard military signal mirror can be seen by aircraft up to 50 km away. '
          'Even improvised reflectors — a watch face, tin foil, a CD, or any polished metal surface — '
          'can attract attention at distances of several kilometres. The key skill is directing the '
          'reflected light precisely at the target and sustaining that aim while moving the mirror.',
      keyPoints: [
        'Hold the mirror close to your face and aim the reflected sunlight toward the target.',
        'Create a "V" with two fingers extended toward the target, then tilt the mirror until the light spot sits on your fingers.',
        'Flash three times, pause, repeat — three flashes is the universal distress code.',
        'Improvised reflectors include: tin foil, CD, smartphone screen, polished belt buckle, or any shiny metal.',
        'Signal mirrors are most effective between 09:00 and 15:00 when the sun is high and bright.',
      ],
    ),
    SafetyLesson(
      id: 'es_ground_1',
      categoryId: 'ground_symbols',
      title: 'Ground-to-Air Signal Symbols',
      description:
          'International ground-to-air symbols that communicate your situation clearly to search and rescue aircraft.',
      duration: '9 min',
      youtubeVideoId: 'KrZG6WvnPCE', // Ground to air rescue signals
      introduction:
          'When search and rescue aircraft are overhead, ground-to-air symbols are a critical way to '
          'communicate your situation without a radio. These standardised symbols are recognised '
          'internationally and are part of aviation SAR protocols. They must be large enough — '
          'at least 3 metres tall — to be readable from the air, and made with high-contrast materials '
          'against the natural ground surface.',
      keyPoints: [
        'X = require medical assistance. V = require help. → = travelling in this direction.',
        'F = need food and water. LL = all is well. N = no / negative answer.',
        'Make symbols at least 3 m tall using stones, logs, clothing, or trampled vegetation.',
        'Use high-contrast materials — dark materials on light ground, light materials on dark ground.',
        'Clear a large open area first; symbols hidden under trees or on slopes are invisible from the air.',
      ],
    ),
    SafetyLesson(
      id: 'es_electronic_1',
      categoryId: 'electronic',
      title: 'Electronic Distress Devices',
      description:
          'How Personal Locator Beacons (PLBs), EPIRBs, and satellite messengers work and when to activate them.',
      duration: '10 min',
      youtubeVideoId: 'j0K0GpqCcLY', // PLB and EPIRB activation guide
      introduction:
          'Modern electronic distress devices have transformed wilderness rescue. A Personal Locator Beacon '
          '(PLB) transmits your GPS coordinates to satellites linked to national rescue coordination centres, '
          'alerting rescuers to your exact position within minutes. These devices require no subscription, '
          'work globally in any terrain, and have a standby battery life of 5–7 years. Satellite messengers '
          'such as Garmin inReach or SPOT also allow two-way text communication and non-emergency check-ins, '
          'but a registered PLB remains the gold standard for life-threatening emergencies.',
      keyPoints: [
        'Register your PLB with your national maritime or rescue authority — unregistered beacons cause costly false alarms.',
        'Activate ONLY in genuine life-threatening emergencies — false activations can result in legal penalties.',
        'Hold the PLB upright with the antenna vertical and away from your body for the strongest satellite signal.',
        'A PLB transmits your location for at least 24 hours once activated; rescue typically takes 2–4 hours.',
        'Keep your PLB close to your body in cold conditions — cold severely reduces battery performance.',
      ],
    ),
    SafetyLesson(
      id: 'es_night_1',
      categoryId: 'night_signal',
      title: 'Night Signaling Techniques',
      description:
          'Effective methods to signal for help after dark using light, fire, and other night-specific techniques.',
      duration: '7 min',
      youtubeVideoId: 'mnfhnyY-Udk', // Night survival signaling methods
      introduction:
          'Signaling at night requires completely different techniques from daytime signaling. '
          'Light becomes your most powerful tool — a sustained fire or torch can be seen for kilometres '
          'in darkness. Search and rescue aircraft often operate at night using night-vision equipment, '
          'making even small light sources highly visible against a dark background. '
          'The key is creating rhythmic, patterned signals that stand out clearly from background '
          'light sources and natural phenomena.',
      keyPoints: [
        'SOS in torch light: three short flashes — three long flashes — three short flashes (... --- ...). Repeat every minute.',
        'Strobe lights and flashing bicycle lights are extremely visible to aircraft at altitude in the dark.',
        'Keep a consistent fire burning — an irregular flickering fire signals "occupied camp" to rescuers.',
        'Chemical glow sticks last 8–12 hours and can be swung in a circle to create a bright, visible halo.',
        'Cover your torch with a red filter if available — red light preserves your night vision between signals.',
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
