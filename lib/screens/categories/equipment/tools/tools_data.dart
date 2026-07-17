import 'package:flutter/material.dart';
import '../equipment_model.dart';

class ToolsData {
  static const List<EquipmentSubCategory> categories = [
    EquipmentSubCategory(
      id: 'tool_navigation',
      title: 'Navigation Tools',
      subtitle: 'Maps, compasses, and GPS for route-finding.',
      icon: Icons.explore_outlined,
      color: Color(0xFF1A7A6E),
      bgColor: Color(0xFFE0F2F1),
    ),
    EquipmentSubCategory(
      id: 'tool_lighting',
      title: 'Lighting & Headlamps',
      subtitle: 'Headlamps, lanterns, and backup lighting systems.',
      icon: Icons.flashlight_on_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    EquipmentSubCategory(
      id: 'tool_knives',
      title: 'Knives & Multi-tools',
      subtitle: 'Field cutting, repair, and utility tools.',
      icon: Icons.handyman_outlined,
      color: Color(0xFF5D4037),
      bgColor: Color(0xFFEFEBE9),
    ),
    EquipmentSubCategory(
      id: 'tool_rope',
      title: 'Rope & Cordage',
      subtitle: 'Paracord, climbing ropes, and bear hang lines.',
      icon: Icons.cable_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
    EquipmentSubCategory(
      id: 'tool_repair',
      title: 'Repair Kit',
      subtitle: 'Field repairs for gear, tent, footwear, and clothing.',
      icon: Icons.build_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
    ),
    EquipmentSubCategory(
      id: 'tool_hygiene',
      title: 'Hygiene & Sanitation',
      subtitle: 'Leave No Trace waste management and personal hygiene.',
      icon: Icons.sanitizer_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
  ];

  static const List<EquipmentGuide> guides = [
    EquipmentGuide(
      id: 'tool_navigation_guide',
      subCategoryId: 'tool_navigation',
      title: 'Navigation Tools Checklist',
      description:
          'Navigation is a fundamental survival skill that electronic devices alone cannot reliably provide. '
          'GPS devices fail when batteries die, satellite signals are unavailable, or screens crack. '
          'A map and compass require no power, no signal, and never lose their function in any condition.',
      essentialItems: [
        'Topographic map (waterproofed or in a zip-lock bag) of the full route area',
        'Baseplate compass (Suunto A-10 or Silva Ranger equivalent)',
        'Knowledge of how to take and follow a bearing (practice before the trip)',
        'GPS device or smartphone with offline maps (Maps.me, Gaia GPS with downloaded tiles)',
        'Fully charged power bank for electronic navigation devices',
        'Route notes (written turn-by-turn description of key navigational waypoints)',
        'Emergency contacts list with grid references for the trailhead',
      ],
      niceToHaveItems: [
        'Dedicated GPS unit (Garmin inReach or eTrex — significantly more battery-efficient than smartphone GPS)',
        'Satellite communicator with two-way messaging (Garmin inReach — allows SOS signalling with GPS coordinates)',
        'Altimeter watch (useful cross-reference against topographic map elevation contours)',
        'Declination card for the specific region (magnetic declination varies significantly by location)',
        'Waterproof map case with grid reference tool',
        'Additional 1:25,000 scale maps for areas of complex terrain',
      ],
      buyingTips: [
        'A baseplate compass with a rotating bezel and declination adjustment is the minimum functional specification for backcountry use.',
        'Gaia GPS (iOS/Android) with a downloaded offline map of your entire route is one of the best navigation investments available.',
        'Garmin inReach devices provide true two-way satellite communication — they can call for rescue and receive confirmation, unlike PLBs.',
        'Always carry paper maps regardless of how reliable your electronic navigation system appears — screens crack, batteries die.',
        'Print and laminate key sections of your topographic map if you do not have a waterproof map — wet paper maps become unreadable.',
      ],
      careTips: [
        'Clean compass housing and bezel after muddy trips with warm water and a soft cloth — grit in the bezel prevents accurate readings.',
        'Test compass accuracy periodically by comparing its north bearing against a known landmark — the fluid-filled capsule can develop air bubbles over time.',
        'Charge GPS devices and update maps and firmware before every trip — outdated maps can contain significant errors.',
        'Store topographic maps flat (not folded into the same crease lines every time) — map folds become tears over time.',
        'Calibrate altimeter watches at a known elevation point at the start of every trip — atmospheric pressure changes affect calibration.',
      ],
    ),
    EquipmentGuide(
      id: 'tool_lighting_guide',
      subCategoryId: 'tool_lighting',
      title: 'Lighting & Headlamps Checklist',
      description:
          'A headlamp is the single most critical piece of safety equipment on any trip that extends past daylight hours. '
          'It provides hands-free light for navigation, camp chores, emergency response, and signalling. '
          'Always carry a backup light source on any overnight or multi-day trip.',
      essentialItems: [
        'Primary headlamp (minimum 200 lumens, 40+ hours runtime on medium setting)',
        'Spare batteries for the headlamp (lithium batteries last significantly longer in cold conditions)',
        'Backup light — compact key-ring LED torch or secondary headlamp',
        'Red-light mode capability (preserves night vision and does not disturb sleeping companions)',
        'High-beam mode (minimum 300 lumens for route-finding and emergency signalling)',
      ],
      niceToHaveItems: [
        'Camp lantern (360° light output for tent, cooking area, and social use)',
        'Solar lantern (Luci-style collapsible — charges by day, provides ambient light by night)',
        'Rechargeable headlamp with micro-USB or USB-C charging (reduces battery waste on long trips)',
        'Headlamp with a lock mode (prevents accidental battery drain in a pack)',
        'Headlamp with battery level indicator',
      ],
      buyingTips: [
        'USB-C rechargeable headlamps (Black Diamond Spot Rechargeable, Petzl Actik Core) eliminate battery carry on long trips — one power bank charges all devices.',
        'An IPX4 (splash-proof) or IPX7 (submersible) rating is important for use in rain, heavy snow, and humid conditions.',
        'A tiltable lamp head is an ergonomic necessity — a fixed lamp pointing straight ahead is useless for cooking or reading in camp.',
        'On long trips, lithium AA batteries have 2–3x the shelf life and capacity of alkaline batteries in cold temperatures — buy lithium.',
        '300–500 lumen maximum output is adequate for all hiking needs — very high lumen ratings (1000+) drain batteries extremely fast.',
      ],
      careTips: [
        'Remove batteries before long-term storage — alkaline batteries leak corrosive fluid when stored in devices, permanently damaging the contacts.',
        'Clean battery contacts with a pencil eraser if they show white oxidation — oxidised contacts prevent good electrical connection.',
        'Dry the headlamp and the elastic headband separately before storing — damp elastic loses elasticity and breaks down faster.',
        'Test your headlamp the evening before departure — this is the most commonly overlooked pre-trip equipment check.',
        'Replace the elastic strap if it shows cracking or hardening — a broken strap in the dark is a disproportionately frustrating equipment failure.',
      ],
    ),
    EquipmentGuide(
      id: 'tool_knives_guide',
      subCategoryId: 'tool_knives',
      title: 'Knives & Multi-tools Checklist',
      description:
          'A sharp knife is one of the most versatile and valuable tools in the field. '
          'A good outdoor knife handles food preparation, cordage cutting, gear repair, and emergency first aid tasks. '
          'A multi-tool extends this capability to screwdrivers, pliers, saws, and files in a single compact package.',
      essentialItems: [
        'Fixed-blade or folding camp knife (blade length 9–12 cm, full-tang construction)',
        'Knife sheath or locking blade mechanism',
        'Whetstone or ceramic sharpening rod (a dull knife is more dangerous than a sharp one)',
        'Multi-tool with pliers (Leatherman Wave+ or equivalent)',
        'SAK Swiss Army Knife (lightweight supplementary tool for camp use)',
      ],
      niceToHaveItems: [
        'Folding saw (Silky Pocketboy or Bahco Laplander — far more efficient than a knife for wood processing)',
        'Hatchet or compact axe (car camping or base camp use with significant wood processing needs)',
        'Diamond sharpening card (credit-card size, fits in wallet)',
        'Pruning scissors',
        'Rescue knife with glass breaker and seatbelt cutter (for vehicle-based emergency use)',
      ],
      buyingTips: [
        'Full-tang construction (blade steel extending the full length of the handle) is structurally stronger than partial-tang designs.',
        'Stainless steel is more corrosion-resistant; high-carbon steel takes and holds a sharper edge but requires oiling to prevent rust.',
        'A locking blade on a folding knife is a safety non-negotiable — non-locking blades can close unexpectedly under pressure.',
        'Leatherman multi-tools carry a 25-year warranty and are genuinely repairable — worth the investment over cheaper alternatives.',
        'A folding saw (50 g) is far more efficient at processing firewood than a knife — for wood-fire camps, carry both.',
      ],
      careTips: [
        'Dry and lightly oil all blade surfaces after field use — water and organic matter cause rust on all carbon and some stainless steel grades.',
        'Sharpen regularly — a properly maintained edge requires far less force (and therefore causes far fewer accidents) than a dull blade.',
        'Oil multi-tool plier joints and folding mechanisms with lightweight machine oil (3-in-1 or similar) every 3–4 trips.',
        'Clean all blade mechanisms and locks with a soft brush — grit in a locking mechanism prevents the blade from locking safely.',
        'Store knives and multi-tools loosely in a dry cloth bag, not in a sealed plastic container that traps moisture.',
      ],
    ),
    EquipmentGuide(
      id: 'tool_rope_guide',
      subCategoryId: 'tool_rope',
      title: 'Rope & Cordage Checklist',
      description:
          'Rope and cordage have countless applications in the backcountry: hanging food, rigging tarps, '
          'improvised repairs, rescue, and stream crossing assistance. Having multiple types and lengths available '
          'makes camp setup, food storage, and emergency rigging dramatically more effective.',
      essentialItems: [
        '50 m paracord 550 (7-strand kernmantle construction — essential for bear hangs and tarp rigging)',
        '10 m lightweight dyneema or spectra cord (ultra-high-strength fine cord for guy-lines)',
        '3 x locking carabiners (HMS or oval pear-shape for rope work)',
        'Adjustable line tensioners / line-locks (for taut tarp rigging and clothes lines)',
        'Prusik loops (3 mm cord for friction hitches)',
      ],
      niceToHaveItems: [
        '20 m dynamic climbing rope (for technical scrambles or glacier travel)',
        'Rope bag (prevents tangling during carry and deployment)',
        'Mini pulley set (for mechanical advantage in rescue scenarios)',
        'Webbing (25 mm — for anchors, lashing, and improvised harness)',
        'Zip ties (multiple sizes — highly useful for fast improvised repairs)',
        'Shock cord / bungee (10 m — useful for tent rigging and pack repairs)',
      ],
      buyingTips: [
        '550 paracord (breaking strength 249 kg) is the most versatile hiking cordage — carry a minimum 50 m on any multi-day trip.',
        'Dyneema or Spectra cord is 3–5x stronger than paracord at the same diameter and weight — ideal for structural applications like bear hangs.',
        'Reflective guy-line cord is significantly safer than standard cord — it is visible at night under headlamp light and prevents tripping.',
        'Locking carabiners (not snap-links) should be used for any safety-critical rope application.',
        'Pre-cut and bag specific-length cords for recurring applications (e.g., a 10 m bear hang cord kept in its own bag).',
      ],
      careTips: [
        'Rinse all cordage with fresh water after use near salt water or in heavily silted stream crossings — salt and grit abrade fibres.',
        'Store rope and cordage loosely coiled in mesh bags — tight coils introduce permanent kinks and weaken the fibres over time.',
        'Inspect all cordage for fraying, core damage (bumps or flat spots suggest core breakage), and UV fading annually.',
        'Retire any cord that shows significant UV fading, core damage, or has been shock-loaded — the safety margin is gone.',
        'Keep carabiner gates clean and lightly lubricated — a stiff gate that does not spring shut completely is unsafe for rope applications.',
      ],
    ),
    EquipmentGuide(
      id: 'tool_repair_guide',
      subCategoryId: 'tool_repair',
      title: 'Field Repair Kit Checklist',
      description:
          'A well-stocked repair kit can save a trip from being cut short. Tent pole failures, boot sole separations, '
          'torn clothing, and pack strap failures are all field-repairable with the right materials and a small amount '
          'of know-how. The best repair kit is one you practice using before you need it in the field.',
      essentialItems: [
        'Tent pole repair sleeve (aluminium — fits over broken pole sections)',
        'Patch tape (self-adhesive silnylon and standard ripstop fabric)',
        'Seam sealer (small tube — reseals delaminated tent seams)',
        'Heavy-duty needle and upholstery thread (for stitching pack straps, tent webbing)',
        'Assorted zip ties (2.5 mm and 4 mm — infinite applications)',
        'Duct tape (wrapped 2 m around a trekking pole or water bottle to save space)',
        'Safety pins (6 assorted sizes)',
        'Spare buckles (25 mm and 38 mm hip belt and sternum strap buckles)',
        'Boot adhesive (Shoe Goo or Freesole — bonds sole separations)',
        'Spare cord (2 m lightweight cord for pack repair)',
      ],
      niceToHaveItems: [
        'Small awl for stitching through thick materials',
        'Fibre-Fix epoxy repair wrap',
        'Sleeping pad patch kit (dedicated self-adhesive patch set for inflatable pads)',
        'Gore-TEX repair tape (for hardshell jacket tears)',
        'Spare zipper slider (for field re-threading of failed jacket zippers)',
        'Beeswax for zipper lubrication',
        'Heat-shrink tubing (for cable and pole repair)',
      ],
      buyingTips: [
        'Tenacious Tape is the most versatile single repair material — it bonds to tents, packs, jackets, sleeping pads, and footwear.',
        'Shoe Goo (or Freesole) is specifically formulated for rubber-to-leather and sole-to-upper bonds — no substitute works as well.',
        'Pre-assemble your repair kit using a lightweight stuff sack — a dedicated kit is always packed, nothing is forgotten.',
        'Practice tent pole sleeve repair at home before you need it — the technique is straightforward but knowing it saves considerable time in the field.',
        'Include 2 m of Gorilla tape in addition to duct tape — Gorilla tape holds significantly better on smooth, wet surfaces.',
      ],
      careTips: [
        'Check the repair kit before each trip and replace any consumed items immediately.',
        'Keep the seam sealer tube sealed with a rubber band — the nozzle clogs with hardened sealer between uses.',
        'Keep Shoe Goo and Boot adhesive stored at room temperature — cold temperatures make adhesives brittle and ineffective.',
        'Replace thread that shows any colour fading or brittleness — UV-degraded thread breaks under minimal tension.',
        'Test the pole repair sleeve on your actual pole diameter before the trip — sleeves come in multiple diameters and a mismatch is useless.',
      ],
    ),
    EquipmentGuide(
      id: 'tool_hygiene_guide',
      subCategoryId: 'tool_hygiene',
      title: 'Hygiene & Sanitation Checklist',
      description:
          'Personal hygiene and waste management in the backcountry protects your health, protects water quality, '
          'and preserves the experience for all future visitors. Leave No Trace principle 3 — "Dispose of Waste Properly" — '
          'is the foundation of all backcountry hygiene practice.',
      essentialItems: [
        'Toilet trowel (cat-hole digging — minimum 15–20 cm deep, 60 m from water/camp/trail)',
        'Biodegradable toilet paper in a sealable bag',
        'Pack-out bag system (Leave No Trace requires packing out all waste in some areas)',
        'Biodegradable camp soap (Dr. Bronner\'s concentrated is a single-item solution for dishes, hands, and body)',
        'Hand sanitiser (80% ethanol — immediate pre-meal hand sanitation)',
        'Small towel or pack towel (microfibre — dries in 1–2 hours)',
        'Toothbrush and biodegradable toothpaste',
        'Menstrual products (where applicable) with odour-proof pack-out bags',
        'Personal prescription medications in waterproof container',
      ],
      niceToHaveItems: [
        'Camp shower bag (solar-heated — provides a warm rinse after multi-day trips)',
        'Portable wash basin (collapsible 8 L — for washing clothes and doing dishes at camp)',
        'Freshette or travel urinal device',
        'Foot powder (prevents blisters and athlete\'s foot on long trips)',
        'Anti-chafe balm (Body Glide or equivalent)',
        'Compact nail clippers',
        'Small mirror (for wound inspection and signalling)',
      ],
      buyingTips: [
        'A lightweight aluminium trowel weighs under 30 g and is indefinitely reusable — there is no justification for not carrying one.',
        'Concentrated biodegradable soap (like Dr. Bronner\'s) is multi-purpose — dishes, hands, and body from one small bottle.',
        'WAG (Waste Alleviation and Gelling) bags are the standard pack-out system in areas requiring full waste pack-out.',
        'Microfibre towels that measure 40 x 80 cm weigh under 80 g and dry in 30 minutes — carry one regardless of trip duration.',
        'Hand sanitiser at minimum 60% alcohol is required for effective pathogen kill — avoid weaker formulations.',
      ],
      careTips: [
        'Always wash hands before handling food and after waste disposal — field hygiene discipline prevents the most common backcountry illnesses.',
        'Scatter grey water (dishwater and wash water) at least 60 m from any water source and campsite.',
        'Replace toilet paper supply before each trip — a run-out mid-trip requires improvisation that is unpleasant for everyone.',
        'Clean the trowel after use with a small amount of dirt scrubbing — a separate small dirt bag prevents cross-contamination.',
        'Check expiry dates on all medications and hand sanitiser at the start of each season.',
      ],
    ),
  ];
}
