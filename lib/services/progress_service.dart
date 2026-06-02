// progress_service.dart
// Tracks lesson completion progress in memory (extend with Firestore as needed)

class ProgressService {
  static final Map<String, double> _progress = {};
  static final Set<String> _completed = {};

  // Update progress for a lesson (0.0 – 1.0)
  static void updateProgress(String lessonId, double value) {
    _progress[lessonId] = value.clamp(0.0, 1.0);
    if (value >= 1.0) {
      _completed.add(lessonId);
    }
  }

  // Get progress for a lesson
  static double getProgress(String lessonId) {
    return _progress[lessonId] ?? 0.0;
  }

  // Mark lesson as complete
  static void markComplete(String lessonId) {
    _progress[lessonId] = 1.0;
    _completed.add(lessonId);
  }

  // Check if lesson is complete
  static bool isComplete(String lessonId) {
    return _completed.contains(lessonId);
  }

  // Overall progress percentage (0–100)
  static int get overallPercent {
    if (_progress.isEmpty) return 0;
    final total = _progress.values.fold(0.0, (a, b) => a + b);
    return ((total / _progress.length) * 100).toInt();
  }

  // Count of completed lessons
  static int get completedCount => _completed.length;

  // Count of in-progress lessons
  static int get inProgressCount =>
      _progress.values.where((v) => v > 0 && v < 1.0).length;
}