import 'package:flutter/material.dart';

// ── Forecast day model ────────────────────────────────────────
class ForecastDay {
  final String day;
  final String date;
  final int high;
  final int low;
  final String condition;
  final IconData icon;
  final Color iconColor;
  final int rainChance;

  const ForecastDay({
    required this.day,
    required this.date,
    required this.high,
    required this.low,
    required this.condition,
    required this.icon,
    required this.iconColor,
    required this.rainChance,
  });
}

// ── Hourly slot model ─────────────────────────────────────────
class HourlySlot {
  final String time;
  final int temp;
  final IconData icon;
  final Color iconColor;

  const HourlySlot({
    required this.time,
    required this.temp,
    required this.icon,
    required this.iconColor,
  });
}

// ── Weather topic lesson (educational) ────────────────────────
class WeatherLesson {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String youtubeVideoId;
  final List<String> keyPoints;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const WeatherLesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.youtubeVideoId,
    required this.keyPoints,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}

// ── All static weather data ───────────────────────────────────
class WeatherData {
  static const Map<String, dynamic> current = {
    'location': 'Sabaragamuwa, Sri Lanka',
    'temperature': 26,
    'feelsLike': 29,
    'condition': 'Partly Cloudy',
    'uvIndex': 7,
    'uvLabel': 'High',
    'wind': 14,
    'windDir': 'SW',
    'humidity': 72,
    'visibility': 12,
    'pressure': 1012,
    'dewPoint': 20,
    'rainChance': 30,
  };

  static const List<HourlySlot> hourly = [
    HourlySlot(time: 'Now', temp: 26, icon: Icons.wb_cloudy_outlined, iconColor: Color(0xFF90A4AE)),
    HourlySlot(time: '2PM', temp: 28, icon: Icons.wb_sunny_outlined, iconColor: Color(0xFFFFA726)),
    HourlySlot(time: '4PM', temp: 27, icon: Icons.wb_sunny_outlined, iconColor: Color(0xFFFFA726)),
    HourlySlot(time: '6PM', temp: 24, icon: Icons.cloud_outlined, iconColor: Color(0xFF78909C)),
    HourlySlot(time: '8PM', temp: 22, icon: Icons.nights_stay_outlined, iconColor: Color(0xFF5C6BC0)),
    HourlySlot(time: '10PM', temp: 21, icon: Icons.nights_stay_outlined, iconColor: Color(0xFF5C6BC0)),
    HourlySlot(time: '12AM', temp: 19, icon: Icons.nights_stay_outlined, iconColor: Color(0xFF5C6BC0)),
    HourlySlot(time: '2AM', temp: 18, icon: Icons.nights_stay_outlined, iconColor: Color(0xFF5C6BC0)),
  ];

  static const List<ForecastDay> sevenDay = [
    ForecastDay(
      day: 'Today', date: 'Jul 18',
      high: 28, low: 18,
      condition: 'Partly Cloudy',
      icon: Icons.wb_cloudy_outlined, iconColor: Color(0xFF90A4AE),
      rainChance: 30,
    ),
    ForecastDay(
      day: 'Sat', date: 'Jul 19',
      high: 30, low: 20,
      condition: 'Sunny',
      icon: Icons.wb_sunny_outlined, iconColor: Color(0xFFFFA726),
      rainChance: 5,
    ),
    ForecastDay(
      day: 'Sun', date: 'Jul 20',
      high: 27, low: 19,
      condition: 'Showers',
      icon: Icons.water_drop_outlined, iconColor: Color(0xFF42A5F5),
      rainChance: 75,
    ),
    ForecastDay(
      day: 'Mon', date: 'Jul 21',
      high: 25, low: 17,
      condition: 'Thunderstorm',
      icon: Icons.thunderstorm_outlined, iconColor: Color(0xFF5C6BC0),
      rainChance: 90,
    ),
    ForecastDay(
      day: 'Tue', date: 'Jul 22',
      high: 26, low: 18,
      condition: 'Partly Cloudy',
      icon: Icons.wb_cloudy_outlined, iconColor: Color(0xFF90A4AE),
      rainChance: 20,
    ),
    ForecastDay(
      day: 'Wed', date: 'Jul 23',
      high: 29, low: 21,
      condition: 'Sunny',
      icon: Icons.wb_sunny_outlined, iconColor: Color(0xFFFFA726),
      rainChance: 5,
    ),
    ForecastDay(
      day: 'Thu', date: 'Jul 24',
      high: 31, low: 22,
      condition: 'Hot & Sunny',
      icon: Icons.wb_sunny, iconColor: Color(0xFFFF7043),
      rainChance: 0,
    ),
  ];

