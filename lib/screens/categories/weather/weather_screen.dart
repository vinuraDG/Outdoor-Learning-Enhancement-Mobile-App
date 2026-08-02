import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'weather_data.dart';
import 'weather_lesson_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cur = WeatherData.current;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          // ── Hero app bar ──────────────────────────────────────
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: const Color(0xFF1565C0),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Weather',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.location_on_outlined,
                    color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/weather.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xB30D47A1), Color(0x730D47A1)],
                      ),
                    ),
                  ),
                  SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Location row
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: Colors.white70, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              cur['location'] as String,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Temperature row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${cur['temperature']}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 56,
                                fontWeight: FontWeight.w200,
                                height: 1,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.wb_cloudy_outlined,
                                    color: Colors.white, size: 36),
                                const SizedBox(height: 4),
                                Text(
                                  cur['condition'] as String,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Feels like ${cur['feelsLike']}°C  •  Rain ${cur['rainChance']}%',
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12),
                        ),
                        const SizedBox(height: 14),
                        // Quick metrics row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _QuickMetric(Icons.air, '${cur['wind']} km/h', 'Wind ${cur['windDir']}'),
                            _QuickMetric(Icons.water_drop_outlined, '${cur['humidity']}%', 'Humidity'),
                            _QuickMetric(Icons.visibility_outlined, '${cur['visibility']} km', 'Visibility'),
                            _QuickMetric(Icons.speed_outlined, '${cur['pressure']} hPa', 'Pressure'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ],
              ),
            ),
          ),

          // ── Hourly forecast ───────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today\'s Hourly Forecast',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.charcoal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 92,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: WeatherData.hourly.length,
                      itemBuilder: (context, i) {
                        final slot = WeatherData.hourly[i];
                        return _HourlyCard(slot: slot, isFirst: i == 0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── 7-day forecast ────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '7-Day Forecast',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.charcoal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: WeatherData.sevenDay.asMap().entries.map((e) {
                        final i = e.key;
                        final day = e.value;
                        return _ForecastRow(
                          day: day,
                          showDivider: i < WeatherData.sevenDay.length - 1,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Outdoor metrics ───────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Outdoor Conditions',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.charcoal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.8,
                    children: [
                      _MetricCard(
                        icon: Icons.wb_sunny_outlined,
                        label: 'UV Index',
                        value: '${cur['uvIndex']}',
                        sub: cur['uvLabel'] as String,
                        color: const Color(0xFFF57F17),
                        bgColor: const Color(0xFFFFF3E0),
                      ),
                      _MetricCard(
                        icon: Icons.air,
                        label: 'Wind',
                        value: '${cur['wind']} km/h',
                        sub: cur['windDir'] as String,
                        color: const Color(0xFF1565C0),
                        bgColor: const Color(0xFFE3F2FD),
                      ),
                      _MetricCard(
                        icon: Icons.water_drop_outlined,
                        label: 'Humidity',
                        value: '${cur['humidity']}%',
                        sub: 'Dew ${cur['dewPoint']}°C',
                        color: const Color(0xFF0097A7),
                        bgColor: const Color(0xFFE0F7FA),
                      ),
                      _MetricCard(
                        icon: Icons.visibility_outlined,
                        label: 'Visibility',
                        value: '${cur['visibility']} km',
                        sub: 'Clear',
                        color: const Color(0xFF2D6A4F),
                        bgColor: const Color(0xFFE8F5E9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── Weather alert banner ──────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: const Color(0xFFF57F17).withValues(alpha: 0.4)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF57F17).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.warning_amber_outlined,
                          color: Color(0xFFF57F17), size: 22),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UV Alert',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Color(0xFFE65100),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'UV index 7 (High) — wear SPF 30+ and cover exposed skin between 10 AM and 3 PM.',
                            style:
                                TextStyle(fontSize: 12, color: Color(0xFFBF360C)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Educational topics ────────────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'Weather Education',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final lesson = WeatherData.lessons[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _EducationCard(
                      lesson: lesson,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              WeatherLessonScreen(lesson: lesson),
                        ),
                      ),
                    ),
                  );
                },
                childCount: WeatherData.lessons.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quick metric chip ─────────────────────────────────────────
class _QuickMetric extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _QuickMetric(this.icon, this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(height: 3),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700)),
        Text(label,
            style:
                const TextStyle(color: Colors.white60, fontSize: 10)),
      ],
    );
  }
}

// ── Hourly slot card ──────────────────────────────────────────
class _HourlyCard extends StatelessWidget {
  final HourlySlot slot;
  final bool isFirst;

  const _HourlyCard({required this.slot, required this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      margin: EdgeInsets.only(right: 10, left: isFirst ? 0 : 0),
      decoration: BoxDecoration(
        color: isFirst
            ? const Color(0xFF1565C0)
            : Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            slot.time,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isFirst ? Colors.white70 : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 6),
          Icon(slot.icon,
              color: isFirst ? Colors.white : slot.iconColor, size: 22),
          const SizedBox(height: 6),
          Text(
            '${slot.temp}°',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isFirst ? Colors.white : AppTheme.charcoal,
            ),
          ),
        ],
      ),
    );
  }
}

// ── 7-day forecast row ────────────────────────────────────────
class _ForecastRow extends StatelessWidget {
  final ForecastDay day;
  final bool showDivider;

  const _ForecastRow({required this.day, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: 44,
                child: Text(
                  day.day,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppTheme.charcoal,
                  ),
                ),
              ),
              Icon(day.icon, color: day.iconColor, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  day.condition,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade500),
                ),
              ),
              Text(
                '${day.rainChance}%',
                style: TextStyle(
                  fontSize: 11,
                  color: day.rainChance > 50
                      ? const Color(0xFF1565C0)
                      : Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${day.low}°',
                style: const TextStyle(
                    fontSize: 13, color: AppTheme.softGray),
              ),
              const SizedBox(width: 6),
              Text(
                '${day.high}°',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.charcoal),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1, indent: 16, endIndent: 16,
              color: Colors.grey.shade100),
      ],
    );
  }
}

// ── Outdoor metric card ───────────────────────────────────────
class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String sub;
  final Color color;
  final Color bgColor;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.sub,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey.shade500)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.charcoal)),
                Text(sub,
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.shade400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Education topic card ──────────────────────────────────────
class _EducationCard extends StatelessWidget {
  final WeatherLesson lesson;
  final VoidCallback onTap;

  const _EducationCard({required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: lesson.bgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(lesson.icon, color: lesson.color, size: 26),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppTheme.charcoal,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    lesson.subtitle,
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey.shade500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: lesson.bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.play_arrow_outlined,
                  color: lesson.color, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
