import 'package:flutter/material.dart';

// ── Guide model ───────────────────────────────────────────────
class OutdoorGuide {
  final String id;
  final String title;
  final String readTime;
  final String summary;
  final List<GuideSection> sections;
  final IconData icon;
  final Color color;

  const OutdoorGuide({
    required this.id,
    required this.title,
    required this.readTime,
    required this.summary,
    required this.sections,
    required this.icon,
    required this.color,
  });
}

class GuideSection {
  final String heading;
  final String body;

  const GuideSection({required this.heading, required this.body});
}

// ── Article model ─────────────────────────────────────────────
class OutdoorArticle {
  final String id;
  final String title;
  final String author;
  final String readTime;
  final String category;
  final Color categoryColor;
  final String intro;
  final List<String> paragraphs;
  final IconData icon;

  const OutdoorArticle({
    required this.id,
    required this.title,
    required this.author,
    required this.readTime,
    required this.category,
    required this.categoryColor,
    required this.intro,
    required this.paragraphs,
    required this.icon,
  });
}

// ── Tip model ─────────────────────────────────────────────────
class TipCategory {
  final String id;
  final String title;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final List<String> tips;

  const TipCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.tips,
  });
}

// ── Video lesson model ────────────────────────────────────────
class LearnVideo {
  final String id;
  final String title;
  final String description;
  final String duration;
  final String youtubeVideoId;
  final String category;
  final Color categoryColor;
  final List<String> keyPoints;

  const LearnVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.youtubeVideoId,
    required this.category,
    required this.categoryColor,
    required this.keyPoints,
  });
}

