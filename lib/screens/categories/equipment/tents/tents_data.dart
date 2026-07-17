import 'package:flutter/material.dart';
import '../equipment_model.dart';

class TentsData {
  static const List<EquipmentSubCategory> categories = [
    EquipmentSubCategory(
      id: 'tent_solo',
      title: 'Solo Tent (1P)',
      subtitle: 'Ultra-compact shelters for solo backpackers.',
      icon: Icons.night_shelter_outlined,
      color: Color(0xFF2D6A4F),
      bgColor: Color(0xFFE8F5E9),
    ),
    EquipmentSubCategory(
      id: 'tent_duo',
      title: 'Duo Tent (2P)',
      subtitle: 'Balanced weight-to-space ratio for hiking pairs.',
      icon: Icons.people_outline,
      color: Color(0xFF1A7A6E),
      bgColor: Color(0xFFE0F2F1),
    ),
    EquipmentSubCategory(
      id: 'tent_group',
      title: 'Group Tent (3–4P)',
      subtitle: 'Shared shelter for small group camping.',
      icon: Icons.group_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    EquipmentSubCategory(
      id: 'tent_family',
      title: 'Family Tent (5P+)',
      subtitle: 'Spacious drive-in camping shelter with full standing height.',
      icon: Icons.family_restroom_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
    EquipmentSubCategory(
      id: 'tent_ultralight',
      title: 'Ultralight Shelter',
      subtitle: 'Tarps and cuben fibre shelters for gram-counters.',
      icon: Icons.grass_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    EquipmentSubCategory(
      id: 'tent_bivy',
      title: 'Bivy Sack',
      subtitle: 'Minimalist waterproof sleeping bag cover for emergency use.',
      icon: Icons.bedtime_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
    ),
  ];

  static const List<EquipmentGuide> guides = [
    EquipmentGuide(
      id: 'tent_solo_guide',
      subCategoryId: 'tent_solo',
      title: 'Solo Tent Setup Checklist',
      description:
          'A solo tent (1-person) is optimised for minimum packaged weight and volume. '
          'Most backpacking solo tents weigh 0.9–1.4 kg and pitch in under 10 minutes. '
          'Speed of setup and weatherproof performance matter far more than interior space.',
      essentialItems: [
        'Tent body and inner mesh',
        'Outer rainfly',
        'Tent poles (aluminium — count all segments before heading out)',
        'Tent stakes/pegs (minimum 8, plus spares)',
        'Footprint/groundsheet (protects the floor and extends tent life)',
        'Seam-sealed zipper check before first use',
        'Stuff sack or compression bag',
        'Repair kit (pole sleeve, patch tape, spare stake)',
        'Guyline cords (at least 4 — crucial in wind)',
      ],
      niceToHaveItems: [
        'Extra guylines and line tensioners',
        'Tent carpet or pack towel for muddy vestibule',
        'Gear loft organiser (clips inside to keep torch and phone reachable)',
        'Waterproofing spray for the rainfly',
        'Packable broom (brush dry mud off the floor before packing)',
        'Tent stakes bag (silnylon drawstring bag)',
      ],
      buyingTips: [
        'Target a packed weight under 1.4 kg for backpacking — above this and you feel it over long mileage days.',
        'Double-wall construction (inner + separate rainfly) provides vastly better condensation management than single-wall.',
        'Look for DAC Featherlight poles — they are the industry standard for lightweight strength and field-repairable design.',
        'Bathtub floor construction (waterproof material extends 15–20 cm up the walls) keeps groundwater out during heavy rain.',
        'At minimum 2000 mm hydrostatic head rating for the floor (3000 mm ideal) and 1500 mm for the rainfly.',
      ],
      careTips: [
        'Never pack the tent wet if you can avoid it — mildew permanently weakens both the waterproof coating and the mesh.',
        'Dry the tent completely before storage, ideally by pitching it one last time at home and letting it air out.',
        'Store poles loosely coiled (not shocks fully stretched) in their bag — this preserves shock cord elasticity.',
        'Apply seam sealer (silicone-based for silnylon tents, polyurethane for standard fabric) every 2–3 seasons.',
        'Replace broken pole sections individually rather than the whole set — DAC pole sections are sold separately.',
      ],
    ),
    EquipmentGuide(
      id: 'tent_duo_guide',
      subCategoryId: 'tent_duo',
      title: 'Duo Tent Setup Checklist',
      description:
          'A 2-person tent is the most versatile tent category — it can be carried solo (slightly heavy) '
          'or split between two people (poles + body with one, rainfly + footprint + stakes with the other). '
          'Look for a double vestibule design so both occupants have gear storage.',
      essentialItems: [
        'Tent body with inner mesh',
        'Rainfly (check all attachment clips before departure)',
        'Tent poles — separate carry bag with labelled colour coding',
        'Tent stakes (minimum 12 for a 2P tent)',
        'Footprint/groundsheet',
        'All guyline cords and tensioners',
        'Field repair kit (pole splint, patch tape, spare buckle)',
        'Stuff sack or compression bag',
      ],
      niceToHaveItems: [
        'Separate gear loft',
        'Tent lantern hook carabiner',
        'Footprint carry bag',
        'Tent storage bag (larger than the stuff sack) for home storage',
        'Broom or brush for cleaning the footprint',
        'Zipper lubricant (zipper wax)',
      ],
      buyingTips: [
        'A double vestibule design means both occupants have dedicated gear storage space outside the sleeping area.',
        'Two doors are essentially mandatory — a single-door 2P tent means one person always crawls over the other.',
        'Aim for a combined rainfly + body weight under 1.8 kg for backpacking; up to 2.5 kg for base camping is acceptable.',
        'Check the vestibule volume — it should comfortably accommodate two large backpacks plus wet boots.',
        'For 3-season use in a temperate climate, look for at least 30% mesh inner for good airflow to reduce condensation.',
      ],
      careTips: [
        'Before every trip, pitch the tent in the garden to confirm you have all components and the poles are undamaged.',
        'Remove shoes before entering — gravel and grit are the primary cause of bathtub floor damage.',
        'Dry and fold loosely for storage at home — tightly rolling compresses waterproof coatings and creates permanent crease lines.',
        'Spot-clean with cold water and a sponge — avoid detergents on the rainfly as they strip the DWR coating.',
        'Re-proof the rainfly when you notice water soaking in rather than beading — use Nikwax Tent & Gear SolarProof.',
      ],
    ),
    EquipmentGuide(
      id: 'tent_group_guide',
      subCategoryId: 'tent_group',
      title: 'Group Tent Setup Checklist',
      description:
          'A 3–4 person tent provides significantly more liveable space for small groups and is ideal for base camps '
          'or camping with children. Setup typically takes 15–20 minutes and should always be practiced at home '
          'before the trip.',
      essentialItems: [
        'Tent body (confirm seams are sealed)',
        'Rainfly',
        'All poles (colour-coded or number-coded to prevent mis-assembly in the dark)',
        'Stakes (minimum 16 for a 3–4P tent)',
        'Footprint',
        'Guylines (minimum 6)',
        'Repair kit and spare pole segment',
        'Mallet for driving stakes in hard or rocky ground',
      ],
      niceToHaveItems: [
        'Gear loft (dramatically increases usable interior space)',
        'Tent heater rated for enclosed spaces (check CO safety before use)',
        'Carpet/foam mat for vestibule',
        'Storage organiser pockets (hang from interior loops)',
        'Tent light/lantern',
        'Snow stakes or sand anchors for specific terrain types',
      ],
      buyingTips: [
        'Standing height in the centre of the tent transforms a group camp experience — look for a minimum 1.8 m peak height.',
        'Colour-coded or numbered poles are a critical feature — assembling a group tent incorrectly in the dark or rain is a genuine problem.',
        'A full coverage vestibule large enough to cook under during rain is an extremely valuable feature for group tents.',
        'Cabin-style wall shape (more vertical walls than dome) maximises living space per floor square metre.',
        'Check the number of stake points — more anchoring points means better wind stability, which matters for larger structures.',
      ],
      careTips: [
        'Designate a specific team member to pack the poles and a specific team member to pack the stakes on every trip.',
        'Zip all zippers before packing — loose zippers abrade against the tent fabric during transit and cause premature wear.',
        'The floor of a group tent takes more abuse than any other component — inspect it closely for any wear or thin spots.',
        'Clean the tent after each trip by brushing off loose dirt and wiping down the footprint with a wet cloth.',
        'Apply UV-protectant spray to the rainfly annually — large panels are exposed to substantially more UV than solo tent fabrics.',
      ],
    ),
    EquipmentGuide(
      id: 'tent_family_guide',
      subCategoryId: 'tent_family',
      title: 'Family Tent Setup Checklist',
      description:
          'A 5+ person family tent is a drive-in camping shelter designed for comfort rather than light weight. '
          'These tents often feature room dividers, large vestibules, and full standing height. '
          'Setup typically requires 20–30 minutes and two adults.',
      essentialItems: [
        'Tent body and inner rooms (check all divider curtains are included)',
        'Rainfly with full coverage over all sections',
        'All poles (pre-bent hub poles and flexible fibreglass wands)',
        'Stakes (minimum 20–24 for a large family tent)',
        'Heavy-duty groundsheet or interlocking foam mats for floor',
        'Guylines with reflective cord (visibility in the dark)',
        'Mallet',
        'Fan or ventilation clips for hot-weather camping',
      ],
      niceToHaveItems: [
        'Folding cots (keeps sleeping surfaces off cold ground)',
        'Tent light with hook attachment',
        'Cooler and camp kitchen placement plan',
        'Carpet runner for the tent floor',
        'Portable camp mat for vestibule / boot area',
        'Privacy room divider (if tent does not include one)',
        'Cable port patch (allows running a power extension into the tent)',
      ],
      buyingTips: [
        'Fibreglass poles come standard on budget family tents — aluminium poles cost more but last far longer and do not shatter in cold.',
        'A truly waterproof rainfly (hydrostatic head 2000 mm minimum) is non-negotiable — cheap rainflies fail in sustained rain.',
        'Multiple doors (at minimum 2 — one per sleeping section) prevent the midnight stumble past sleeping family members.',
        'Electrical cord ports are worth the small extra cost for sites with power supply.',
        'Pitch the tent before the trip, ideally with all family members, to identify any confusion with pole assembly.',
      ],
      careTips: [
        'Large family tents hold an enormous amount of condensation — plan a full dry-out day at home after every trip.',
        'Store the tent loosely in a large breathable cotton bag rather than the compression stuff sack provided.',
        'The sewn-in floor is the most vulnerable component — use a footprint and enforce a no-shoes rule strictly.',
        'Clean all fibreglass pole sections with a dry cloth — grit inside the pole ferrules causes them to split during assembly.',
        'Check the cable port seal annually — these are common water ingress points in heavy rain.',
      ],
    ),
    EquipmentGuide(
      id: 'tent_ultralight_guide',
      subCategoryId: 'tent_ultralight',
      title: 'Ultralight Shelter Checklist',
      description:
          'Ultralight shelters — tarps, mid-shelters, and cuben fibre tents — minimise packaged weight at the expense '
          'of interior comfort and ease of setup. Designed for experienced hikers who want to carry under 700 g '
          'for their sleeping shelter.',
      essentialItems: [
        'Tarp or silnylon/cuben fibre shelter body',
        'Trekking poles (often serve as the support structure — confirm compatibility)',
        'Titanium or carbon fibre pegs (minimum 10)',
        'Perlon cord guylines (pre-rigged with line tensioners)',
        'Inner mesh bug net (if separate from the shelter)',
        'Ground cloth (silnylon, not polyethylene — weight matters)',
        'Repair tape (silnylon-compatible patch tape)',
      ],
      niceToHaveItems: [
        'Extra guylines (conditions change — more lines in wind equals more stability)',
        'Trowel (for anchoring in snow or sand without stakes)',
        'Pulley line-tightener system',
        'Bivy liner (adds warmth and a bug barrier)',
        'Ditty bag for stakes, cords, and repair kit',
      ],
      buyingTips: [
        'Silpoly (polyester/silicone) resists sag in rain better than silnylon (nylon absorbs water and stretches when wet).',
        'Cuben fibre (Dyneema Composite Fabric) is the lightest option but carries a significant price premium.',
        'Never buy an ultralight shelter as your first tent — the skill required to pitch effectively in wind and rain is substantial.',
        'Cat-cut (curved) edges maintain tension better than straight edges and pitch flatter in wind.',
        'Invest in titanium or carbon fibre stakes — heavy steel pegs negate the weight savings from the shelter itself.',
      ],
      careTips: [
        'Tarp fabrics must be fully dry before storage — silnylon is particularly susceptible to mildew-related degradation.',
        'Check every grommet and stake loop for tearing after each use — the connection points experience the highest stress.',
        'Store in a loose, breathable bag — never compressed tightly as this can crack silicone coatings.',
        'Re-apply silicone seam sealer to stitched seams every season — most ultralight fabrics are not factory-seam-sealed.',
        'Wash only with cold water and a soft cloth — detergents and hot water both degrade silicone coatings.',
      ],
    ),
    EquipmentGuide(
      id: 'tent_bivy_guide',
      subCategoryId: 'tent_bivy',
      title: 'Bivy Sack Checklist',
      description:
          'A bivy sack (bivouac shelter) is a waterproof, breathable outer cover for your sleeping bag. '
          'It provides emergency weather protection and extends sleeping bag warmth without the weight of a tent. '
          'Essential for mountaineers, fast-packers, and as an emergency kit addition.',
      essentialItems: [
        'Bivy sack (Gore-Tex or eVent membrane for breathability)',
        'Sleeping bag rated to expected temperature',
        'Sleeping pad (insulation from cold ground is critical in a bivy)',
        'Headlamp',
        'Emergency water supply',
        'Compression bag for the bivy',
      ],
      niceToHaveItems: [
        'Lightweight tarp for extra weather protection in persistent rain',
        'Insulated hat and ear cover (head heat loss is substantial in a bivy)',
        'Hand warmers',
        'Emergency whistle clipped to zipper',
        'Silk sleeping bag liner (adds 5–8°C extra warmth)',
      ],
      buyingTips: [
        'Breathability is the critical metric — a non-breathable bivy (emergency foil type) will be saturated with condensation by morning.',
        'A hooped bivy (small pole raises the head end) is exponentially more comfortable than a flat bag-style bivy.',
        'For mountaineering use: double-walled design with a breathable outer and hardshell inner is the gold standard.',
        'Confirm the zip opens wide enough to exit quickly — an important safety feature in an emergency scenario.',
        'The packed weight of a quality breathable bivy is 400–700 g — it is a substantial emergency shelter for minimal pack weight.',
      ],
      careTips: [
        'Dry the bivy thoroughly after every use — moisture trapped in the laminate degrades the waterproof membrane rapidly.',
        'Never machine-wash unless the care label explicitly allows it — most Gore-Tex bivies are hand-wash only in cold water.',
        'Re-proof the outer shell with Nikwax Tech Wash and TX.Direct when water soaks in rather than beading.',
        'Inspect the main zipper after every use — a failed bivy zipper on a cold mountain is a genuine emergency.',
        'Store loosely in a breathable bag (not compressed) — long-term compression causes delamination in the face fabric.',
      ],
    ),
  ];
}
