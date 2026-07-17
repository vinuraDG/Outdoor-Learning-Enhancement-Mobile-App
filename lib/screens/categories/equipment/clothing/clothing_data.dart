import 'package:flutter/material.dart';
import '../equipment_model.dart';

class ClothingData {
  static const List<EquipmentSubCategory> categories = [
    EquipmentSubCategory(
      id: 'cloth_base',
      title: 'Base Layer',
      subtitle: 'Moisture-wicking layer worn directly against your skin.',
      icon: Icons.layers_outlined,
      color: Color(0xFF1A7A6E),
      bgColor: Color(0xFFE0F2F1),
    ),
    EquipmentSubCategory(
      id: 'cloth_mid',
      title: 'Mid Layer',
      subtitle: 'Insulating layer that traps warmth between base and shell.',
      icon: Icons.thermostat_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
    ),
    EquipmentSubCategory(
      id: 'cloth_shell',
      title: 'Outer Shell',
      subtitle: 'Windproof and waterproof protection from the elements.',
      icon: Icons.umbrella_outlined,
      color: Color(0xFF6A1B9A),
      bgColor: Color(0xFFF3E5F5),
    ),
    EquipmentSubCategory(
      id: 'cloth_footwear',
      title: 'Hiking Footwear',
      subtitle: 'Boots, shoes, and socks for trail and off-trail use.',
      icon: Icons.directions_walk_outlined,
      color: Color(0xFF5D4037),
      bgColor: Color(0xFFEFEBE9),
    ),
    EquipmentSubCategory(
      id: 'cloth_headhands',
      title: 'Head & Hands',
      subtitle: 'Hats, buffs, gloves, and sun protection accessories.',
      icon: Icons.face_outlined,
      color: Color(0xFFF57F17),
      bgColor: Color(0xFFFFF3E0),
    ),
    EquipmentSubCategory(
      id: 'cloth_rain',
      title: 'Rain Gear',
      subtitle: 'Lightweight packable waterproof jackets and pants.',
      icon: Icons.water_outlined,
      color: Color(0xFF0277BD),
      bgColor: Color(0xFFE1F5FE),
    ),
  ];