// ── Quiz model ────────────────────────────────────────────────
class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// ══════════════════════════════════════════════════════════════
// ── All data ──────────────────────────────────────────────────
// ══════════════════════════════════════════════════════════════
class LearnData {
  // ── Guides ────────────────────────────────────────────────
  static const List<OutdoorGuide> guides = [
    OutdoorGuide(
      id: 'g_lnt',
      title: 'Leave No Trace: The 7 Principles',
      readTime: '8 min read',
      summary:
          'The Leave No Trace framework is the ethical foundation of responsible outdoor recreation. '
          'These seven principles guide every decision you make in wild places.',
      icon: Icons.eco_outlined,
      color: Color(0xFF2D6A4F),
      sections: [
        GuideSection(
          heading: '1. Plan Ahead & Prepare',
          body:
              'Know the regulations for the area you are visiting. Prepare for extreme weather, hazards, '
              'and emergencies. Repackage food to minimise waste. Use a map and compass to eliminate the '
              'use of rock cairns, flagging, or marking paint. Plan trips during off-peak times to avoid '
              'crowding sensitive areas.',
        ),
        GuideSection(
          heading: '2. Travel & Camp on Durable Surfaces',
          body:
              'Durable surfaces include established trails, campsites, rock, gravel, dry grass, and snow. '
              'In popular areas, concentrate use on existing trails and camp spots. In pristine areas, '
              'disperse use to prevent the creation of new campsites and trails. Walk in single file in '
              'the middle of the trail, even when wet or muddy.',
        ),
        GuideSection(
          heading: '3. Dispose of Waste Properly',
          body:
              'Pack out all rubbish, leftover food, and litter. Use established toilets where available. '
              'Where none exist, deposit solid waste in cat holes 15–20 cm deep, at least 60 m from '
              'water, camp, and trails. Pack out toilet paper and hygiene products. Scatter grey '
              'dishwater 60 m from water sources.',
        ),
        GuideSection(
          heading: '4. Leave What You Find',
          body:
              'Preserve the past — examine but do not touch cultural or historic structures. Leave rocks, '
              'plants, and other natural objects exactly as you find them. Avoid introducing or '
              'transporting non-native species by cleaning mud, seeds, and plant material from boots '
              'and equipment between locations.',
        ),
        GuideSection(
          heading: '5. Minimise Campfire Impacts',
          body:
              'Use a lightweight camp stove for cooking and a lantern for light. Where fires are '
              'permitted, use established fire rings or mound fires on mineral soil. Keep fires small. '
              'Burn all wood and coal to ash, put out campfires completely, then scatter cool ashes. '
              'Do not leave fires unattended.',
        ),
        GuideSection(
          heading: '6. Respect Wildlife',
          body:
              'Observe wildlife from a distance. Never feed animals — it damages their health, alters '
              'natural behaviour, and habituates them to humans. Protect wildlife by storing rations and '
              'rubbish securely. Control pets at all times, or leave them at home. Avoid wildlife during '
              'sensitive times: mating, nesting, raising young, and winter.',
        ),
        GuideSection(
          heading: '7. Be Considerate of Other Visitors',
          body:
              'Respect other visitors and protect the quality of their experience. Be courteous — yield '
              'to other users on the trail. Step to the downhill side of the trail when encountering '
              'pack stock. Take breaks and camp away from trails and other visitors. Let nature sounds '
              'prevail — avoid loud voices and noisy equipment.',
        ),
      ],
    ),
    OutdoorGuide(
      id: 'g_campsite',
      title: 'Campsite Selection & Setup',
      readTime: '6 min read',
      summary:
          'Choosing and setting up the right campsite protects you from weather and wildlife '
          'while minimising environmental impact.',
      icon: Icons.night_shelter_outlined,
      color: Color(0xFF1A7A6E),
      sections: [
        GuideSection(
          heading: 'Choosing Your Location',
          body:
              'Look for a flat, sheltered spot at least 60 m from any water source, trail, and other '
              'campers. Avoid dry creek beds (flash flood risk), ridgelines (wind exposure and lightning), '
              'and low-lying areas (cold air pooling and frost). In bear country, also consider being at '
              'least 60 m downwind from your food storage and cooking areas.',
        ),
        GuideSection(
          heading: 'Reading the Ground',
          body:
              'Check the ground for ant nests, thorns, and wet patches. Avoid camping directly under '
              'dead branches or snags — they fall without warning, especially in wind. A gentle slope '
              'facing east catches morning sun and allows drainage away from you during rain. '
              'Test the soil by pressing your heel — soft compressible soil indicates recent water.',
        ),
        GuideSection(
          heading: 'Setting Up the Tent',
          body:
              'Always pitch the tent with the door facing away from the prevailing wind. Use all '
              'provided guylines — even in calm conditions, conditions change overnight. Place a '
              'footprint or groundsheet under the tent to protect the floor and prevent groundwater '
              'from wicking through the floor fabric. Ensure there is no pooling hollow directly '
              'under the tent body.',
        ),
        GuideSection(
          heading: 'Kitchen Triangle',
          body:
              'In bear or wildlife-active areas, set up your camp using the "triangle system": '
              'sleeping area, cooking area, and food storage should each be at least 60 m apart, '
              'forming a triangle. Never cook or store food inside or near your tent. Cook '
              'downwind from your sleeping area so cooking smells blow away from where you sleep.',
        ),
        GuideSection(
          heading: 'Leaving No Trace',
          body:
              'Before departing, pack out all rubbish including food scraps. Dismantle all '
              'fire rings if you created them (scatter rocks, remove ash). Fill in any depressions '
              'left by tent stakes. Scatter natural material over flattened vegetation. The goal is '
              'that a subsequent visitor cannot tell anyone camped there.',
        ),
      ],
    ),
    OutdoorGuide(
      id: 'g_navigation',
      title: 'Navigation Fundamentals',
      readTime: '10 min read',
      summary:
          'Master map reading, compass bearings, and triangulation — the three core skills '
          'of backcountry navigation that work without any batteries.',
      icon: Icons.explore_outlined,
      color: Color(0xFF1565C0),
      sections: [
        GuideSection(
          heading: 'Understanding Your Topographic Map',
          body:
              'A topographic map represents three-dimensional terrain on a flat surface using contour '
              'lines — each line connects all points at the same elevation. Closely spaced contour '
              'lines mean steep terrain; widely spaced lines mean gentle slopes. A "V" shape of '
              'contours pointing uphill indicates a valley or gully; pointing downhill indicates a ridge.',
        ),
        GuideSection(
          heading: 'Orienting the Map',
          body:
              'Before using a map, orient it so that north on the map points north in the real world. '
              'Place your compass on the map so the direction-of-travel arrow points to the top of the '
              'map. Rotate both map and compass together until the compass needle aligns with north. '
              'Always check and apply magnetic declination for your region — the difference between '
              'magnetic north (where the needle points) and true north (map north).',
        ),
        GuideSection(
          heading: 'Taking a Bearing',
          body:
              'Point the direction-of-travel arrow at your target (a summit, a col, a trail junction). '
              'Rotate the bezel until the north lines align with the compass needle. Read the bearing '
              'at the index line. Apply declination if your compass does not have an automatic '
              'adjustment. Now follow that bearing by keeping the needle aligned in the bezel '
              'housing as you walk — the direction-of-travel arrow shows your heading.',
        ),
        GuideSection(
          heading: 'Triangulation (Finding Your Position)',
          body:
              'To find your exact position when lost: identify two or three landmarks you can see '
              'in both the real world and on your map. Take a bearing to each landmark. '
              'Draw a back-bearing line from each landmark on the map (back-bearing = bearing + 180°). '
              'Where the lines intersect is your position. Three lines provide a "cocked hat" triangle '
              '— your true position is within that triangle.',
        ),
        GuideSection(
          heading: 'Pace Counting',
          body:
              'Pace counting lets you measure distances travelled on the ground. Count your double '
              'paces (every time your right foot hits the ground) over a known 100 m distance to find '
              'your pace count (typically 60–70 double paces per 100 m). To measure distance: '
              'divide the map distance in metres by 100, multiply by your pace count. Use a pace '
              'counter bead tally to track across multiple 100 m segments.',
        ),
      ],
    ),
    OutdoorGuide(
      id: 'g_water',
      title: 'Water Purification in the Field',
      readTime: '5 min read',
      summary:
          'Drinking untreated backcountry water is one of the most reliable ways to ruin a trip. '
          'Every method has trade-offs — know them all.',
      icon: Icons.water_drop_outlined,
      color: Color(0xFF0097A7),
      sections: [
        GuideSection(
          heading: 'Choosing Your Water Source',
          body:
              'Always collect from moving water rather than stagnant ponds where possible — '
              'fast-moving water over rocks has higher natural aeration and lower bacterial density. '
              'Collect from the upstream side of any camp, trail crossing, or animal track. '
              'Never collect near grazing areas, agricultural land, or below mining sites regardless '
              'of how clear the water appears.',
        ),
        GuideSection(
          heading: 'Mechanical Filtration',
          body:
              'Hollow-fibre filters (Sawyer Squeeze, Katadyn BeFree) remove bacteria and protozoa '
              '(including giardia and cryptosporidium) physically by forcing water through pores '
              'of 0.1–0.2 microns. They are fast, lightweight, and require no chemicals. '
              'Limitation: they do NOT remove viruses. Suitable for most wilderness water in '
              'regions with low virus risk (New Zealand, North America, most of Europe).',
        ),
        GuideSection(
          heading: 'Chemical Treatment',
          body:
              'Chlorine dioxide tablets (Aquatabs, Potable Aqua CIO₂) kill bacteria, protozoa, '
              'AND most viruses in clear water within 30 minutes. Effective even if the filter '
              'freezes and is rendered non-functional. Limitation: cryptosporidium requires '
              '4 hours of contact time at cold temperatures. Pack chemical treatment as a primary '
              'or backup method whenever virus risk is elevated (tropical regions, areas with '
              'human settlements upstream).',
        ),
        GuideSection(
          heading: 'UV Purification',
          body:
              'UV devices (SteriPen) destroy the DNA of bacteria, protozoa, and viruses by '
              'exposing water to ultraviolet light for 60–90 seconds. Highly effective in clear '
              'water. Critical limitation: UV does NOT work in turbid or silty water — '
              'particles shield organisms from the UV light. Always pre-filter cloudy water '
              'through a bandana or coffee filter before UV treatment.',
        ),
        GuideSection(
          heading: 'Boiling',
          body:
              'Boiling is the universal backup when all other methods fail — it kills every '
              'pathogen including viruses and is 100% reliable. Bring water to a rolling boil for '
              '1 minute (3 minutes above 2000 m altitude where boiling point is lower). '
              'The major limitation is fuel cost and the time required for the water to cool '
              'before it is drinkable — plan ahead rather than waiting until thirsty.',
        ),
      ],
    ),
    OutdoorGuide(
      id: 'g_firstaid',
      title: 'Wilderness First Aid Essentials',
      readTime: '9 min read',
      summary:
          'Backcountry medical situations differ from urban emergencies. '
          'Evacuation may be hours or days away — knowing how to stabilise and manage '
          'until help arrives is a critical skill.',
      icon: Icons.medical_services_outlined,
      color: Color(0xFFE53935),
      sections: [
        GuideSection(
          heading: 'The Patient Assessment System',
          body:
              'Every wilderness medical response starts with scene safety and a systematic patient '
              'assessment: 1) Scene safety — is it safe to approach? 2) Primary survey — airway, '
              'breathing, circulation, severe bleeding. 3) Secondary survey — head-to-toe physical '
              'exam, vital signs (pulse, breathing rate, level of consciousness). 4) SAMPLE history '
              '— Symptoms, Allergies, Medications, Past medical history, Last meal, Events leading up.',
        ),
        GuideSection(
          heading: 'Controlling Severe Bleeding',
          body:
              'For arterial or life-threatening bleeding: apply a tourniquet 5–7 cm above the wound '
              'on a limb, tighten until bleeding stops, and note the application time. A tourniquet '
              'applied early saves lives — the correct concern is not tourniquet use, but tourniquet '
              'delay. For wounds not amenable to a tourniquet (torso, neck, groin), pack the wound '
              'firmly with clean cloth and apply sustained direct pressure for at least 10 minutes.',
        ),
        GuideSection(
          heading: 'Hyperthermia Management',
          body:
              'Heat exhaustion (core temperature 37–40°C): move to shade, remove excess clothing, '
              'fan and apply cool water to the skin, provide oral fluids if conscious and not nauseous. '
              'Heat stroke (core temperature above 40°C, altered consciousness): this is immediately '
              'life-threatening. Immerse in cold water (ice water if available) and evacuate urgently '
              '— reduction in core temperature by any means is the treatment priority.',
        ),
        GuideSection(
          heading: 'Hypothermia Management',
          body:
              'Mild hypothermia (shivering, impaired coordination): remove wet clothing, insulate '
              'from ground and wind, provide dry insulation and warm sugary drinks. '
              'Moderate hypothermia (shivering stops, confusion, slurred speech): handle the patient '
              'very gently — the cold myocardium is extremely sensitive to movement-induced '
              'ventricular fibrillation. Insulate and evacuate — no hot water bottles, no rubbing.',
        ),
        GuideSection(
          heading: 'Spinal Precautions in the Wilderness',
          body:
              'Apply spinal precautions after high-energy trauma (falls from height, high-speed '
              'impacts, diving accidents) combined with altered consciousness, neck or back pain, '
              'or neurological symptoms. A conscious, reliable patient with no distracting injuries, '
              'no neck pain, and full range of motion can be cleared without spinal precautions. '
              'In a multi-day evacuation scenario, weigh the risk of continued spinal motion '
              'against the risk of delayed evacuation.',
        ),
      ],
    ),
  ];

