import 'package:flutter/material.dart';

// ── Discussion thread ─────────────────────────────────────────
class DiscussionThread {
  final String id;
  final String title;
  final String author;
  final String avatarLetter;
  final Color avatarColor;
  final String category;
  final Color categoryColor;
  final String excerpt;
  final int replies;
  final int views;
  final String lastActive;
  final List<String> tags;
  final bool isPinned;

  const DiscussionThread({
    required this.id,
    required this.title,
    required this.author,
    required this.avatarLetter,
    required this.avatarColor,
    required this.category,
    required this.categoryColor,
    required this.excerpt,
    required this.replies,
    required this.views,
    required this.lastActive,
    required this.tags,
    this.isPinned = false,
  });
}

// ── Trip story ────────────────────────────────────────────────
class TripStory {
  final String id;
  final String title;
  final String author;
  final String avatarLetter;
  final Color avatarColor;
  final String location;
  final String date;
  final String duration;
  final String difficulty;
  final Color difficultyColor;
  final String excerpt;
  final String body;
  final int likes;
  final int comments;
  final Color coverColor;
  final IconData coverIcon;
  final List<String> tags;

  const TripStory({
    required this.id,
    required this.title,
    required this.author,
    required this.avatarLetter,
    required this.avatarColor,
    required this.location,
    required this.date,
    required this.duration,
    required this.difficulty,
    required this.difficultyColor,
    required this.excerpt,
    required this.body,
    required this.likes,
    required this.comments,
    required this.coverColor,
    required this.coverIcon,
    required this.tags,
  });
}

// ── Outdoor event ─────────────────────────────────────────────
class OutdoorEvent {
  final String id;
  final String title;
  final String organizer;
  final String date;
  final String time;
  final String location;
  final String type;
  final Color themeColor;
  final IconData icon;
  final int participants;
  final int maxParticipants;
  final String description;
  final List<String> highlights;

  const OutdoorEvent({
    required this.id,
    required this.title,
    required this.organizer,
    required this.date,
    required this.time,
    required this.location,
    required this.type,
    required this.themeColor,
    required this.icon,
    required this.participants,
    required this.maxParticipants,
    required this.description,
    required this.highlights,
  });
}

// ── Partner profile ───────────────────────────────────────────
class PartnerProfile {
  final String id;
  final String name;
  final String avatarLetter;
  final Color avatarColor;
  final String location;
  final String experience;
  final Color experienceColor;
  final List<String> skills;
  final String availability;
  final String about;
  final List<String> upcomingTrips;

  const PartnerProfile({
    required this.id,
    required this.name,
    required this.avatarLetter,
    required this.avatarColor,
    required this.location,
    required this.experience,
    required this.experienceColor,
    required this.skills,
    required this.availability,
    required this.about,
    required this.upcomingTrips,
  });
}

// ══════════════════════════════════════════════════════════════
class CommunityData {
  // ── Stats ─────────────────────────────────────────────────
  static const int memberCount = 2400;
  static const int postCount = 348;
  static const int eventCount = 12;

