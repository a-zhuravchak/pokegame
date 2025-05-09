import '../../../data/firebase/entities/score_entry.dart';

abstract class ScoreFirebaseService {
  Future<void> saveScore(int score);
  Future<List<ScoreEntry>> fetchScores();
  Future<List<ScoreEntry>> fetchScoresForUser();
}