  // ── Articles ──────────────────────────────────────────────
  static const List<OutdoorArticle> articles = [
    OutdoorArticle(
      id: 'a_layering',
      title: 'Why Layering is the Most Important Outdoor Skill',
      author: 'ORC SUSL Team',
      readTime: '5 min read',
      category: 'Gear',
      categoryColor: Color(0xFF1A7A6E),
      icon: Icons.layers_outlined,
      intro:
          'More outdoor accidents are caused by inadequate clothing than by any single piece '
          'of missing survival gear. The layering system — base, mid, shell — is not a '
          'marketing concept. It is physics.',
      paragraphs: [
        'Your body generates heat through metabolism, and loses it primarily through four mechanisms: '
        'conduction (contact with cold surfaces), convection (wind moving heat away from your skin), '
        'radiation (heat radiating from exposed skin), and evaporation (sweat cooling the skin). '
        'A layering system addresses all four simultaneously.',
        'The base layer\'s sole job is moisture management. Sweat left against your skin evaporates '
        'rapidly in cold or windy conditions, removing enormous amounts of heat with it. A merino wool '
        'or synthetic base layer wicks moisture away from the skin and moves it outward to evaporate '
        'at the outer surface. Cotton absorbs moisture and holds it against you — this is why "cotton '
        'kills" in cold weather, not an exaggeration.',
        'The mid layer\'s job is insulation. It traps warm air in a layer close to your body. '
        'Down is lighter and more compressible than synthetic; synthetic continues insulating when wet. '
        'The key insight most beginners miss: a mid layer is not just for stopping — it is meant to '
        'be added and removed constantly as activity level and temperature change.',
        'The shell layer\'s job is protection from wind and precipitation. Even a light wind at 15 km/h '
        'can remove heat from your body 20 times faster than still air. A quality hardshell blocks wind '
        'completely while allowing water vapour (sweat) to escape outward through the membrane.',
        'The skill in layering is proactive adjustment — you add a layer before you get cold, '
        'and remove one before you get too hot and start sweating. Sweating into your base layer '
        'defeats the entire system. The goal is to stay comfortable, which means staying slightly '
        'cool while active and immediately adding insulation when you stop.',
      ],
    ),
    OutdoorArticle(
      id: 'a_beginners',
      title: '10 Things Every Beginner Should Know Before Their First Hike',
      author: 'ORC SUSL Team',
      readTime: '6 min read',
      category: 'Beginners',
      categoryColor: Color(0xFF2D6A4F),
      icon: Icons.hiking_outlined,
      intro:
          'The first hike shapes everything that follows. These ten things separate the '
          'hiker who comes home inspired from the one who gets hurt, lost, or never tries again.',
      paragraphs: [
        '1. Tell someone your plan. Before you leave the trailhead, make sure at least one person '
        'who is not on the trip knows exactly where you are going, which route you are taking, and '
        'when you expect to return. Agree on a time for them to call emergency services if they '
        'have not heard from you.',
        '2. Check the weather three times. The day before, the morning of, and at the trailhead. '
        'Mountain weather changes faster than valley forecasts predict. If there is any chance of '
        'afternoon thunderstorms, plan your turnaround time accordingly.',
        '3. Carry more water than you think you need. A common beginner mistake is carrying '
        '500 ml for a 3-hour hike. The minimum is 500 ml per hour of hiking, more in heat or '
        'at altitude. Dehydration impairs judgement before it causes thirst.',
        '4. Start later than you want to. Most day-hiking accidents happen on the return. '
        'Fatigue is the greatest risk factor — an earlier start means an earlier return when '
        'your body and mind are fresher.',
        '5. Your footwear matters more than anything else in your pack. Blisters and ankle '
        'rolls are the leading causes of trip cutbacks. Break in any new boots before a '
        'long hike — at least four 2+ hour walks on varied terrain.',
        '6. Learn the difference between a trail marker and a trail. Marked trails look '
        'obvious until they cross a rock slab, merge with an animal track, or disappear '
        'in snow. Know where you are on the map at all times, not just when you\'re unsure.',
        '7. Turn around on time. The summit is optional; the return is mandatory. '
        'If you set a turnaround time of 1 PM, honour it regardless of how close the top feels. '
        'The mountain will be there next time.',
        '8. Pack the ten essentials: navigation, sunscreen, insulation, illumination, '
        'first aid, fire-starting, repair tools, nutrition, hydration, and emergency shelter. '
        'Every item has prevented a death somewhere.',
        '9. Pace yourself like a conversation. If you cannot hold a conversation while '
        'hiking, you are going too fast. The "conversational pace" is the most sustainable '
        'aerobic effort for long days — you will cover far more ground than if you sprint early.',
        '10. The outdoors is not trying to kill you, but it will not save you either. '
        'Self-reliance, preparation, and humility are the three habits that separate the '
        'hikers who do this for decades from the ones who have one bad experience and stop.',
      ],
    ),
    OutdoorArticle(
      id: 'a_altitude',
      title: 'Understanding Altitude Sickness',
      author: 'ORC SUSL Team',
      readTime: '4 min read',
      category: 'Health',
      categoryColor: Color(0xFFE53935),
      icon: Icons.monitor_heart_outlined,
      intro:
          'Altitude sickness is democratic — it strikes fit athletes and unfit beginners alike. '
          'It is determined by genetics and ascent rate, not physical fitness.',
      paragraphs: [
        'Acute Mountain Sickness (AMS) occurs when you ascend faster than your body can '
        'acclimatise to the reduced oxygen partial pressure at altitude. Symptoms typically '
        'begin 4–12 hours after arriving at a new elevation above 2500 m: headache, nausea, '
        'fatigue, dizziness, and difficulty sleeping. These are not signs of weakness — they '
        'are a normal physiological response to hypoxia.',
        'The golden rule of altitude: never ascend to sleep at a new altitude if symptoms are '
        'present. The widely used guideline is "climb high, sleep low" — you can go higher '
        'during the day but must return to a lower camp to sleep. Above 3000 m, limit your '
        'daily gain in sleeping altitude to 300–500 m per day, with a rest day every 3 days.',
        'High Altitude Pulmonary Oedema (HAPE) and High Altitude Cerebral Oedema (HACE) '
        'are life-threatening complications. HAPE symptoms include breathlessness at rest, '
        'a wet cough, and extreme fatigue. HACE symptoms include loss of coordination '
        '(the ataxia test — walking heel-to-toe in a straight line — is the key field test), '
        'severe headache, and confusion. Both require immediate descent of at least 500 m.',
        'The only definitive treatment for any altitude illness is descent. Supplemental '
        'oxygen and medications (acetazolamide, dexamethasone, nifedipine) buy time '
        'but are not substitutes for descent. A portable altitude chamber (Gamow bag) '
        'simulates descent and can be life-saving in remote settings.',
      ],
    ),
    OutdoorArticle(
      id: 'a_weatherread',
      title: 'The Art of Reading Mountain Weather',
      author: 'ORC SUSL Team',
      readTime: '5 min read',
      category: 'Weather',
      categoryColor: Color(0xFFF57F17),
      icon: Icons.cloud_queue_outlined,
      intro:
          'Every mountain has its own weather personality. Learning to read it — without a phone '
          'signal — is a skill that has saved lives and turned retreats into summits.',
      paragraphs: [
        'Clouds are the primary observable data source for real-time mountain weather assessment. '
        'Cumulus clouds — flat-based, vertical development — are the most important to watch. '
        'Small, detached cumulus in the morning is normal. Cumulus that builds vertically and '
        'darkens at the base by late morning signals afternoon convective storm development. '
        'Once the anvil-shaped cumulonimbus top appears, lightning is imminent.',
        'Lenticular clouds (lens-shaped, stationary, over peaks) indicate extreme high-altitude '
        'winds. They form when moist air is forced upward by a mountain, cools, and condenses. '
        'The cap may look stationary but represents continuous air streaming through it at speeds '
        'well above 100 km/h at summit elevation — conditions lethal for exposed ridge travel.',
        'Wind is the most reliable short-term weather predictor in the mountains. '
        'A wind shift from south-westerly to north-westerly in the northern hemisphere typically '
        'indicates a cold front passage — clearing follows, but often with a short period of '
        'heavy rain or hail at the front boundary. A steady increase in wind speed without '
        'a shift indicates deepening low pressure — conditions will worsen.',
        'The barometer (or barometric function on most altimeter watches) provides the '
        'most reliable medium-term forecast tool available without satellite data. '
        'A fall of more than 3 hPa in 3 hours indicates a rapidly approaching storm. '
        'A slow, steady fall over 6–12 hours indicates a gradual weather deterioration. '
        'Rising pressure after a storm almost always means improving conditions are guaranteed.',
      ],
    ),
  ];

