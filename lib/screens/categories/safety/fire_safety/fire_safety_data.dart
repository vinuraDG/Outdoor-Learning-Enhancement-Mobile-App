import 'package:flutter/material.dart';
import '../safety_topic_model.dart';

class FireSafetyData {
  // ── Categories ────────────────────────────────────────────
  static const List<SafetyCategory> categories = [
    SafetyCategory(
      id: 'campfire_setup',
      title: 'Campfire Setup & Safety',
      subtitle: 'Build a safe fire in the right location using proper technique.',
      icon: Icons.outdoor_grill_outlined,
      color: Color(0xFFE64A19),
      bgColor: Color(0xFFFBE9E7),
    ),
    SafetyCategory(
      id: 'wildfire',
      title: 'Wildfire Awareness',
      subtitle: 'Recognise wildfire risk and know evacuation procedures.',
      icon: Icons.warning_amber_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
    ),
    SafetyCategory(
      id: 'fire_starting',
      title: 'Fire Starting Techniques',
      subtitle: 'Safe and effective methods to start a fire in any conditions.',
      icon: Icons.local_fire_department_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    SafetyCategory(
      id: 'extinguishing',
      title: 'Extinguishing Campfires',
      subtitle: 'Correctly put out a campfire to prevent forest fires.',
      icon: Icons.water_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    SafetyCategory(
      id: 'cooking_fire',
      title: 'Cooking Fire Safety',
      subtitle: 'Safe practices for camp stoves and outdoor cooking fires.',
      icon: Icons.soup_kitchen_outlined,
      color: Color(0xFF2E7D32),
      bgColor: Color(0xFFE8F5E9),
    ),
    SafetyCategory(
      id: 'fire_prevention',
      title: 'Fire Prevention & LNT',
      subtitle: 'Minimise fire impact and follow Leave No Trace principles.',
      icon: Icons.eco_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
  ];

  // ── Lessons (one per category) ────────────────────────────
  static const List<SafetyLesson> lessons = [
    SafetyLesson(
      id: 'fs_campfire_1',
      categoryId: 'campfire_setup',
      title: 'Campfire Setup & Safety',
      description:
          'How to choose the right location, build a safe fire ring, and manage your campfire responsibly.',
      duration: '9 min',
      youtubeVideoId: '7uInRamVDpY', // How to build a safe campfire
      introduction:
          'A campfire is one of the most satisfying parts of any outdoor trip — and one of the most '
          'dangerous if handled carelessly. Every year, improperly managed campfires cause devastating '
          'wildfires that destroy thousands of hectares of wilderness and endanger lives. '
          'Safe campfire practice begins before the first match is struck: choosing the right '
          'location, using an existing fire ring wherever possible, keeping the fire appropriately small, '
          'and committing to never leaving it completely unattended.',
      keyPoints: [
        'Always use an existing fire ring where one is available. If none exists, build one in a cleared, rocky area at least 3 m from vegetation.',
        'Keep fires small — a fire the size of a dinner plate provides ample warmth and cooking heat without being unmanageable.',
        'Never build fires directly under overhanging branches or on peaty ground — peat can smoulder underground for weeks.',
        'Keep a full container of water and a shovel within arm\'s reach at all times while the fire is burning.',
        'Never leave a campfire unattended, even briefly — an unexpected gust of wind can spread embers within seconds.',
      ],
    ),
    SafetyLesson(
      id: 'fs_wildfire_1',
      categoryId: 'wildfire',
      title: 'Wildfire Awareness & Evacuation',
      description:
          'How to recognise high-risk wildfire conditions, understand fire behaviour, and evacuate safely if a wildfire approaches.',
      duration: '11 min',
      youtubeVideoId: 'p0Q8B9K79Q8', // Wildfire awareness and evacuation guide
      introduction:
          'Wildfires move with frightening speed — under certain atmospheric and fuel conditions, '
          'a fire front can travel faster than a running person and change direction without warning. '
          'Understanding what environmental conditions create extreme fire risk, how to read early '
          'fire behaviour indicators, and how to evacuate calmly and safely can save your life. '
          'In recent years, climate-driven mega-fires have demonstrated that even experienced outdoors '
          'people can be caught completely off-guard by how rapidly conditions deteriorate.',
      keyPoints: [
        'High-risk conditions: dry vegetation (fuel moisture below 10%), low relative humidity (<25%), temperature above 35°C, and strong gusty winds.',
        'Fire moves uphill far faster than downhill — never shelter in a gully, canyon, or valley bottom during a wildfire.',
        'If evacuation routes are cut off: find the largest nearby clearing, lie flat face-down, and cover yourself with soil or a wool blanket.',
        'Never shelter inside a vehicle if fire is directly surrounding it — vehicles can become lethal traps within minutes.',
        'Follow authority evacuation orders immediately — early voluntary evacuation consistently saves the most lives.',
      ],
    ),
    SafetyLesson(
      id: 'fs_starting_1',
      categoryId: 'fire_starting',
      title: 'Fire Starting Techniques',
      description:
          'Reliable methods to start a fire in wet, cold, and windy conditions using matches, lighters, and friction fire.',
      duration: '10 min',
      youtubeVideoId: 'ZPr-a8kht2E', // Survival fire starting techniques
      introduction:
          'The ability to reliably start a fire in adverse conditions is one of the most fundamental '
          'survival skills you can develop. In cold, wet, or windy environments, fire provides warmth, '
          'signaling capability, the ability to purify water, and an enormous psychological boost. '
          'Success always depends on the fire triangle — heat, fuel, and oxygen — and on the critical '
          'principle of preparing your complete fuel layout before lighting anything. '
          'The most common reason fires fail is attempting to light them before the fuel is properly arranged.',
      keyPoints: [
        'Always collect and arrange your tinder, kindling (pencil-thickness), and fuel wood (wrist-thickness) BEFORE lighting anything.',
        'Tinder must be completely dry — carry commercial fire starters, wax-coated cotton balls, or birch bark as reliable backups.',
        'Shape your tinder bundle like a loose bird\'s nest and ignite from deep inside the centre.',
        'Shield your flame from wind with your body, pack, or a windbreak of rocks — add kindling gradually, never smother.',
        'Waterproof matches or a butane lighter are more reliably effective in wet conditions than flint and steel.',
      ],
    ),
    SafetyLesson(
      id: 'fs_extinguish_1',
      categoryId: 'extinguishing',
      title: 'Properly Extinguishing a Campfire',
      description:
          'The correct step-by-step technique for completely extinguishing a campfire so it cannot reignite and cause a wildfire.',
      duration: '6 min',
      youtubeVideoId: '6tRRROtfuxE', // How to properly put out a campfire
      introduction:
          'An improperly extinguished campfire is one of the leading causes of preventable wildfires globally. '
          'Embers can remain alive and capable of reigniting for many hours — even days in dry, '
          'sheltered conditions — and a light breeze is all that is needed to bring them back to full flame. '
          'The governing rule is absolute: if the fire is too hot to hold your hand directly above it '
          'without flinching, it is too hot to leave. A properly extinguished fire is cold, wet, '
          'and completely stirred to ash throughout.',
      keyPoints: [
        'Allow the fire to burn down fully to ash at least 20 minutes before you begin extinguishing it.',
        'Pour water slowly over the entire fire — include all embers and coals around the outer edges of the ring.',
        'Stir the ash and embers thoroughly with a stick, then add more water. Repeat until absolutely no steam or smoke rises.',
        'Check the temperature with the back of your hand held just above the ash — only leave when it feels completely cold.',
        'Bury ash only when it is entirely cold — burying hot ash allows smouldering underground that can re-emerge as flame.',
      ],
    ),
    SafetyLesson(
      id: 'fs_cooking_1',
      categoryId: 'cooking_fire',
      title: 'Cooking Fire & Camp Stove Safety',
      description:
          'Safe practices for camp stoves, cooking fires, and managing pressurised fuel canisters in the outdoors.',
      duration: '8 min',
      youtubeVideoId: '2bnxPIr34SA', // Camp stove and cooking fire safety
      introduction:
          'Camp stoves and outdoor cooking fires present specific hazards that differ significantly '
          'from warmth campfires. The combination of liquid fuels, pressurised canisters, cooking oils, '
          'and the confined interior space of a tent creates serious risks of burns, explosions, '
          'and silent carbon monoxide poisoning. Understanding how to use camp stoves safely — '
          'and critically, where not to use them — is one of the most important practical skills '
          'for any multi-day or expedition trip.',
      keyPoints: [
        'Never use any camp stove inside a tent or enclosed shelter — carbon monoxide poisoning is colourless, odourless, and kills without warning.',
        'Inspect all fuel canisters carefully before use — never use a damaged, dented, corroded, or leaking canister.',
        'Place your stove on a stable, flat, non-flammable surface at least 1 m from tent walls and vegetation.',
        'Treat cooking burns immediately: cool running water applied for a minimum of 20 minutes — never ice, butter, or toothpaste.',
        'Store fuel canisters away from direct heat and sunlight. Never puncture or incinerate even an empty canister.',
      ],
    ),
    SafetyLesson(
      id: 'fs_prevention_1',
      categoryId: 'fire_prevention',
      title: 'Fire Prevention & Leave No Trace',
      description:
          'Minimising your fire impact on the environment and understanding Leave No Trace fire ethics.',
      duration: '7 min',
      youtubeVideoId: 'kx-TvlMB1QA', // Leave No Trace fire principles
      introduction:
          'Leave No Trace Principle 5 — "Minimise Campfire Impacts" — acknowledges that campfires '
          'have significant and often permanent environmental impacts even when managed safely. '
          'They consume dead wood that would otherwise return essential nutrients to the soil, '
          'leave permanent fire scars, and char rocks irreversibly. Modern lightweight camp stoves '
          'are almost always a better choice for cooking in wilderness settings. When open fires are '
          'appropriate, the goal is to depart the site in a condition where no visitor can tell a '
          'fire was ever made there.',
      keyPoints: [
        'Before lighting a fire, ask: is a fire appropriate here? Fire bans, dry conditions, and fragile ecosystems often mean stove-only.',
        'On remote or pristine trips, use a fire pan or build a mound fire to avoid permanently marking the ground.',
        'Collect only dead and downed wood from the ground — never break living branches from standing trees.',
        'Keep fires small and burn all wood completely to fine white ash before extinguishing.',
        'After extinguishing, scatter cold ash widely in the surrounding area so it is absorbed back into the natural environment.',
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
