import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../community_data.dart';

class FindPartnersScreen extends StatefulWidget {
  const FindPartnersScreen({super.key});

  @override
  State<FindPartnersScreen> createState() => _FindPartnersScreenState();
}

class _FindPartnersScreenState extends State<FindPartnersScreen> {
  String _filter = 'All';
  static const List<String> _filters = [
    'All', 'Beginner', 'Intermediate', 'Experienced',
  ];

  List<PartnerProfile> get _filtered => _filter == 'All'
      ? CommunityData.partners
      : CommunityData.partners
          .where((p) => p.experience == _filter)
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFFF57F17),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Find Partners',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(52),
              child: Container(
                height: 52,
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    final active = _filter == _filters[i];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _filter = _filters[i]),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: active
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _filters[i],
                          style: TextStyle(
                            color: active
                                ? const Color(0xFFF57F17)
                                : Colors.white,
                            fontWeight: active
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
        body: _filtered.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.people_outline,
                        size: 48, color: Colors.grey.shade300),
                    const SizedBox(height: 12),
                    Text('No partners at this level yet',
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14)),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _filtered.length,
                itemBuilder: (context, i) {
                  final partner = _filtered[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PartnerProfileScreen(partner: partner),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _CircleAvatar(
                              letter: partner.avatarLetter,
                              color: partner.avatarColor,
                              size: 52,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        partner.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: AppTheme.charcoal,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 3),
                                        decoration: BoxDecoration(
                                          color: partner.experienceColor
                                              .withValues(alpha: 0.12),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          partner.experience,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: partner.experienceColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 12,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text(partner.location,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Colors.grey.shade500)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  // Skills
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 4,
                                    children: partner.skills
                                        .map((s) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                color: partner.avatarColor
                                                    .withValues(alpha: 0.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6),
                                              ),
                                              child: Text(s,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: partner
                                                          .avatarColor)),
                                            ))
                                        .toList(),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    partner.about,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                        height: 1.4),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.event_available_outlined,
                                          size: 12,
                                          color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text(partner.availability,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color:
                                                  Colors.grey.shade400)),
                                      const Spacer(),
                                      Text('View profile',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  const Color(0xFFF57F17),
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(width: 4),
                                      const Icon(
                                          Icons.arrow_forward_outlined,
                                          size: 14,
                                          color: Color(0xFFF57F17)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFF57F17),
        icon: const Icon(Icons.person_add_outlined, color: Colors.white),
        label: const Text('List Yourself',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// ── Partner profile screen ────────────────────────────────────
class PartnerProfileScreen extends StatelessWidget {
  final PartnerProfile partner;

  const PartnerProfileScreen({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: partner.avatarColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      partner.avatarColor.withValues(alpha: 0.9),
                      partner.avatarColor
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(20, 56, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _CircleAvatar(
                            letter: partner.avatarLetter,
                            color: Colors.white.withValues(alpha: 0.25),
                            size: 70,
                            textColor: Colors.white),
                        const SizedBox(height: 10),
                        Text(
                          partner.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.white70, size: 13),
                            const SizedBox(width: 4),
                            Text(partner.location,
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12)),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(partner.experience,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About
                  _ProfileCard(
                    title: 'About',
                    child: Text(partner.about,
                        style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.charcoal,
                            height: 1.65)),
                  ),
                  const SizedBox(height: 12),

                  // Skills
                  _ProfileCard(
                    title: 'Skills',
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: partner.skills
                          .map((s) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: partner.avatarColor
                                      .withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(s,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: partner.avatarColor)),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Availability
                  _ProfileCard(
                    title: 'Availability',
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: partner.avatarColor
                                .withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.event_available_outlined,
                              color: partner.avatarColor, size: 18),
                        ),
                        const SizedBox(width: 12),
                        Text(partner.availability,
                            style: const TextStyle(
                                fontSize: 14,
                                color: AppTheme.charcoal,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Upcoming trips
                  _ProfileCard(
                    title: 'Upcoming Trips',
                    child: Column(
                      children: partner.upcomingTrips
                          .map((trip) => Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: partner.avatarColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(trip,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: AppTheme.charcoal,
                                              height: 1.4)),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.send_outlined),
                      label: Text('Connect with ${partner.name.split(' ').first}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: partner.avatarColor,
                        foregroundColor: Colors.white,
                        padding:
                            const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Shared widgets ────────────────────────────────────────────
class _ProfileCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _ProfileCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.charcoal)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  final String letter;
  final Color color;
  final double size;
  final Color textColor;

  const _CircleAvatar({
    required this.letter,
    required this.color,
    required this.size,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(letter,
            style: TextStyle(
                color: textColor,
                fontSize: size * 0.42,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