  // ── Tips ──────────────────────────────────────────────────
  static const List<TipCategory> tipCategories = [
    TipCategory(
      id: 'tc_packing',
      title: 'Smart Packing',
      icon: Icons.backpack_outlined,
      color: Color(0xFF1A7A6E),
      bgColor: Color(0xFFE0F2F1),
      tips: [
        'Pack heaviest items (tent, food, water) closest to your spine and as high as possible — this keeps the centre of gravity over your hips.',
        'Roll soft items (clothing, sleeping bag liner) and pack them into voids around rigid gear — it takes 20–30% less space.',
        'Store items you will need mid-hike (snacks, rain jacket, map) in the lid pocket or top of the main compartment.',
        'Use a colour-coded stuff sack system: red = first aid, blue = shelter, yellow = food. You find things in seconds even in the dark.',
        'Weigh your pack on a bathroom scale before every trip — aim for under 10 kg for a day hike and under 15 kg for a 3-day trip.',
        'Freeze dinner portions the night before a multi-day trip — they serve as ice packs and are ready to cook by dinnertime.',
        'A dry bag inside your main compartment protects sleeping gear if it rains — even if your pack has a rain cover.',
      ],
    ),
    TipCategory(
      id: 'tc_nav',
      title: 'Navigation Tips',
      icon: Icons.explore_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
      tips: [
        'Always download offline maps (Gaia GPS, Maps.me) before leaving cell coverage — never rely on cached data alone.',
        'Take a photo of the trailhead sign and map board with your phone at the start of every hike.',
        'Identify three or four "catching features" before departure — landmarks (river, road, ridge) that tell you immediately if you have gone too far.',
        'If you are unsure of your position, stop and think. Continuing further in the wrong direction always makes the problem worse.',
        'Note your compass bearing at every major trail junction — knowing your back-bearing lets you return immediately if needed.',
        'On cloudy days, remember: moss grows on all sides of a tree in humid climates — the old "moss grows north" rule is unreliable.',
        'Plan your navigation in 15-minute segments — check your position against the map at every natural break or junction.',
      ],
    ),
    TipCategory(
      id: 'tc_shelter',
      title: 'Camp & Shelter',
      icon: Icons.night_shelter_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
      tips: [
        'Pitch your tent with the back (lowest wind profile end) facing the prevailing wind — the door should face downwind.',
        'A footprint adds only 200–300 g to your pack but triples the life of your tent floor — it is worth every gram.',
        'Stake all guylines even if the sky is clear when you pitch — winds change overnight and a collapsed tent at 2 AM is miserable.',
        'Condensation inside a tent means humidity, not a leaky rainfly — improve ventilation by cracking the door or mesh a few centimetres.',
        'Inflate sleeping pads with your breath only as a last resort — moisture from breath condenses inside the pad and causes mildew.',
        'If you wake up cold at night, do not add clothing first — eat a high-calorie snack. Your body needs fuel to generate heat.',
        'Dig a shallow channel around the uphill side of your tent if heavy rain is expected — it redirects water away before it pools under the footprint.',
      ],
    ),
    TipCategory(
      id: 'tc_food',
      title: 'Food & Water',
      icon: Icons.water_drop_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
      tips: [
        'Eat before you feel hungry and drink before you feel thirsty — by the time you feel either, you are already behind.',
        'Calorie density is the key backpacking food metric: target 100 kcal per 30 g of food weight for efficiency.',
        'Nuts, nut butter, dark chocolate, and hard cheese are the highest calorie-to-weight trail foods without special preparation.',
        'Freeze-dried meals require full boiling water — in cold or high-altitude conditions, use a pot cosy to keep them hot while they rehydrate.',
        'Electrolyte loss (sodium and potassium) causes fatigue, cramps, and nausea in hot weather — carry salt tablets or electrolyte drops.',
        'If a water source looks questionable, filter AND chemically treat it — the combined approach handles all pathogens including viruses.',
        'Set a water alarm: drink 250 ml every 30 minutes of active hiking, not just when you stop. Consistent small intake beats large infrequent drinks.',
      ],
    ),
    TipCategory(
      id: 'tc_safety',
      title: 'Safety & Emergency',
      icon: Icons.verified_user_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
      tips: [
        'The single most effective safety measure is a pre-departure plan left with a non-hiking contact — name, route, expected return time, when to call SAR.',
        'Carry a whistle on every outdoor outing regardless of trip length — three blasts is the universal distress signal.',
        'If you are lost: S.T.O.P. — Stop moving. Think about where you last knew your position. Observe landmarks. Plan your next action.',
        'Never separate from your group in poor visibility or technical terrain — a solo casualty without a companion is a dramatically higher-risk scenario.',
        'Signal fires (three fires in a triangle, or one large one with green branches for white smoke) are visible from aircraft up to 5 km away in clear air.',
        'A space/emergency blanket takes 20 seconds to open and has prevented hundreds of hypothermia deaths — pack one on every hike.',
        'Know how to operate your PLB or satellite communicator before you need it in an emergency — practise the activation sequence at home.',
      ],
    ),
  ];

