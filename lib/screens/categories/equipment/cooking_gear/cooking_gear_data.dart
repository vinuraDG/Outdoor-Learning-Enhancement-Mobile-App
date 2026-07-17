import 'package:flutter/material.dart';
import '../equipment_model.dart';

class CookingGearData {
  static const List<EquipmentSubCategory> categories = [
    EquipmentSubCategory(
      id: 'cook_stoves',
      title: 'Camp Stoves',
      subtitle: 'Canister, alcohol, and liquid fuel stove systems.',
      icon: Icons.local_fire_department_outlined,
      color: Color(0xFFE64A19),
      bgColor: Color(0xFFFBE9E7),
    ),
    EquipmentSubCategory(
      id: 'cook_cookware',
      title: 'Cookware & Pots',
      subtitle: 'Lightweight pots, pans, and integrated cook systems.',
      icon: Icons.soup_kitchen_outlined,
      color: Color(0xFF2D6A4F),
      bgColor: Color(0xFFE8F5E9),
    ),
    EquipmentSubCategory(
      id: 'cook_utensils',
      title: 'Utensils & Cups',
      subtitle: 'Cutlery, mugs, bowls, and camp kitchen tools.',
      icon: Icons.restaurant_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    EquipmentSubCategory(
      id: 'cook_food_storage',
      title: 'Food Storage',
      subtitle: 'Bear canisters, dry bags, and odour-proof food storage.',
      icon: Icons.inventory_2_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
    EquipmentSubCategory(
      id: 'cook_water',
      title: 'Water Treatment',
      subtitle: 'Filters, purifiers, tablets, and UV sterilisation.',
      icon: Icons.water_drop_outlined,
      color: Color(0xFF0277BD),
      bgColor: Color(0xFFE1F5FE),
    ),
    EquipmentSubCategory(
      id: 'cook_fire_starters',
      title: 'Fire Starters',
      subtitle: 'Reliable ignition tools for any weather condition.',
      icon: Icons.whatshot_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
  ];

  static const List<EquipmentGuide> guides = [
    EquipmentGuide(
      id: 'cook_stoves_guide',
      subCategoryId: 'cook_stoves',
      title: 'Camp Stove Checklist',
      description:
          'The right camp stove depends on your trip length, group size, altitude, and temperature. '
          'Canister stoves are the easiest and most reliable for most 3-season trips; liquid fuel stoves excel '
          'in cold temperatures and at altitude where canister performance drops significantly.',
      essentialItems: [
        'Camp stove (canister-mounted or remote canister for cold weather)',
        'Fuel canisters — calculate 15–20 g fuel per meal per person as a baseline',
        'Windscreen (custom for your specific stove or a universal folding aluminium screen)',
        'Lighter (piezo-ignition stove or separate lighter)',
        'Backup matches in a waterproof container',
        'Stove stand (increases stability for top-heavy integrated cook systems)',
      ],
      niceToHaveItems: [
        'Secondary alcohol stove as ultra-lightweight backup',
        'Heat exchanger pot (dramatically improves fuel efficiency at altitude)',
        'Flame regulator valve for precise simmer control',
        'Remote canister stove with a built-in fuel gauge',
        'Stove repair kit with spare O-rings and cleaning needle',
      ],
      buyingTips: [
        'Integrated canister stoves (Jetboil, MSR Windburner) are the most fuel-efficient and fast-boiling for simple one-pot cooking.',
        'Remote canister stoves (canister inverted, hose connection) perform significantly better in sub-zero temperatures than top-mount stoves.',
        'Alcohol stoves weigh under 30 g and have no moving parts to fail — ideal as a lightweight backup or for ultralight trips in warm weather.',
        'Boil time matters less than you think — real-world cooking (simmering not just boiling) is a better test of stove capability.',
        'Always check whether the stove threading matches the available fuel canister standard in your destination country.',
      ],
      careTips: [
        'Clean the stove jet with the cleaning needle provided after every trip — a partially blocked jet dramatically reduces efficiency.',
        'Inspect and replace the O-ring on the canister connection annually or whenever it looks compressed or cracked.',
        'Store fuel canisters at room temperature away from heat — never store in a vehicle during summer.',
        'Run the stove briefly before each trip to confirm ignition works — test at home, not at the trailhead.',
        'Never pack a stove with the canister attached — the connection can loosen during transport and allow gas to leak.',
      ],
    ),
    EquipmentGuide(
      id: 'cook_cookware_guide',
      subCategoryId: 'cook_cookware',
      title: 'Cookware & Pots Checklist',
      description:
          'Lightweight titanium or hard-anodised aluminium cookware is the gold standard for backpacking. '
          'A well-chosen cookset enables you to cook every meal on your itinerary without excess weight or volume.',
      essentialItems: [
        'Pot/pan set sized to your group: 750 ml solo, 1.5 L for 2–3 people, 2+ L for 4+ people',
        'Lid for every pot (dramatically reduces boil time and fuel consumption)',
        'Pot gripper or folding pot handle',
        'Lightweight heat diffuser plate (prevents hot spots with alcohol and wood stoves)',
        'Pot cosy/insulator (keeps food warm while it rehydrates without using fuel)',
      ],
      niceToHaveItems: [
        'Dedicated fry pan (for eggs and fresh food cooking at base camp)',
        'Dutch oven (heavy but transforms backcountry cooking quality)',
        'Cast iron skillet (car camping only — too heavy for backpacking)',
        'Collapsible silicone mixing bowl',
        'Packable cutting board',
        'Mini whisk for sauce mixes and hot drink preparations',
      ],
      buyingTips: [
        'Titanium is the lightest durable option (30–40% lighter than aluminium) — choose it for backpacking weight-sensitive trips.',
        'Hard-anodised aluminium is an excellent mid-weight option — excellent heat distribution at a significantly lower price than titanium.',
        'Non-stick coating is a luxury, not a requirement — titanium without coating is easier to clean with hot water and a scrub pad.',
        'Nest-stacking cooksets save the most volume — confirm your stove, fuel canister, and utensils all nest inside the pots.',
        'An unnecessarily large pot wastes fuel heating excess water — match the pot volume tightly to your actual group size.',
      ],
      careTips: [
        'Burn titanium pots dry after washing — water spots and food residue burn off cleanly without damaging the metal.',
        'Never use metal utensils in any non-stick-coated cookware — a scratched non-stick surface must be replaced, not repaired.',
        'Clean all cookware before packing — odours from food residue attract wildlife.',
        'Dry cookware completely and store without lids tightly sealed to prevent moisture and mildew inside nested sets.',
        'Inspect pot handles and locking mechanisms before each trip — a failed handle over a hot stove is a burn hazard.',
      ],
    ),
    EquipmentGuide(
      id: 'cook_utensils_guide',
      subCategoryId: 'cook_utensils',
      title: 'Utensils & Cups Checklist',
      description:
          'Lightweight camp cutlery, mugs, and eating vessels are among the simplest gear choices but have '
          'a significant impact on mealtime comfort and camp hygiene.',
      essentialItems: [
        'Long-handle titanium or lightweight spork (reaches the bottom of deep freeze-dried meal bags)',
        'Folding spork or nesting cutlery set (knife, fork, spoon)',
        'Insulated mug or cup (350–500 ml — for hot drinks and soups)',
        'Lightweight bowl or deep plate',
        'Biodegradable dish soap (concentrated — small bottle per week)',
        'Dish scrub sponge (cut in half to save space and weight)',
        'Bandana or pack towel for drying',
      ],
      niceToHaveItems: [
        'Dedicated coffee dripper (GSI or similar — for serious coffee drinkers)',
        'Aeropress (excellent coffee at modest weight for base camp use)',
        'French press mug (insulated mug with built-in press — all-in-one brewing and drinking)',
        'Collapsible silicone cup (backup or extra drinking vessel)',
        'Packable wine glass (morale item for celebratory camps)',
        'Small measuring cup for recipe-critical cooking',
      ],
      buyingTips: [
        'A long-handle spork is more valuable than a standard-length one — most freeze-dried meals are consumed directly from tall bags.',
        'Titanium cutlery costs more but is half the weight of steel and lasts indefinitely with no maintenance.',
        'An insulated mug with a leak-proof lid doubles as a thermos for morning coffee while hiking.',
        'Collapsible silicone bowls and cups save volume when packing — they nest flat but spring into full depth for use.',
        'Avoid disposable cutlery even for one-off trips — the performance difference compared to a quality spork is substantial.',
      ],
      careTips: [
        'Wash all utensils and cookware at least 60 m from any water source — food particles in waterways cause algae blooms.',
        'Titanium utensils can be sanitised over a flame — quickly passing cutlery through a flame kills pathogens without chemical soap.',
        'Store utensils in a mesh stuff sack that allows air circulation — sealed bags hold moisture and cause mildew on wooden or bamboo handles.',
        'Pack out all food scraps in a sealable odour-proof bag — never bury food scraps or scatter them in the wild.',
        'Dry your mug completely between hot and cold uses — residual moisture in an insulated mug dilutes and cools drinks rapidly.',
      ],
    ),
    EquipmentGuide(
      id: 'cook_food_storage_guide',
      subCategoryId: 'cook_food_storage',
      title: 'Food Storage Checklist',
      description:
          'Proper food storage prevents wildlife encounters and is legally required in many wilderness areas. '
          'All food, cooking equipment, and scented products must be stored in an approved bear canister or hung '
          'at least 4 m above ground and 1 m horizontally from any trunk.',
      essentialItems: [
        'Bear canister (BV500 or equivalent — required in many national parks)',
        'Bear hang kit: 50 m paracord, two lightweight stuff sacks, a hook or carabiner',
        'Odour-proof bags for all food items inside the canister',
        'Sealable dry bags for all cooking equipment and fuel',
        'Trash bag (all food waste and wrappers must be packed out)',
        'Repackaged food in labelled zip-lock bags (reduces packaging volume by 30–50%)',
      ],
      niceToHaveItems: [
        'Opsak odour-barrier bags (double-layer for areas with highly habituated bears)',
        'Food hanging scale (verify canister weight for permit compliance)',
        'Lightweight food organiser pouches (by meal, by day)',
        'Food-grade dry containers for spices and condiments',
        'Lightweight collapsible cutting board',
        'RFID tag for canister (bear-managed areas sometimes require registration)',
      ],
      buyingTips: [
        'Bear canisters approved by the Interagency Grizzly Bear Committee (IGBC) are required in high-bear-density areas — check regulations before departure.',
        'A 650 ml canister holds roughly 5 days of food for a solo hiker — plan food volume carefully before purchasing a size.',
        'Soft-sided food bags (Ursack) are lighter than hard canisters but not accepted in all jurisdictions — verify the specific area rules.',
        'Pre-measure and repackage all food into day-labelled zip-locks before departure — saves time and reduces packaging significantly.',
        'Choose BPA-free hard plastic or carbon fibre canisters — avoid purely clear plastic which creates a visual food display for bears.',
      ],
      careTips: [
        'Wash the inside of a bear canister after every trip with hot water and biodegradable soap — odour-permeated canisters attract wildlife even when empty.',
        'Inspect the canister lid mechanism before each trip — the locking tabs must click positively shut and require a coin to open.',
        'Store all cooking utensils and stoves in the canister or bear bag — cooking odour permeates equipment as thoroughly as food.',
        'Never cache food near tent — minimum 60 m from sleeping area and ideally downwind.',
        'Dry all food storage bags completely between trips to prevent condensation-driven odour development.',
      ],
    ),
    EquipmentGuide(
      id: 'cook_water_guide',
      subCategoryId: 'cook_water',
      title: 'Water Treatment Checklist',
      description:
          'Waterborne pathogens — bacteria, protozoa (giardia, cryptosporidium), and viruses — are present in nearly '
          'all untreated backcountry water sources. A reliable water treatment system is a fundamental safety item, '
          'not optional equipment. Always carry a backup treatment method.',
      essentialItems: [
        'Primary water filter (Sawyer Squeeze, Katadyn BeFree, or similar hollow-fibre filter)',
        'Backup chemical treatment — iodine tablets or Aquatabs (effective even if filter freezes)',
        'Collapsible dirty water reservoir (for collecting and filtering)',
        'Clean water bottles (minimum 2 L capacity across all containers)',
        'Pre-filter bandana or coffee filter (remove sediment before filtering)',
        'Straw-style filter for drinking directly from streams in an emergency',
      ],
      niceToHaveItems: [
        'UV purifier (SteriPen) — kills viruses that hollow-fibre filters miss, effective in clear water',
        'Gravity filter system (ideal for base camps and group use — hands-free filtration)',
        'Insulated water bottle (retains heat for purification melt-water in sub-zero conditions)',
        'Squeeze bags (backup dirty-water reservoir)',
        'Hydration bladder (reservoir for between-source periods)',
      ],
      buyingTips: [
        'Know the difference: FILTER removes bacteria and protozoa; PURIFIER (chemical + UV) also kills viruses — choose based on destination risk.',
        'Hollow-fibre filters (Sawyer, Katadyn) are the lightest and fastest field option — backwash after each trip to restore flow rate.',
        'Chemical treatment (iodine, chlorine dioxide) is the lightest backup and kills everything including viruses at the appropriate dose.',
        'Gravity filters are ideal for groups at base camp — set them up and walk away while they filter, rather than squeeze-filtering repeatedly.',
        'Always pre-filter highly turbid (silty) water through a bandana before passing it through a mechanical filter to protect the membrane.',
      ],
      careTips: [
        'Back-flush (backwash) your hollow-fibre filter after every trip — blocked filters are the most common equipment problem in the field.',
        'Never allow a hollow-fibre filter to freeze — frozen ice crystals crack the hollow fibres and the filter is permanently compromised.',
        'Store filters dry and at room temperature — do not store them in a sealed bag with residual moisture.',
        'Replace chemical treatment tablets at the start of each season — expired tablets lose effectiveness.',
        'Clean the O-rings on UV purifiers (SteriPen) and replace batteries before each trip — a failed UV pen is a critical safety item failure.',
      ],
    ),
    EquipmentGuide(
      id: 'cook_fire_starters_guide',
      subCategoryId: 'cook_fire_starters',
      title: 'Fire Starters Checklist',
      description:
          'Reliable fire-starting capability is essential in survival scenarios and for legitimate campfire use. '
          'Always carry multiple ignition sources and reliable tinder — never rely on a single lighter or match supply '
          'in a survival context.',
      essentialItems: [
        'Primary lighter (quality butane lighter — BIC or equivalent)',
        'Backup stormproof matches in a waterproof case',
        'Waterproof match container (always keep separate from the primary match supply)',
        'Commercial fire starters (wax-coated wood shavings, fatwood, or cotton balls with petroleum jelly)',
        'Flint and steel striker (mechanical backup that works regardless of fuel or moisture)',
        'Tinder collection bag (for dry birch bark, dead pine needles, dry grass — gathered en route)',
      ],
      niceToHaveItems: [
        'Windproof torch-style lighter (butane jet flame cuts through wind far better than conventional lighters)',
        'Esbit solid fuel tabs (reliable emergency fuel source that burns regardless of wind)',
        'Ferrocerium rod (produces a shower of 3000°C sparks — works when wet)',
        'Small folding bellows (accelerates fire development in marginal conditions)',
        'Pre-made char cloth (rapidly ignited by a single spark)',
      ],
      buyingTips: [
        'A windproof jet lighter is substantially more useful than a conventional lighter in any outdoor environment — wind extinguishes standard flames instantly.',
        'Ferrocerium (ferro) rods are indefinitely waterproof and generate sparks regardless of conditions — they should be on every trip.',
        'Commercial fire starters (WetFire, Coghlan\'s) work even when wet and are far more reliable than improvised natural tinder in rain.',
        'Avoid paper matches entirely in outdoor use — they are fragile, moisture-sensitive, and fail at the worst moments.',
        'Store all ignition sources in separate locations across your kit — never put all fire-starting capability in one pocket or pouch.',
      ],
      careTips: [
        'Check lighter fuel level before every trip — carry a spare lighter on trips longer than 3 days.',
        'Test the piezo ignition (if present) on canister stoves before departure — replace the lighter if ignition requires more than 3–4 strikes.',
        'Keep matches sealed in their waterproof container between uses — brief exposure to damp air can raise the ignition threshold significantly.',
        'Dry wet fire starters completely before storage — moisture inside wax fire starters does not prevent ignition but it reduces burn time.',
        'Replace the striker pad in match containers when it wears smooth — a smooth striker pad renders the matches non-functional.',
      ],
    ),
  ];
}
