import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'equipment_model.dart';

/// Interactive packing checklist screen for each equipment sub-category.
class EquipmentGuideScreen extends StatefulWidget {
  final EquipmentSubCategory category;
  final EquipmentGuide guide;

  const EquipmentGuideScreen({
    super.key,
    required this.category,
    required this.guide,
  });

  @override
  State<EquipmentGuideScreen> createState() => _EquipmentGuideScreenState();
}

class _EquipmentGuideScreenState extends State<EquipmentGuideScreen> {
  late List<bool> _checkedEssentials;
  late List<bool> _checkedNiceToHave;

  @override
  void initState() {
    super.initState();
    _checkedEssentials =
        List.filled(widget.guide.essentialItems.length, false);
    _checkedNiceToHave =
        List.filled(widget.guide.niceToHaveItems.length, false);
  }

  int get _essentialsDone => _checkedEssentials.where((v) => v).length;
  int get _niceToHaveDone => _checkedNiceToHave.where((v) => v).length;

  double get _overallProgress {
    final total =
        widget.guide.essentialItems.length + widget.guide.niceToHaveItems.length;
    if (total == 0) return 0;
    return (_essentialsDone + _niceToHaveDone) / total;
  }

  @override
  Widget build(BuildContext context) {
    final cat = widget.category;
    final guide = widget.guide;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      body: CustomScrollView(
        slivers: [
          // ── Hero app bar ──────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: cat.color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              cat.title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [cat.color, cat.color.withValues(alpha: 0.75)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(cat.icon,
                                  color: Colors.white, size: 26),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    guide.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    cat.subtitle,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        // Progress bar
                        _ProgressBar(
                          progress: _overallProgress,
                          color: Colors.white,
                          done: _essentialsDone + _niceToHaveDone,
                          total: guide.essentialItems.length +
                              guide.niceToHaveItems.length,
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
                  // ── Description ─────────────────────────────
                  _SectionCard(
                    icon: Icons.info_outline,
                    title: 'About This Gear',
                    color: cat.color,
                    child: Text(
                      guide.description,
                      style: const TextStyle(
                          fontSize: 14, color: AppTheme.charcoal, height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Essential items (interactive checklist) ──
                  _SectionCard(
                    icon: Icons.checklist_outlined,
                    title:
                        'Essential Items ($_essentialsDone/${guide.essentialItems.length})',
                    color: cat.color,
                    child: Column(
                      children: List.generate(
                        guide.essentialItems.length,
                        (i) => _ChecklistRow(
                          label: guide.essentialItems[i],
                          checked: _checkedEssentials[i],
                          color: cat.color,
                          onTap: () => setState(
                              () => _checkedEssentials[i] = !_checkedEssentials[i]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Nice-to-have (interactive checklist) ─────
                  _SectionCard(
                    icon: Icons.stars_outlined,
                    title:
                        'Nice to Have ($_niceToHaveDone/${guide.niceToHaveItems.length})',
                    color: Colors.orange.shade700,
                    child: Column(
                      children: List.generate(
                        guide.niceToHaveItems.length,
                        (i) => _ChecklistRow(
                          label: guide.niceToHaveItems[i],
                          checked: _checkedNiceToHave[i],
                          color: Colors.orange.shade700,
                          onTap: () => setState(() =>
                              _checkedNiceToHave[i] = !_checkedNiceToHave[i]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Buying tips (static bullet list) ─────────
                  _SectionCard(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Buying Tips',
                    color: const Color(0xFF1565C0),
                    child: Column(
                      children: guide.buyingTips
                          .map((tip) => _BulletRow(text: tip,
                              color: const Color(0xFF1565C0)))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Care tips (static bullet list) ───────────
                  _SectionCard(
                    icon: Icons.build_outlined,
                    title: 'Care & Maintenance',
                    color: const Color(0xFF2E7D32),
                    child: Column(
                      children: guide.careTips
                          .map((tip) => _BulletRow(
                              text: tip, color: const Color(0xFF2E7D32)))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Reset button ─────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => setState(() {
                        _checkedEssentials =
                            List.filled(guide.essentialItems.length, false);
                        _checkedNiceToHave =
                            List.filled(guide.niceToHaveItems.length, false);
                      }),
                      icon: const Icon(Icons.refresh_outlined),
                      label: const Text('Reset Checklist'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cat.color,
                        side: BorderSide(color: cat.color),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section card wrapper ─────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.charcoal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

// ── Interactive checklist row ─────────────────────────────────────
class _ChecklistRow extends StatelessWidget {
  final String label;
  final bool checked;
  final Color color;
  final VoidCallback onTap;

  const _ChecklistRow({
    required this.label,
    required this.checked,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: checked ? color : Colors.transparent,
                border: Border.all(
                  color: checked ? color : Colors.grey.shade300,
                  width: 1.8,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: checked
                  ? const Icon(Icons.check, color: Colors.white, size: 15)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13.5,
                  color: checked ? Colors.grey.shade400 : AppTheme.charcoal,
                  decoration:
                      checked ? TextDecoration.lineThrough : TextDecoration.none,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Static bullet row ─────────────────────────────────────────────
class _BulletRow extends StatelessWidget {
  final String text;
  final Color color;

  const _BulletRow({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 13.5, color: AppTheme.charcoal, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Progress bar ──────────────────────────────────────────────────
class _ProgressBar extends StatelessWidget {
  final double progress;
  final Color color;
  final int done;
  final int total;

  const _ProgressBar({
    required this.progress,
    required this.color,
    required this.done,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Packing Progress',
              style: TextStyle(
                  color: color.withValues(alpha: 0.9),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              '$done / $total items',
              style: TextStyle(
                  color: color.withValues(alpha: 0.9),
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