  // ── Videos ────────────────────────────────────────────────
  static const List<LearnVideo> videos = [
    LearnVideo(
      id: 'lv_topo',
      title: 'How to Read a Topographic Map',
      description:
          'Master contour lines, map symbols, and how to translate the flat map into the 3D terrain around you.',
      duration: '11 min',
      youtubeVideoId: 'nKf8b-mrNnI',
      category: 'Navigation',
      categoryColor: Color(0xFF1565C0),
      keyPoints: [
        'Contour lines connect points of equal elevation — the closer they are, the steeper the slope.',
        'Index contours (the labelled, darker lines) make reading elevation fast — count intervals from the nearest index line.',
        'A "V" shape pointing uphill = valley or stream; pointing downhill = ridge or spur.',
        'The map scale tells you the real-world distance each centimetre represents — always know your scale before navigating.',
      ],
    ),
    LearnVideo(
      id: 'lv_compass',
      title: 'How to Use a Baseplate Compass',
      description:
          'Take a bearing, follow it in the field, and triangulate your position using a map and compass.',
      duration: '9 min',
      youtubeVideoId: '5_RJNdduvOs',
      category: 'Navigation',
      categoryColor: Color(0xFF1565C0),
      keyPoints: [
        'Magnetic north ≠ True north — always apply your local magnetic declination.',
        'Point the direction-of-travel arrow at your target before rotating the bezel.',
        'The compass works best when held flat at waist height, away from metal objects.',
        'Back-bearing (bearing ± 180°) lets you navigate back to your last known position.',
      ],
    ),
    LearnVideo(
      id: 'lv_lnt',
      title: 'Leave No Trace Principles',
      description:
          'The seven principles of responsible outdoor ethics explained with real backcountry examples.',
      duration: '8 min',
      youtubeVideoId: '7v49n_wTFjY',
      category: 'Ethics',
      categoryColor: Color(0xFF2D6A4F),
      keyPoints: [
        'Plan ahead — regulations, weather, and waste management are pre-trip responsibilities.',
        'Travel on durable surfaces — rock, gravel, and established trails handle heavy use without lasting damage.',
        'Dispose of waste properly — pack out everything you pack in, including food scraps and wrappers.',
        'Campfires have permanent environmental impacts — a stove is almost always a better choice.',
      ],
    ),
    LearnVideo(
      id: 'lv_water',
      title: 'How to Purify Backcountry Water',
      description:
          'Filter vs. chemical vs. UV treatment — understand the pathogens, the methods, and when to use each.',
      duration: '7 min',
      youtubeVideoId: 'gMG0fq8i8gI',
      category: 'Survival',
      categoryColor: Color(0xFF0097A7),
      keyPoints: [
        'Filters remove bacteria and protozoa but NOT viruses — know the risk level of your destination.',
        'Chlorine dioxide tablets are the most reliable backup — they kill everything at the right dose and contact time.',
        'UV purification (SteriPen) requires clear water — turbidity blocks UV and allows pathogens to survive.',
        'Boiling is the universal fallback — 1 minute at sea level, 3 minutes above 2000 m.',
      ],
    ),
    LearnVideo(
      id: 'lv_tent',
      title: 'How to Set Up a Backpacking Tent',
      description:
          'From site selection to final guylines — a complete tent pitching guide for any conditions.',
      duration: '10 min',
      youtubeVideoId: 'KmJq-nz4XBs',
      category: 'Equipment',
      categoryColor: Color(0xFF1A7A6E),
      keyPoints: [
        'Orient the low-profile end (back) into the prevailing wind to reduce stress on poles and fabric.',
        'Use all stake points and guylines — even in calm conditions, night winds arrive without warning.',
        'A footprint under the tent protects the floor and extends its life by several seasons.',
        'Practice pitching at home before any trip — struggling with pole setup in rain and wind is avoidable.',
      ],
    ),
    LearnVideo(
      id: 'lv_firstaid',
      title: 'Wilderness First Aid Basics',
      description:
          'Scene assessment, primary survey, and the initial management of common backcountry emergencies.',
      duration: '13 min',
      youtubeVideoId: 'ZqKTZyqfHtw',
      category: 'Safety',
      categoryColor: Color(0xFFE53935),
      keyPoints: [
        'Scene safety first — never approach until the hazard is identified and controlled.',
        'Primary survey: Airway → Breathing → Circulation → Severe bleeding — in exactly that order.',
        'A tourniquet applied early for arterial bleeding saves lives — tourniquet delay is the real danger.',
        'Call for evacuation early — the sooner you activate emergency services, the more options they have.',
      ],
    ),
  ];