  // ── Educational topic lessons ─────────────────────────────
  static const List<WeatherLesson> lessons = [
    WeatherLesson(
      id: 'wl_reading',
      title: 'Reading Outdoor Weather',
      subtitle: 'Interpret forecasts and sky signs for trip planning.',
      description:
          'A weather forecast is a probability, not a certainty. Understanding how to interpret '
          'different forecast elements — precipitation probability, wind speed, humidity — and '
          'combining them with on-the-ground sky observation gives you far more reliable '
          'situational awareness than any single source alone.',
      youtubeVideoId: 'p3vEJkNPSQ4',
      icon: Icons.cloud_outlined,
      color: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
      keyPoints: [
        '"30% chance of rain" means 3 out of 10 days like today will see rain — not that 30% of the area will get rain.',
        'Cumulonimbus clouds (towering anvil-shaped) signal rapid storm development — seek shelter immediately when they build overhead.',
        'A rapidly falling barometer (more than 3 hPa/hour) is one of the most reliable indicators of imminent bad weather.',
        'Wind direction shifts from south-westerly to north-westerly often indicate a cold front passage and clearing conditions behind it.',
        'Dew-point temperature is more reliable than humidity percentage for judging how uncomfortable or stormy conditions will feel.',
        'Always check weather at your specific trailhead elevation — summit forecasts can differ dramatically from valley forecasts.',
      ],
    ),
    WeatherLesson(
      id: 'wl_safety',
      title: 'Extreme Weather Safety',
      subtitle: 'Stay safe in lightning, heat, cold, and flooding.',
      description:
          'Extreme weather is the leading cause of preventable outdoor fatalities globally. '
          'Knowing how to recognise the early signs of dangerous conditions and how to respond '
          'correctly to lightning, heat illness, hypothermia, and flash flooding can save your life.',
      youtubeVideoId: 'uElWFBCDmHA',
      icon: Icons.umbrella_outlined,
      color: Color(0xFFE53935),
      bgColor: Color(0xFFFFEBEE),
      keyPoints: [
        'Lightning: if you hear thunder you are within strike range. Immediately descend from ridges, leave open water, and avoid tall isolated trees.',
        'Heat exhaustion (heavy sweating, weakness, cool clammy skin) requires immediate rest in shade, cooling, and fluid replacement.',
        'Heat stroke (hot dry skin, confusion, loss of consciousness) is a medical emergency — call for rescue and aggressively cool the patient.',
        'Hypothermia begins when core temperature drops below 35°C — symptoms progress from shivering and confusion to unconsciousness.',
        'Flash floods: never attempt to cross flowing water above knee height — 15 cm of fast-moving water can knock an adult off their feet.',
        'Turnaround times are not suggestions — if you set a turnaround time before departure, you must honour it regardless of summit visibility.',
      ],
    ),
    WeatherLesson(
      id: 'wl_seasons',
      title: 'Seasonal Outdoor Preparation',
      subtitle: 'Gear and strategy for every season.',
      description:
          'Each season presents distinct opportunities and hazards in the outdoors. '
          'Understanding seasonal weather patterns, adjusting your gear layering system, '
          'and anticipating seasonal hazards (snow bridges in spring, thunderstorms in summer, '
          'early darkness in autumn, cold-injury risk in winter) makes every season enjoyable.',
      youtubeVideoId: 'O6D1MMHF_oM',
      icon: Icons.ac_unit_outlined,
      color: Color(0xFF0097A7),
      bgColor: Color(0xFFE0F7FA),
      keyPoints: [
        'Spring: melting snowpack creates flood risk in valleys and unstable snowfields above — check avalanche bulletins before any high-route travel.',
        'Summer: afternoon thunderstorm cycles in mountainous terrain are predictable — plan to be below treeline by noon in high-risk areas.',
        'Summer heat requires a minimum 500 ml/hour water consumption rate during active hiking — more in direct sun above 30°C.',
        'Autumn: early darkness means you must start later and finish earlier — always carry a headlamp even on day hikes.',
        'Winter: the moisture content of snow affects avalanche risk dramatically — avoid steep slopes after heavy snowfall or rain-on-snow events.',
        'Layering is year-round — even in summer, temperatures drop rapidly at altitude and after sunset on exposed ridges.',
      ],
    ),
  ];
}