  // ── Discussions ───────────────────────────────────────────
  static const List<DiscussionThread> discussions = [
    DiscussionThread(
      id: 'd_pinned',
      title: 'Welcome to the ORC Community — Start Here!',
      author: 'ORC SUSL Team',
      avatarLetter: 'O',
      avatarColor: Color(0xFF6A1B9A),
      category: 'Announcement',
      categoryColor: Color(0xFF6A1B9A),
      excerpt:
          'Welcome to the Outdoor Recreation & Conservation community! This is your space to connect, '
          'ask questions, share experiences, and grow together. Read our community guidelines before posting.',
      replies: 42,
      views: 1240,
      lastActive: '2 hours ago',
      tags: ['welcome', 'guidelines'],
      isPinned: true,
    ),
    DiscussionThread(
      id: 'd_01',
      title: 'Best budget hiking boots for beginners in Sri Lanka?',
      author: 'Kasun P.',
      avatarLetter: 'K',
      avatarColor: Color(0xFF1565C0),
      category: 'Gear',
      categoryColor: Color(0xFF0097A7),
      excerpt:
          'I am planning my first overnight hike to Knuckles Range and need advice on footwear. '
          'My budget is around LKR 8,000–12,000. Has anyone tried the local brands or imported mid-range options?',
      replies: 18,
      views: 302,
      lastActive: '4 hours ago',
      tags: ['boots', 'gear', 'beginner'],
    ),
    DiscussionThread(
      id: 'd_02',
      title: 'Ella Rock solo hike — safety tips for women?',
      author: 'Nimasha S.',
      avatarLetter: 'N',
      avatarColor: Color(0xFFE53935),
      category: 'Safety',
      categoryColor: Color(0xFF2D6A4F),
      excerpt:
          'I am planning a solo hike to Ella Rock next month. Looking for practical safety advice, '
          'best time to start, and whether a local guide is necessary for a first-timer on that trail.',
      replies: 27,
      views: 541,
      lastActive: '1 day ago',
      tags: ['solo', 'safety', 'ella'],
    ),
    DiscussionThread(
      id: 'd_03',
      title: 'How accurate is weather forecasting for Knuckles Range?',
      author: 'Roshan M.',
      avatarLetter: 'R',
      avatarColor: Color(0xFFF57F17),
      category: 'Weather',
      categoryColor: Color(0xFFF57F17),
      excerpt:
          'Planning a 3-day traverse of Knuckles in August. The weather apps show inconsistent forecasts. '
          'Anyone with experience on how rapidly conditions change there and which forecast source is most reliable?',
      replies: 14,
      views: 198,
      lastActive: '2 days ago',
      tags: ['weather', 'knuckles', 'planning'],
    ),
    DiscussionThread(
      id: 'd_04',
      title: 'LNT principle 3 — disposing of waste at high-use campsites',
      author: 'Dilshan W.',
      avatarLetter: 'D',
      avatarColor: Color(0xFF2D6A4F),
      category: 'Ethics',
      categoryColor: Color(0xFF2D6A4F),
      excerpt:
          'I visited Horton Plains last weekend and the waste situation at the main campsite was alarming. '
          'Can we discuss practical LNT strategies that work even when other hikers are not following the principles?',
      replies: 31,
      views: 417,
      lastActive: '3 days ago',
      tags: ['LNT', 'waste', 'ethics'],
    ),
    DiscussionThread(
      id: 'd_05',
      title: 'Water sources on the Sinharaja circuit — reliable in dry season?',
      author: 'Amali F.',
      avatarLetter: 'A',
      avatarColor: Color(0xFF0097A7),
      category: 'Navigation',
      categoryColor: Color(0xFF1565C0),
      excerpt:
          'Heading into Sinharaja in late February. Most trail guides show stream crossings as water sources. '
          'Are these reliable in the dry season, or should I plan to carry all water from the start?',
      replies: 9,
      views: 143,
      lastActive: '5 days ago',
      tags: ['water', 'sinharaja', 'dry season'],
    ),
    DiscussionThread(
      id: 'd_06',
      title: 'Anyone tried the new Knuckles Heritage Trail permit system?',
      author: 'Thilan B.',
      avatarLetter: 'T',
      avatarColor: Color(0xFF6A1B9A),
      category: 'Planning',
      categoryColor: Color(0xFF6A1B9A),
      excerpt:
          'Heard the Department of Wildlife Conservation introduced a new permit booking system for '
          'Knuckles. Has anyone gone through the online process? Any tips for groups of 4+?',
      replies: 6,
      views: 87,
      lastActive: '1 week ago',
      tags: ['permits', 'knuckles', 'planning'],
    ),
  ];