  // ── Quiz ──────────────────────────────────────────────────
  static const List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question:
          'What does "30% chance of rain" in a weather forecast actually mean?',
      options: [
        '30% of the day will have rain',
        'It will rain for 30 minutes',
        '3 out of 10 days with similar conditions see rain',
        '30% of the forecast area will see rain',
      ],
      correctIndex: 2,
      explanation:
          'Precipitation probability refers to the likelihood that at least 0.2 mm of rain will fall at a given point — statistically, 3 out of 10 days with these atmospheric conditions will produce measurable rain.',
    ),
    QuizQuestion(
      question:
          'You hear thunder. What is the correct immediate action on an exposed ridge?',
      options: [
        'Wait 30 minutes to see if it gets closer',
        'Descend immediately below treeline and away from ridges',
        'Crouch down low on the ridge',
        'Take shelter under the largest tree nearby',
      ],
      correctIndex: 1,
      explanation:
          'If you can hear thunder, you are within lightning strike range. Immediately descend from ridges, peaks, and open ground. Avoid isolated tall trees, open water, and metallic objects. Seek shelter in a low-lying area or vehicle.',
    ),
    QuizQuestion(
      question:
          'Which of these is the MOST reliable field sign of an approaching storm?',
      options: [
        'Temperature drop of 2°C',
        'A lenticular cloud forming over the summit',
        'Barometric pressure falling more than 3 hPa per hour',
        'Cirrus clouds appearing overhead',
      ],
      correctIndex: 2,
      explanation:
          'A rapid barometric pressure fall (>3 hPa/hour) is the most reliable indicator of imminent severe weather across all environments. Cirrus clouds indicate high-altitude moisture but not necessarily imminent storms. Lenticular clouds signal high winds at altitude.',
    ),
    QuizQuestion(
      question: 'What does the STOP acronym stand for in a lost-person scenario?',
      options: [
        'Search, Track, Orient, Plan',
        'Stay, Think, Observe, Plan',
        'Signal, Trail, Overnight, Position',
        'Shelter, Tools, Organisation, Priority',
      ],
      correctIndex: 1,
      explanation:
          'STOP: Stop moving immediately. Think about the last point where you knew your exact position. Observe your surroundings for landmarks that appear on your map. Plan your next deliberate action — including whether to stay put and signal or navigate to a known feature.',
    ),
    QuizQuestion(
      question:
          'What is the minimum safe distance from a water source to dig a cat hole?',
      options: [
        '10 metres',
        '30 metres',
        '60 metres',
        '100 metres',
      ],
      correctIndex: 2,
      explanation:
          'LNT guidelines specify that human waste should be deposited at least 60 metres (approximately 70 adult steps) from any water source, trail, or campsite. Cat holes should be 15–20 cm deep in mineral soil and covered and disguised after use.',
    ),
    QuizQuestion(
      question:
          'A hollow-fibre water filter (like the Sawyer Squeeze) removes which of these?',
      options: [
        'Bacteria and protozoa only',
        'Bacteria, protozoa, and viruses',
        'Viruses only',
        'Chemical pollutants and heavy metals',
      ],
      correctIndex: 0,
      explanation:
          'Standard hollow-fibre filters (0.1–0.2 micron pore size) remove bacteria and protozoa (including giardia and cryptosporidium) but DO NOT remove viruses. In high-risk areas (tropical regions, areas with upstream human settlements), also use chemical treatment to address viral risk.',
    ),
    QuizQuestion(
      question:
          'When packing a backpack, where should the heaviest items be placed?',
      options: [
        'At the bottom of the pack, as low as possible',
        'At the top of the pack, as high as possible',
        'Close to your spine in the middle-upper zone of the pack',
        'In the external pockets for easy access',
      ],
      correctIndex: 2,
      explanation:
          'Heavy items (tent body, food, water) should be packed close to your spine and in the middle-upper zone of the pack. This keeps the centre of gravity over your hips (where the hip belt transfers the load) rather than pulling you backward, which dramatically reduces fatigue on long hikes.',
    ),
    QuizQuestion(
      question:
          'What is the most reliable indicator that someone has heat stroke (not heat exhaustion)?',
      options: [
        'Heavy sweating and pale, clammy skin',
        'Mild headache and thirst',
        'Hot dry skin and altered mental state (confusion)',
        'Muscle cramps in the legs',
      ],
      correctIndex: 2,
      explanation:
          'Heat stroke is characterised by a core temperature above 40°C, often with hot dry skin (sweating mechanism fails) and altered mental state (confusion, slurred speech, loss of consciousness). This is a medical emergency requiring immediate aggressive cooling and evacuation. Heat exhaustion presents with heavy sweating and cool, clammy skin.',
    ),
    QuizQuestion(
      question: 'What is "magnetic declination" and why does it matter for navigation?',
      options: [
        'The difference between your map bearing and the actual trail bearing',
        'The difference between magnetic north (compass) and true north (map)',
        'The compass error caused by nearby metal objects',
        'The angle between your direction of travel and the wind direction',
      ],
      correctIndex: 1,
      explanation:
          'Magnetic declination is the angle between magnetic north (where your compass needle points — toward the magnetic pole) and true north (the direction to the geographic North Pole, which maps are drawn toward). If you do not apply the correct declination for your location, every bearing you take will be systematically wrong by that angle.',
    ),
    QuizQuestion(
      question:
          'You encounter a fast-moving stream at knee height. What should you do?',
      options: [
        'Cross quickly — speed reduces your time in the water',
        'Cross by holding onto a rope strung across the stream',
        'Find a safer crossing or wait — knee-height fast water can knock an adult down',
        'Remove your boots to improve grip on the streambed',
      ],
      correctIndex: 2,
      explanation:
          'Fast-moving water is deceptive. As little as 15 cm of swift-flowing water can knock an adult off their feet. Knee-height fast current represents a potentially fatal crossing risk. Always seek a shallower, slower, wider crossing point. If no safe crossing exists, shelter and wait, or turn back.',
    ),
  ];
}
