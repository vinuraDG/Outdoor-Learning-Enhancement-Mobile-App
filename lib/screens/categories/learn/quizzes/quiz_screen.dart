import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../learn_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _current = 0;
  int? _selected;
  bool _answered = false;
  int _score = 0;
  bool _finished = false;
  final List<int?> _answers = List.filled(
    LearnData.quizQuestions.length,
    null,
  );

  void _selectOption(int index) {
    if (_answered) return;
    setState(() {
      _selected = index;
      _answered = true;
      _answers[_current] = index;
      if (index == LearnData.quizQuestions[_current].correctIndex) {
        _score++;
      }
    });
  }

  void _next() {
    if (_current < LearnData.quizQuestions.length - 1) {
      setState(() {
        _current++;
        _selected = _answers[_current];
        _answered = _selected != null;
      });
    } else {
      setState(() => _finished = true);
    }
  }

  void _restart() {
    setState(() {
      _current = 0;
      _selected = null;
      _answered = false;
      _score = 0;
      _finished = false;
      for (int i = 0; i < _answers.length; i++) {
        _answers[i] = null;
      }
    });
  }

  String get _gradeLabel {
    final pct = _score / LearnData.quizQuestions.length;
    if (pct >= 0.9) return 'Expert';
    if (pct >= 0.7) return 'Proficient';
    if (pct >= 0.5) return 'Developing';
    return 'Beginner';
  }

  Color get _gradeColor {
    final pct = _score / LearnData.quizQuestions.length;
    if (pct >= 0.9) return const Color(0xFF2D6A4F);
    if (pct >= 0.7) return const Color(0xFF1565C0);
    if (pct >= 0.5) return const Color(0xFFF57F17);
    return const Color(0xFFE53935);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _finished
              ? 'Quiz Complete'
              : 'Question ${_current + 1} of ${LearnData.quizQuestions.length}',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        bottom: _finished
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(6),
                child: LinearProgressIndicator(
                  value: (_current + (_answered ? 1 : 0)) /
                      LearnData.quizQuestions.length,
                  backgroundColor: Colors.white24,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 6,
                ),
              ),
      ),
      body: _finished ? _buildResults() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final q = LearnData.quizQuestions[_current];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Score chip
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A1B9A).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star_outline,
                        color: Color(0xFF6A1B9A), size: 14),
                    const SizedBox(width: 5),
                    Text(
                      'Score: $_score / ${LearnData.quizQuestions.length}',
                      style: const TextStyle(
                          color: Color(0xFF6A1B9A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Question card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color:
                        const Color(0xFF6A1B9A).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.quiz_outlined,
                        color: Color(0xFF6A1B9A), size: 20),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  q.question,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.charcoal,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Options
          ...q.options.asMap().entries.map((e) {
            final i = e.key;
            final opt = e.value;
            return _OptionTile(
              label: opt,
              index: i,
              selected: _selected == i,
              answered: _answered,
              isCorrect: i == q.correctIndex,
              onTap: () => _selectOption(i),
            );
          }),

          // Explanation card (after answering)
          if (_answered) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _selected == q.correctIndex
                    ? const Color(0xFFE8F5E9)
                    : const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _selected == q.correctIndex
                      ? const Color(0xFF2D6A4F).withValues(alpha: 0.4)
                      : const Color(0xFFE53935).withValues(alpha: 0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _selected == q.correctIndex
                            ? Icons.check_circle_outlined
                            : Icons.info_outlined,
                        color: _selected == q.correctIndex
                            ? const Color(0xFF2D6A4F)
                            : const Color(0xFFE53935),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _selected == q.correctIndex
                            ? 'Correct!'
                            : 'Not quite',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _selected == q.correctIndex
                              ? const Color(0xFF2D6A4F)
                              : const Color(0xFFE53935),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    q.explanation,
                    style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.charcoal,
                        height: 1.5),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          // Next button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _answered ? _next : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                _current < LearnData.quizQuestions.length - 1
                    ? 'Next Question'
                    : 'See Results',
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildResults() {
    final pct = _score / LearnData.quizQuestions.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Score circle
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: pct,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey.shade100,
                        valueColor: AlwaysStoppedAnimation<Color>(_gradeColor),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '$_score',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: _gradeColor,
                          ),
                        ),
                        Text(
                          'of ${LearnData.quizQuestions.length}',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _gradeLabel,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: _gradeColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${(pct * 100).toInt()}% correct — '
                  '${pct >= 0.7 ? "Great work! You have strong outdoor knowledge." : "Keep practising — review the guides and try again."}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Per-question review
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Question Review',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppTheme.charcoal,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...LearnData.quizQuestions.asMap().entries.map((e) {
            final i = e.key;
            final q = e.value;
            final userAns = _answers[i];
            final correct = userAns == q.correctIndex;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border(
                  left: BorderSide(
                    width: 4,
                    color: correct
                        ? const Color(0xFF2D6A4F)
                        : const Color(0xFFE53935),
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    correct ? Icons.check_circle : Icons.cancel_outlined,
                    color: correct
                        ? const Color(0xFF2D6A4F)
                        : const Color(0xFFE53935),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Q${i + 1}: ${q.question}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.charcoal,
                            height: 1.4,
                          ),
                        ),
                        if (!correct && userAns != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Your answer: ${q.options[userAns]}',
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xFFE53935)),
                          ),
                          Text(
                            'Correct: ${q.options[q.correctIndex]}',
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xFF2D6A4F)),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),

          // Buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _restart,
              icon: const Icon(Icons.refresh_outlined),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF6A1B9A),
                side: const BorderSide(color: Color(0xFF6A1B9A)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Back to Learn'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ── Quiz option tile ──────────────────────────────────────────
class _OptionTile extends StatelessWidget {
  final String label;
  final int index;
  final bool selected;
  final bool answered;
  final bool isCorrect;
  final VoidCallback onTap;

  const _OptionTile({
    required this.label,
    required this.index,
    required this.selected,
    required this.answered,
    required this.isCorrect,
    required this.onTap,
  });

  Color get _bgColor {
    if (!answered) return Colors.white;
    if (isCorrect) return const Color(0xFFE8F5E9);
    if (selected && !isCorrect) return const Color(0xFFFFEBEE);
    return Colors.white;
  }

  Color get _borderColor {
    if (!answered) return Colors.grey.shade200;
    if (isCorrect) return const Color(0xFF2D6A4F);
    if (selected && !isCorrect) return const Color(0xFFE53935);
    return Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    final letters = ['A', 'B', 'C', 'D'];
    final letterColor = answered && isCorrect
        ? const Color(0xFF2D6A4F)
        : answered && selected && !isCorrect
            ? const Color(0xFFE53935)
            : const Color(0xFF6A1B9A);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _borderColor, width: 1.5),
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
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: letterColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  letters[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: letterColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: answered && isCorrect
                      ? const Color(0xFF2D6A4F)
                      : answered && selected && !isCorrect
                          ? const Color(0xFFE53935)
                          : AppTheme.charcoal,
                  fontWeight: selected || (answered && isCorrect)
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
            if (answered && isCorrect)
              const Icon(Icons.check_circle, color: Color(0xFF2D6A4F), size: 20),
            if (answered && selected && !isCorrect)
              const Icon(Icons.cancel, color: Color(0xFFE53935), size: 20),
          ],
        ),
      ),
    );
  }
}