  // ── Trip Stories ──────────────────────────────────────────
  static const List<TripStory> stories = [
    TripStory(
      id: 's_01',
      title: 'Three Days in Knuckles: A Traverse I Will Never Forget',
      author: 'Roshan M.',
      avatarLetter: 'R',
      avatarColor: Color(0xFFF57F17),
      location: 'Knuckles Range, Central Province',
      date: 'Jul 2026',
      duration: '3 Days',
      difficulty: 'Challenging',
      difficultyColor: Color(0xFFE53935),
      excerpt:
          'What started as a perfectly planned trip turned into one of the most humbling adventures '
          'of my life when the cloud cover dropped to zero visibility on day two.',
      body:
          'We set off from Riverside Camp at 5:30 AM on a Tuesday. The first morning was everything '
          'we had hoped for — clear skies, a cool breeze off the mountains, and the kind of silence '
          'you can only find at elevation.\n\n'
          'By noon on day two, the weather had turned. Cloud descended so fast it was almost theatrical. '
          'Visibility dropped to about 10 metres, and the narrow trail we had been following became '
          'almost impossible to distinguish from the surrounding grass. This was the moment all the '
          'navigation training became real — not theory, not a quiz, but actual survival.\n\n'
          'My hiking partner Thilina pulled out the compass and we spent 40 minutes triangulating '
          'our position using the map and two stream crossings we could still hear. We were about '
          '600 metres west of where we thought we were. Correcting that early saved us from descending '
          'into the wrong valley.\n\n'
          'By day three the skies cleared and the ridge walk to Mini World\'s End delivered views '
          'that were worth every difficult moment. The lesson I will carry from this trip: trust '
          'your preparation, not your phone signal.',
      likes: 94,
      comments: 22,
      coverColor: Color(0xFF1565C0),
      coverIcon: Icons.landscape_outlined,
      tags: ['knuckles', 'navigation', 'challenging', '3-day'],
    ),
    TripStory(
      id: 's_02',
      title: 'Solo Sunrise on Sri Pada — Worth Every Step',
      author: 'Nimasha S.',
      avatarLetter: 'N',
      avatarColor: Color(0xFFE53935),
      location: 'Adam\'s Peak, Ratnapura District',
      date: 'Jan 2026',
      duration: '1 Day',
      difficulty: 'Moderate',
      difficultyColor: Color(0xFFF57F17),
      excerpt:
          'Starting at midnight, climbing 5,500 steps alone, arriving at the summit in the dark '
          'to watch the world light up — this was my most spiritual outdoor experience.',
      body:
          'I set off from the base at 12:15 AM with a headlamp, two litres of water, and a lot '
          'of determination. The pilgrim trail up Adam\'s Peak is unlike any other hike in Sri Lanka '
          '— it is simultaneously a physical challenge and a deeply communal experience, even at '
          'midnight when the stalls are quiet and most pilgrims are already on their way down.\n\n'
          'The 5,500 steps test your legs less than your mind. Around the 3,000-step mark, '
          'the combination of cold and tiredness makes every staircase look identical. '
          'I stopped for ten minutes, ate a banana, and reminded myself why I was there.\n\n'
          'The summit at 4:55 AM was everything. Around 60 people stood in near-silence '
          'as the horizon turned pink, then orange, then gold. The famous triangular shadow '
          'the peak casts onto the clouds below appeared exactly as described — a perfect '
          'pyramid of darkness defying the sunrise. I cried. I am not embarrassed to admit it.\n\n'
          'If you are considering a solo attempt: it is safe, well-marked, and one of the most '
          'rewarding experiences you can have in this country.',
      likes: 147,
      comments: 38,
      coverColor: Color(0xFFF57F17),
      coverIcon: Icons.wb_sunny_outlined,
      tags: ['adams-peak', 'solo', 'sunrise', '1-day'],
    ),
    TripStory(
      id: 's_03',
      title: 'First Overnight Hike: Lessons Learned the Hard Way',
      author: 'Kasun P.',
      avatarLetter: 'K',
      avatarColor: Color(0xFF1565C0),
      location: 'Ella Gap, Badulla District',
      date: 'Apr 2026',
      duration: '2 Days',
      difficulty: 'Easy',
      difficultyColor: Color(0xFF2D6A4F),
      excerpt:
          'Everything that could go wrong with a beginner\'s overnight pack went wrong. '
          'Here is the honest account — and what I will do differently next time.',
      body:
          'My overnight pack weighed 22 kg. I know. I know now, at least. At the time, '
          'my logic was "better to have it and not need it." By kilometre 4, my logic '
          'had been thoroughly corrected by my lower back.\n\n'
          'The list of things I packed that were completely unnecessary includes: a full-size '
          'pillow, four spare T-shirts, a 1.5 kg cast iron cooking pot, and — I am not making '
          'this up — a hardcover book. An actual hardcover book. For one night.\n\n'
          'Despite the weight, the campsite we reached above Ella Gap was genuinely beautiful. '
          'The Ella Rock silhouette at sunset from that elevation is something I had never '
          'seen before. We cooked noodles on a small gas stove (which I will forever '
          'consider my single correct packing decision) and watched the lights of Ella '
          'town appear one by one in the valley below.\n\n'
          'What I will do differently: weigh every item before it goes in. Aim for 10 kg '
          'total for a one-night trip. Leave the book at home. Bring a lightweight pillow.\n\n'
          'The views and the campfire made every ounce worth it. Just far fewer ounces next time.',
      likes: 212,
      comments: 51,
      coverColor: Color(0xFF2D6A4F),
      coverIcon: Icons.cabin_outlined,
      tags: ['beginner', 'overnight', 'ella', 'packing'],
    ),
    TripStory(
      id: 's_04',
      title: 'Sinharaja Rainforest — a Biodiversity Overload',
      author: 'Amali F.',
      avatarLetter: 'A',
      avatarColor: Color(0xFF0097A7),
      location: 'Sinharaja Forest Reserve, Ratnapura',
      date: 'Mar 2026',
      duration: '2 Days',
      difficulty: 'Moderate',
      difficultyColor: Color(0xFFF57F17),
      excerpt:
          'A UNESCO World Heritage site that genuinely deserves every word of that designation. '
          'Two days inside and I still felt like I had barely scratched the surface.',
      body:
          'Sinharaja is not a hike in the conventional sense. It is an immersion. From the moment '
          'you step off the main path into the interior, the canopy closes above you and the '
          'outside world genuinely disappears. Sound, light, temperature — all of it changes.\n\n'
          'We hired a local guide from Kudawa village — this is not optional for the interior '
          'circuits, and our guide Priya turned out to be one of the most knowledgeable naturalists '
          'I have ever met. She identified 23 endemic bird species in two days, named every '
          'tree we passed, and knew exactly where to look for the purple-faced langurs that '
          'visited the camp at dusk.\n\n'
          'The trail itself is physically demanding in a wet-weather way rather than a '
          'steep-gradient way. The ground is perpetually wet, the leeches are real and plentiful '
          '(salt-in-a-small-bag is your friend), and the afternoon rain on day two was truly '
          'tropical in intensity.\n\n'
          'Come here before you die. That is my review.',
      likes: 173,
      comments: 45,
      coverColor: Color(0xFF0097A7),
      coverIcon: Icons.eco_outlined,
      tags: ['sinharaja', 'wildlife', 'rainforest', '2-day'],
    ),
  ];