  static const List<EquipmentGuide> guides = [
    EquipmentGuide(
      id: 'cloth_base_guide',
      subCategoryId: 'cloth_base',
      title: 'Base Layer Checklist',
      description:
          'Your base layer is the most important layer in the hiking system — it sits directly against skin '
          'and its job is to wick moisture away from your body. Cotton kills: it absorbs sweat, stays wet, '
          'and in cool conditions causes rapid chilling. Always use wool or synthetic.',
      essentialItems: [
        'Merino wool or synthetic short-sleeve crew top (primary base layer)',
        'Merino wool or synthetic long-sleeve top (for cold conditions or sun protection)',
        'Base layer bottoms (merino or synthetic long underwear for cold weather)',
        'Hiking underwear (anti-chafe, moisture-wicking)',
        'Merino wool or moisture-wicking hiking socks (1 pair per day of trip)',
        'Liner socks (thin wool or nylon layer prevents blisters under thicker hiking socks)',
      ],
      niceToHaveItems: [
        'Spare complete base layer set (one full change for wet or cold emergencies)',
        'Lightweight compression base layer (reduces muscle fatigue on long days)',
        'Merino balaclava (converts to neck gaiter or hat)',
        'Merino boxer briefs (for overnight use)',
        'Base layer leggings with sun protection rating (UPF 50+)',
      ],
      buyingTips: [
        'Merino wool (17.5–18.9 micron for next-to-skin softness) is odour-resistant and temperature-regulating — ideal for multi-day trips.',
        'Synthetic base layers (polyester) dry faster than merino but accumulate odour after 1–2 days without washing.',
        'Look for flat-lock seaming — this construction eliminates raised seam lines that cause abrasion on long hikes.',
        '150 g/m² merino is suitable for 3-season use; 200+ g/m² for cold conditions; 120 g/m² for warm weather.',
        'Avoid blended cotton base layers — even 10–15% cotton content significantly degrades moisture performance.',
      ],
      careTips: [
        'Merino wool is machine-washable on a delicate/wool cycle with cold water — never hot, which causes shrinkage and felting.',
        'Lay merino flat to dry rather than hanging — the weight of water can stretch out the shape when hanging.',
        'Wash synthetic base layers inside-out with a performance wash (Nikwax BaseWash) to remove odour-causing bacteria.',
        'Never use fabric softener on any technical base layer — it coats the fibres and destroys moisture-wicking performance.',
        'Air dry rather than machine dry wherever possible — heat cycles degrade both merino and synthetic fabrics over time.',
      ],
    ),
    EquipmentGuide(
      id: 'cloth_mid_guide',
      subCategoryId: 'cloth_mid',
      title: 'Mid Layer Checklist',
      description:
          'The mid layer is your primary insulation — it traps warm air between your base layer and outer shell. '
          'Down insulation is warmer by weight but loses insulation when wet; synthetic insulation is bulkier '
          'but continues working even when damp.',
      essentialItems: [
        'Lightweight fleece (100 wt or 200 wt) for active insulation during hiking',
        'Down or synthetic puffy jacket (for camp warmth, rest stops, and cold-weather starts)',
        'Insulated vest (versatile layering piece that keeps core warm without restricting arm movement)',
        'Fleece or insulated pants for cold camp evenings',
        'Neck gaiter or balaclava (rapidly adjustable insulation for the head)',
      ],
      niceToHaveItems: [
        'Active insulation jacket (Polartec Alpha or Primaloft Active — designed to breathe during high-output activities)',
        'Down-filled trousers for extreme cold or high altitude',
        'Grid-fleece base-mid hybrid (excellent for wet conditions)',
        'Lightweight belay jacket (mandatory for winter mountaineering)',
        'Liner gloves (thin fleece worn inside shell gloves)',
      ],
      buyingTips: [
        'Down fill power of 800+ is ideal for packability and warmth; 600–700 fill power is acceptable at a lower price point.',
        'Hydrophobic down (e.g., DownTek, DriDown) resists moisture absorption and is worth the price premium for wet environments.',
        'Fleece 100 wt is active-use weight (thin, breathable); 200 wt balances warmth and breathability; 300 wt is a heavy camp insulator.',
        'A mid-layer with DWR coating provides light weather resistance when worn as an outer in dry conditions.',
        'Helmet-compatible hoods on puffies are valuable for mountaineering — the hood should sit flat under a helmet without bulk.',
      ],
      careTips: [
        'Machine-wash down jackets on a gentle cycle with down-specific detergent (Nikwax Down Wash Direct) — regular detergents strip natural oils from down clusters.',
        'Tumble-dry down jackets on LOW heat with 3–4 clean tennis balls — the balls break up wet down clumps and restore loft.',
        'Store down uncompressed in a large breathable cotton storage bag — long-term compression permanently damages down clusters.',
        'Wash fleece on a cold gentle cycle — hot water causes fleece to pill aggressively and shed microplastic fibres.',
        'Re-apply DWR treatment to outer fleece and synthetic mid-layers annually using Nikwax Fleece Proof or similar.',
      ],
    ),
    EquipmentGuide(
      id: 'cloth_shell_guide',
      subCategoryId: 'cloth_shell',
      title: 'Outer Shell Checklist',
      description:
          'Your outer shell is your last line of defence against wind and rain. It must be fully waterproof (not just water-resistant) '
          'and breathable enough to allow sweat vapour to escape during active hiking. A quality shell jacket '
          'is one of the highest-value investments in your hiking wardrobe.',
      essentialItems: [
        'Waterproof hardshell jacket (3-layer Gore-Tex or equivalent — minimum 20,000 mm hydrostatic head)',
        'Waterproof hardshell pants (taped seams, full side zips for wearing over boots)',
        'Shell jacket hood (must be helmet-compatible and have wired brim)',
        'Pit-zip ventilation (critical for active use — prevents overheating)',
        'All sealed seams (check before purchasing)',
      ],
      niceToHaveItems: [
        'Softshell jacket (for dry windy conditions — more breathable but not waterproof)',
        'Wind shirt (ultralight windproof layer for aerobic activities)',
        'Shell mitts (waterproof overmitts that go over liner gloves in extreme conditions)',
        'Gaiters to seal the shell pants at boot level',
        'Packable shell jacket (fits into its own pocket)',
      ],
      buyingTips: [
        '3-layer construction (face fabric / membrane / backer fabric bonded together) is the most durable and highest-performing shell option.',
        '2.5-layer shells are lighter and less expensive but less durable — suitable for occasional use in light rain.',
        'Breathability is rated in MVTR (moisture vapour transmission rate) — 15,000+ g/m²/24h is adequate; 25,000+ is excellent.',
        'A hem that draws tight and a high collar that fastens above the chin are critical for warmth in driving rain and wind.',
        'Bright or high-visibility colour is a safety feature — easy for search and rescue to spot in emergency conditions.',
      ],
      careTips: [
        'Wash your shell jacket regularly — a clean DWR coating repels water far more effectively than a dirty one.',
        'Use a technical outerwear wash (Nikwax Tech Wash) — never standard detergent, fabric softener, or bleach.',
        'Tumble dry on LOW heat (not high) after washing to reactivate DWR treatment — this is not optional, it is functional.',
        'Re-apply DWR spray (Nikwax TX.Direct) when water soaks in rather than beading off the outer surface.',
        'Close all velcro and zip all pockets before washing — open velcro tears the face fabric of the jacket itself.',
      ],
    ),
    EquipmentGuide(
      id: 'cloth_footwear_guide',
      subCategoryId: 'cloth_footwear',
      title: 'Hiking Footwear Checklist',
      description:
          'Poorly fitted footwear is the primary cause of blisters, ankle injuries, and trail suffering. '
          'Your boots or shoes must be properly fitted, broken in before a long trip, and appropriate for '
          'the terrain difficulty and duration of your specific route.',
      essentialItems: [
        'Hiking boots or trail runners fitted in the afternoon (feet swell during the day)',
        'Merino wool hiking socks (2 pairs minimum — carry a dry pair)',
        'Wool or nylon liner socks (thin layer inside the boot reduces friction)',
        'Gaiters (low or high, depending on terrain and conditions)',
        'Insoles (custom or premium aftermarket — dramatically improves comfort and stability)',
        'Blister prevention products (Body Glide, Compeed blister plasters)',
        'Boot lacing technique practiced for your specific foot shape',
      ],
      niceToHaveItems: [
        'Camp sandals or lightweight Crocs (gives your feet rest at camp)',
        'Waterproofing spray for leather boots (Nikwax Leather Proof)',
        'Waterproofing spray for fabric boots (Nikwax Fabric & Leather Proof)',
        'Boot dryer (electric or silica sachet for wet boot storage)',
        'Spare laces (one set per pair of boots on longer trips)',
        'Neoprene socks for stream crossings',
      ],
      buyingTips: [
        'Fit boots with the socks you will actually wear — this is the most commonly ignored fitting advice.',
        'Thumb-width space at the toe box prevents black toenails on descents — the most common boot-sizing mistake.',
        'Stiff-soled boots protect feet on rocky terrain; flexible trail runners are faster but offer less protection on technical ground.',
        'Waterproof membrane boots (Gore-Tex) keep feet dry in light rain but do not dry out quickly once flooded by stream crossings.',
        'Break in new boots with progressively loaded day hikes over 4–6 weeks before your first multi-day trip — no exceptions.',
      ],
      careTips: [
        'Remove insoles after every trip and allow boots and insoles to air-dry completely before storing.',
        'Clean muddy boots with a soft brush and cold water only — hot water, solvents, and detergents all damage adhesives and materials.',
        'Condition leather boots with appropriate leather conditioner (Nikwax Conditioner) after every 3–4 trips to prevent cracking.',
        'Re-waterproof fabric-membrane boots (Gore-Tex) when you notice water soaking in — the membrane does not degrade but the face fabric DWR does.',
        'Store boots in a cool, dry, ventilated area — not inside sealed plastic bags or damp basements where mildew develops.',
      ],
    ),
    EquipmentGuide(
      id: 'cloth_headhands_guide',
      subCategoryId: 'cloth_headhands',
      title: 'Head & Hands Checklist',
      description:
          'Heat loss from the head and hands is disproportionate to their surface area — proper protection '
          'of extremities is essential for maintaining core temperature and fine motor dexterity. '
          'All headwear and handwear should be layerable for adaptable warmth management.',
      essentialItems: [
        'Wide-brim sun hat or cap (UPF 50+ protection for face, neck, and ears)',
        'Lightweight merino wool beanie (fits inside a helmet)',
        'Neck gaiter or multi-use buff (highly versatile layering piece)',
        'Liner gloves (thin wool or synthetic — base layer for hands)',
        'Shell mitts or waterproof gloves for rain and wind',
        'UV-protective sunglasses (CE-certified lens with 100% UV400 protection)',
        'Glacier glasses or goggles (for snow travel or high altitude)',
      ],
      niceToHaveItems: [
        'Balaclava (full head and neck coverage for sub-zero conditions)',
        'Insulated gloves (between liner and shell in a 3-layer hand system)',
        'Trekking pole mitts/pogies',
        'Spare beanie and liner gloves (lost or wet extras are disproportionately costly)',
        'Ear protection muffs for cold-weather use with a helmet',
      ],
      buyingTips: [
        'A wide-brim hat is worth far more than sunscreen alone for long summer days above treeline — full-face sun coverage matters.',
        'Look for helmet-compatible beanies that are thin enough to sit under a helmet without adding pressure.',
        'Invest in quality glacier glasses with side shields if travelling on snow or glaciers — reflected UV causes snow blindness.',
        'A buff/neck gaiter is the single most versatile accessory — it functions as hat, face mask, neck warmer, and headband.',
        'Waterproof gloves should fit with liner gloves inside — buy the outer glove one size up to accommodate the layering system.',
      ],
      careTips: [
        'Hand-wash merino beanies and buffs in cold water with wool-specific detergent — machine-washing on a hot cycle causes irreversible shrinkage.',
        'Dry gloves with liners inserted to maintain shape — do not wring out waterproof gloves (damages the membrane).',
        'Inspect goggle lenses after every use for scratches — scratched lenses significantly reduce optical clarity and UV protection.',
        'Clean UV sunglasses with lens solution and a micro-fibre cloth — never with shirt fabric or tissues, which cause micro-scratches.',
        'Replace all handwear where the insulation has permanently compressed (feels flat and does not spring back) — dead insulation provides no warmth.',
      ],
    ),
    EquipmentGuide(
      id: 'cloth_rain_guide',
      subCategoryId: 'cloth_rain',
      title: 'Rain Gear Checklist',
      description:
          'A proper rain gear system — jacket plus pants — keeps you warm, dry, and functional in sustained heavy rain. '
          'Getting soaked through due to inadequate rain gear is one of the leading causes of hypothermia in temperate environments. '
          'Never underestimate rain exposure risk on multi-day trips.',
      essentialItems: [
        'Fully seam-taped waterproof jacket (minimum 10,000 mm hydrostatic head; 20,000 mm recommended)',
        'Fully seam-taped waterproof pants with side zips (so you can put them on without removing boots)',
        'Hood that cinches tightly around the face and has a wired peak brim',
        'DWR coating (check current status before each trip — re-apply if water soaks in)',
        'Pit zips or high-neck zip for venting (prevents the jacket from becoming a sweat trap during active hiking)',
      ],
      niceToHaveItems: [
        'Pack rain cover (secondary protection for your pack — keep critical electronics in dry bags inside as well)',
        'Packable emergency poncho (emergency-only backup; ponchos are not suitable as primary rain gear)',
        'Waterproof overmitts',
        'Waterproof boot covers or neoprene socks',
        'Dry bags for electronics, sleeping bag, and clothing inside the pack',
      ],
      buyingTips: [
        'Taped seams are non-negotiable for truly waterproof performance — "water-resistant" jackets with unsealed seams fail in sustained rain.',
        'Hardshell (fully waterproof) vs softshell (highly water-resistant but breathable) — use a hardshell for genuine rain risk; softshell for light drizzle.',
        'Always test the rain pants fit while wearing your mid-layer — they should comfortably fit over insulated pants when required.',
        'Invest in quality over price for rain gear — cheap jackets with low hydrostatic head ratings become expensive lessons in wet conditions.',
        'Pack compressibility matters — a jacket that stuffs into its own pocket takes up minimal space when conditions are clear.',
      ],
      careTips: [
        'Never iron, dry-clean, or machine-wash rain gear on a hot cycle — high heat destroys waterproof membranes.',
        'Wash rain gear regularly with Nikwax Tech Wash — dirt blocks the DWR coating and prevents water from beading off.',
        'Tumble dry on LOW heat after washing to thermally reactivate the DWR layer — this is the single most effective maintenance step.',
        'Seam tape is the failure point of any waterproof garment — inspect all seams after each trip for delamination or peeling.',
        'Re-apply DWR spray (Nikwax TX.Direct Spray-On) to areas of high abrasion (shoulders, cuffs, hood) at the start of each wet season.',
      ],
    ),
  ];
}
