import 'package:flutter/material.dart';
import '../safety_topic_model.dart';

class WildlifeSafetyData {
  // ── Categories ────────────────────────────────────────────
  static const List<SafetyCategory> categories = [
    SafetyCategory(
      id: 'bear',
      title: 'Bear Encounters',
      subtitle: 'Avoid, respond to, and survive encounters with bears.',
      icon: Icons.forest_outlined,
      color: Color(0xFF5D4037),
      bgColor: Color(0xFFEFEBE9),
    ),
    SafetyCategory(
      id: 'snake',
      title: 'Snake Encounters',
      subtitle: 'Prevention, identification, and bite response.',
      icon: Icons.pest_control_outlined,
      color: Color(0xFF2E7D32),
      bgColor: Color(0xFFE8F5E9),
    ),
    SafetyCategory(
      id: 'big_cat',
      title: 'Big Cat Encounters',
      subtitle: 'Respond safely to leopard, puma, and big cat encounters.',
      icon: Icons.pets_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    SafetyCategory(
      id: 'bee_wasp',
      title: 'Bee & Wasp Attacks',
      subtitle: 'Avoiding swarms and responding to mass stings.',
      icon: Icons.bug_report_outlined,
      color: Color(0xFFFBC02D),
      bgColor: Color(0xFFFFFDE7),
    ),
    SafetyCategory(
      id: 'wild_boar',
      title: 'Wild Boar Safety',
      subtitle: 'Recognise threats and escape wild boar charges.',
      icon: Icons.agriculture_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
    SafetyCategory(
      id: 'insects_ticks',
      title: 'Insects & Tick Prevention',
      subtitle: 'Protect yourself from ticks, mosquitoes, and disease vectors.',
      icon: Icons.coronavirus_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
  ];

  // ── Lessons (one per category) ────────────────────────────
  static const List<SafetyLesson> lessons = [
    SafetyLesson(
      id: 'ws_bear_1',
      categoryId: 'bear',
      title: 'Bear Encounter Safety',
      description:
          'How to avoid attracting bears, what to do if you encounter one, and when to deploy bear spray.',
      duration: '10 min',
      youtubeVideoId: 'u9N1r0c7gbI', // Bear safety in the wild
      introduction:
          'Bears are among the most commonly encountered large predators in wilderness areas worldwide. '
          'The vast majority of bear encounters are non-threatening — bears are typically as eager to '
          'avoid contact with humans as you are to avoid them. Understanding bear behaviour, making '
          'sufficient noise while travelling through bear habitat, and knowing the correct response '
          'to a sudden close encounter are the foundations of safe travel in bear country.',
      keyPoints: [
        'Make noise while hiking — talk, clap, or call out — to avoid surprising bears at close range.',
        'Never approach or feed a bear. A "food-conditioned" bear loses its natural wariness and becomes dangerous.',
        'In a non-predatory defensive charge: stand your ground, deploy bear spray at 8–10 m, and play dead face-down if contact occurs.',
        'In a predatory attack (night approach, stalking behaviour): fight back aggressively using any available object.',
        'Store all food in approved bear canisters or hang it at least 4 m high and 1 m from the nearest tree trunk.',
      ],
    ),
    SafetyLesson(
      id: 'ws_snake_1',
      categoryId: 'snake',
      title: 'Snake Encounter Response',
      description:
          'How to avoid snake encounters, identify venomous species, and respond correctly to a snakebite.',
      duration: '9 min',
      youtubeVideoId: 'TfMBXBkRhtE', // Snake safety in the outdoors
      introduction:
          'Snakebite is a significant outdoor hazard in many tropical and subtropical regions. '
          'The majority of bites occur when people accidentally step on or attempt to handle snakes. '
          'Most snake encounters are entirely avoidable with proper footwear, situational awareness, '
          'and understanding of snake habitat. If bitten, the correct response is calm and rapid '
          'evacuation to a medical facility — all outdated field treatments (cutting, sucking, '
          'tourniquet) actively worsen outcomes and must never be used.',
      keyPoints: [
        'Wear closed boots and long pants in snake habitat. Probe ahead in dense vegetation with a walking pole.',
        'Never reach under rocks, logs, or into dark crevices without checking first.',
        'If you see a snake, freeze and back away slowly — the majority of strikes happen within 60 cm of the snake.',
        'Snakebite first aid: keep the victim calm and still, immobilise the bitten limb at heart level, evacuate immediately.',
        'Do NOT cut the wound, suck out venom, apply a tourniquet, or use ice — all of these worsen the outcome.',
      ],
    ),
    SafetyLesson(
      id: 'ws_bigcat_1',
      categoryId: 'big_cat',
      title: 'Big Cat Encounter Safety',
      description:
          'How to respond correctly to encounters with leopards, pumas, jaguars, and other large cats in the wild.',
      duration: '8 min',
      youtubeVideoId: 'Bj2lqWAWEyY', // Big cat and mountain lion safety
      introduction:
          'Big cat encounters are rare but require very specific responses that differ from bear protocols. '
          'Unlike bears, predatory big cats are ambush hunters — fleeing immediately triggers their '
          'hardwired chase and predation instinct. Leopards, pumas (mountain lions), and jaguars are '
          'opportunistic hunters that naturally target prey which behaves like prey. Making yourself '
          'appear large, maintaining direct eye contact, and responding aggressively if a cat approaches '
          'are the cornerstone behaviours for surviving a big cat encounter.',
      keyPoints: [
        'Do NOT run — running triggers a powerful predatory chase response in all large cats.',
        'Make yourself appear as large as possible: raise both arms above your head, open your jacket wide, and stand as tall as you can.',
        'Maintain direct eye contact — big cats strongly prefer ambush and will often lose interest if the prey watches them consistently.',
        'Speak loudly and firmly in a low voice. Throw rocks or sticks if the cat begins to approach.',
        'If attacked: fight back aggressively and do not stop — target the eyes and nose. Big cats can be successfully deterred.',
      ],
    ),
    SafetyLesson(
      id: 'ws_bee_1',
      categoryId: 'bee_wasp',
      title: 'Bee & Wasp Swarm Response',
      description:
          'How to avoid disturbing bee or wasp nests, and what to do if you are attacked by a swarm.',
      duration: '7 min',
      youtubeVideoId: 'ZDnnGvIbLXg', // Bee and wasp attack safety
      introduction:
          'Bee and wasp swarm attacks are far more dangerous than most people realise. While a single '
          'sting is painful but typically harmless, multiple stings from an agitated colony can be '
          'life-threatening even in people without a known allergy. People with diagnosed anaphylaxis '
          'must carry a prescribed EpiPen at all times when in the outdoors. Africanised honeybees, '
          'present in many tropical regions, are particularly aggressive and will chase a threat '
          'for up to 400 metres.',
      keyPoints: [
        'Avoid wearing strong perfumes, bright floral-patterned clothing, or consuming sweet drinks near known nest areas.',
        'If attacked by a swarm: run immediately in a straight line away from the nest — do not stop to swat.',
        'Protect your face and eyes while running. Seek shelter in a vehicle or enclosed building with doors shut.',
        'Never jump into water to escape bees — they will hover above the surface and sting you every time you surface.',
        'Remove stingers by scraping sideways with a fingernail or card — never pinch or squeeze, as this injects more venom.',
      ],
    ),
    SafetyLesson(
      id: 'ws_boar_1',
      categoryId: 'wild_boar',
      title: 'Wild Boar Safety',
      description:
          'Recognising wild boar behaviour, avoiding encounters, and responding correctly to a charge.',
      duration: '7 min',
      youtubeVideoId: 'p0G_TIJfhZ8', // Wild boar encounter safety
      introduction:
          'Wild boars are found across Asia, Europe, Africa, and have been introduced in many other regions. '
          'They are generally shy animals that prefer to avoid human contact, but they can be extremely '
          'dangerous when startled, cornered, or when a sow is protecting young piglets. '
          'A charging boar can reach speeds of up to 48 km/h and its sharp tusks can inflict severe, '
          'potentially fatal lacerations. Awareness, noise-making, and knowing how to create a barrier '
          'between yourself and the animal are the most important skills.',
      keyPoints: [
        'Make noise while moving through dense vegetation to give boars sufficient warning of your approach.',
        'If a boar is spotted, back away slowly and quietly — never block its natural escape route.',
        'If charged: immediately get behind a large tree, boulder, or any solid obstacle — boars cannot change direction quickly.',
        'If you are carrying a pack, swing it to the front as a protective barrier between you and the boar.',
        'Climb a tree if one is nearby — boars cannot climb, and even 1 metre of height provides complete safety.',
      ],
    ),
    SafetyLesson(
      id: 'ws_insects_1',
      categoryId: 'insects_ticks',
      title: 'Tick & Insect Bite Prevention',
      description:
          'Protecting yourself from ticks, mosquitoes, sand flies, and the diseases they transmit outdoors.',
      duration: '8 min',
      youtubeVideoId: 'EWvqjWe79Oo', // Tick and insect bite prevention guide
      introduction:
          'Vector-borne diseases transmitted by ticks and insects — including Lyme disease, malaria, '
          'dengue fever, Japanese encephalitis, and scrub typhus — affect millions of outdoor '
          'enthusiasts globally every year. Prevention is far more effective than treatment after '
          'the fact. A combined approach of protective clothing, appropriate repellent use, campsite '
          'selection, and thorough daily body checks provides strong protection against the most '
          'common tick and insect threats.',
      keyPoints: [
        'Wear long sleeves and pants tucked into socks in tick habitat; light-coloured clothing makes ticks easier to spot.',
        'Apply DEET-based repellent (20–30%) to exposed skin. Apply permethrin to clothing and gear, never directly on skin.',
        'Check your entire body within 2 hours of leaving tick habitat — pay particular attention to hairline, behind knees, and groin.',
        'To remove an attached tick: grip it as close to the skin as possible with fine-tipped tweezers and pull steadily straight out.',
        'Never squeeze, burn, or apply petroleum jelly to an attached tick — these methods all increase the risk of infection.',
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