  // ── Events ────────────────────────────────────────────────
  static const List<OutdoorEvent> events = [
    OutdoorEvent(
      id: 'e_01',
      title: 'Knuckles Trail Clean-Up & Hike',
      organizer: 'ORC SUSL x Knuckles Conservation',
      date: 'Aug 3, 2026',
      time: '6:00 AM – 4:00 PM',
      location: 'Riverside Camp, Knuckles Range',
      type: 'Conservation',
      themeColor: Color(0xFF2D6A4F),
      icon: Icons.eco_outlined,
      participants: 34,
      maxParticipants: 50,
      description:
          'Join us for a day of trail maintenance and waste collection on the Knuckles '
          'Heritage Trail. We will hike the Pitawala Pathana section (8 km round trip), '
          'collecting litter along the way. All equipment is provided. Breakfast and lunch included. '
          'This is a beginner-friendly event — no prior hiking experience required.',
      highlights: [
        'Guided 8 km hike on Pitawala Pathana trail',
        'LNT briefing and waste management workshop',
        'All gloves, bags, and tools provided',
        'Breakfast and lunch from a local caterer',
        'Certificate of participation for all attendees',
      ],
    ),
    OutdoorEvent(
      id: 'e_02',
      title: 'Navigation Skills Day — Map & Compass Workshop',
      organizer: 'ORC SUSL Training Division',
      date: 'Aug 17, 2026',
      time: '8:00 AM – 2:00 PM',
      location: 'SUSL Campus Grounds, Ratnapura',
      type: 'Workshop',
      themeColor: Color(0xFF1565C0),
      icon: Icons.explore_outlined,
      participants: 22,
      maxParticipants: 30,
      description:
          'A hands-on navigation skills workshop covering topographic map reading, compass '
          'techniques, and triangulation. The morning session is classroom-based; the afternoon '
          'puts your new skills to the test on an orienteering course laid out on campus grounds. '
          'Suitable for all skill levels. Compasses and maps provided.',
      highlights: [
        'Topographic map reading fundamentals',
        'Compass bearing and triangulation techniques',
        'Hands-on orienteering course',
        'Magnetic declination workshop',
        'Recommended compass brands and buying guide',
      ],
    ),
    OutdoorEvent(
      id: 'e_03',
      title: 'Wilderness First Aid — Field Certification Weekend',
      organizer: 'ORC SUSL x Sri Lanka Red Cross',
      date: 'Sep 6–7, 2026',
      time: '8:00 AM – 5:00 PM (both days)',
      location: 'Ella, Badulla District',
      type: 'Certification',
      themeColor: Color(0xFFE53935),
      icon: Icons.medical_services_outlined,
      participants: 18,
      maxParticipants: 20,
      description:
          'A two-day wilderness first aid certification course in collaboration with the '
          'Sri Lanka Red Cross Society. Day one covers patient assessment, trauma management, '
          'and environmental emergencies. Day two is scenario-based field practice on real '
          'terrain. Participants receive a WAFA certification on completion.',
      highlights: [
        'Patient assessment system (Primary & Secondary survey)',
        'Trauma management: bleeding, fractures, dislocations',
        'Environmental emergencies: heat stroke, hypothermia, altitude',
        'Day-2 full scenario exercises on field terrain',
        'WAFA Certification issued on completion',
      ],
    ),
    OutdoorEvent(
      id: 'e_04',
      title: 'Beginner Hike — Ella Rock Trail',
      organizer: 'ORC Community Team',
      date: 'Aug 23, 2026',
      time: '6:30 AM – 12:00 PM',
      location: 'Ella Railway Station, Badulla',
      type: 'Community Hike',
      themeColor: Color(0xFFF57F17),
      icon: Icons.hiking_outlined,
      participants: 41,
      maxParticipants: 60,
      description:
          'A guided beginner hike to the summit of Ella Rock — one of the most scenic half-day '
          'hikes in Sri Lanka. Our community leaders will guide all participants on the route, '
          'with rest stops, safety briefings, and a group photo at the summit. Suitable for anyone '
          'with reasonable fitness. A great first hike for new members.',
      highlights: [
        'Guided 6 km round-trip hike to Ella Rock summit',
        'Expert leaders with safety & first aid kits',
        'Three planned rest stops with snacks provided',
        'Group summit photo with ORC community flag',
        'Social lunch in Ella town after the hike',
      ],
    ),
    OutdoorEvent(
      id: 'e_05',
      title: 'Horton Plains Night Sky Camping',
      organizer: 'ORC Astronomy & Outdoors Club',
      date: 'Sep 20, 2026',
      time: 'Depart 3:00 PM — Return next morning',
      location: 'Horton Plains National Park',
      type: 'Overnight Camp',
      themeColor: Color(0xFF6A1B9A),
      icon: Icons.nights_stay_outlined,
      participants: 15,
      maxParticipants: 25,
      description:
          'Camp overnight at Horton Plains (2100 m elevation) for one of the darkest skies '
          'in Sri Lanka. A guided astrophotography and stargazing session at World\'s End viewpoint, '
          'followed by the famous Horton Plains sunrise. Tents and sleeping gear can be rented. '
          'NP entry permits included in the event fee.',
      highlights: [
        'Overnight camp at 2100 m elevation',
        'Guided stargazing session with telescope',
        'Astrophotography tips for beginners',
        'World\'s End sunrise hike (4:30 AM)',
        'NP permits and transport included',
      ],
    ),
    OutdoorEvent(
      id: 'e_06',
      title: 'Sinharaja Biodiversity Walk — Expert Guided',
      organizer: 'ORC Conservation Unit',
      date: 'Oct 5, 2026',
      time: '7:00 AM – 3:00 PM',
      location: 'Kudawa Entrance, Sinharaja',
      type: 'Nature Walk',
      themeColor: Color(0xFF0097A7),
      icon: Icons.nature_outlined,
      participants: 12,
      maxParticipants: 15,
      description:
          'A guided biodiversity walk through the Sinharaja World Heritage Forest with '
          'a qualified naturalist. Focuses on endemic bird species, amphibian diversity, '
          'and the unique layered canopy ecosystem. Limited to 15 participants to minimise '
          'environmental impact. NP permit, local guide, and leech socks included.',
      highlights: [
        'Expert naturalist guide for the full day',
        'Endemic bird identification session',
        'Flora and fauna photography workshop',
        'Leech socks and rain cover provided',
        'NP permits and community guide fees included',
      ],
    ),
  ];

  // ── Find Partners ─────────────────────────────────────────
  static const List<PartnerProfile> partners = [
    PartnerProfile(
      id: 'p_01',
      name: 'Dilshan W.',
      avatarLetter: 'D',
      avatarColor: Color(0xFF2D6A4F),
      location: 'Kandy, Central Province',
      experience: 'Experienced',
      experienceColor: Color(0xFF1565C0),
      skills: ['Navigation', 'Wilderness First Aid', 'Leave No Trace'],
      availability: 'Weekends & Holidays',
      about:
          'Environmental science student at SUSL. Passionate about conservation and '
          'responsible outdoor recreation. Have completed 15+ multi-day hikes across Sri Lanka '
          'including two full Knuckles traverses. Happy to share navigation skills with beginners.',
      upcomingTrips: ['Knuckles Range Aug 10–12', 'Sinharaja Oct 5'],
    ),
    PartnerProfile(
      id: 'p_02',
      name: 'Amali F.',
      avatarLetter: 'A',
      avatarColor: Color(0xFF0097A7),
      location: 'Ratnapura, Sabaragamuwa',
      experience: 'Intermediate',
      experienceColor: Color(0xFF2D6A4F),
      skills: ['Wildlife ID', 'Photography', 'Water Purification'],
      availability: 'Long weekends',
      about:
          'Botany graduate with a deep love for rainforest ecosystems. Sinharaja is my '
          'home trail — I have been there 8 times and always discover something new. '
          'Looking for partners interested in combining hiking with nature photography.',
      upcomingTrips: ['Sinharaja Aug 16–17', 'Horton Plains Sep 20'],
    ),
    PartnerProfile(
      id: 'p_03',
      name: 'Thilan B.',
      avatarLetter: 'T',
      avatarColor: Color(0xFF6A1B9A),
      location: 'Colombo, Western Province',
      experience: 'Beginner',
      experienceColor: Color(0xFFF57F17),
      skills: ['Trip Planning', 'Cooking', 'Tent Setup'],
      availability: 'Full month of August',
      about:
          'Software engineer who recently discovered hiking. Completed two day hikes '
          'this year and ready to try an overnight trip. Looking for experienced partners '
          'who are patient with beginners. I plan meticulously and cook well.',
      upcomingTrips: ['Ella Rock Aug 23', 'Looking for overnight trip'],
    ),
    PartnerProfile(
      id: 'p_04',
      name: 'Kasun P.',
      avatarLetter: 'K',
      avatarColor: Color(0xFF1565C0),
      location: 'Gampaha, Western Province',
      experience: 'Beginner',
      experienceColor: Color(0xFFF57F17),
      skills: ['Knot Tying', 'Camp Setup', 'Packing'],
      availability: 'Fridays to Sundays',
      about:
          'Completed the ORC beginner hike last month and got completely hooked. '
          'Currently working through the equipment guides on the app. Looking for a '
          'patient group to do my first overnight hike with — ideally somewhere with '
          'clear trails and good campsites.',
      upcomingTrips: ['Ella Rock Aug 23', 'Undecided'],
    ),
    PartnerProfile(
      id: 'p_05',
      name: 'Nimasha S.',
      avatarLetter: 'N',
      avatarColor: Color(0xFFE53935),
      location: 'Nuwara Eliya, Central Province',
      experience: 'Experienced',
      experienceColor: Color(0xFF1565C0),
      skills: ['Solo Hiking', 'Weather Reading', 'High Altitude'],
      availability: 'Most weekends',
      about:
          'Completed Sri Pada solo three times and Knuckles twice. Comfortable with '
          'high-altitude, low-visibility conditions. Currently preparing for a '
          'Horton Plains–World\'s End solo circuit. Would love to meet other experienced '
          'hikers interested in less-travelled routes.',
      upcomingTrips: ['Horton Plains Night Camp Sep 20', 'Nuwara Eliya trails'],
    ),
    PartnerProfile(
      id: 'p_06',
      name: 'Roshan M.',
      avatarLetter: 'R',
      avatarColor: Color(0xFFF57F17),
      location: 'Matale, Central Province',
      experience: 'Intermediate',
      experienceColor: Color(0xFF2D6A4F),
      skills: ['Navigation', 'Camp Cooking', 'Trail Scouting'],
      availability: 'School holidays & Long weekends',
      about:
          'Geography teacher with a passion for outdoor education. I use hiking as a '
          'teaching tool and love introducing students to the outdoors responsibly. '
          'Looking for like-minded partners for multi-day trips. I always carry extra '
          'first aid supplies and a topo map.',
      upcomingTrips: ['Knuckles Aug 10–12', 'Knuckles Conservation Day Aug 3'],
    ),
  ];
}
