import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/firebase/service/firebase_score_service.dart';
import '../entities/score_entry.dart';

class ScoreFirebaseServiceImpl implements ScoreFirebaseService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ScoreFirebaseServiceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  @override
  Future<void> saveScore(int score) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception("User not signed in");

    final entry = ScoreEntry(
      uid: user.uid,
      email: user.email ?? '',
      username: user.email?.split('@').first ?? 'Unknown',
      score: score,
      createdAt: DateTime.now(),
    );

    await _firestore.collection('scores').add(entry.toJson());
  }

  @override
  Future<List<ScoreEntry>> fetchScores() async {
    final snapshot = await _firestore.collection('scores').orderBy('score', descending: true).limit(20).get();

    final allScores = snapshot.docs.map((doc) => ScoreEntry.fromJson(doc.data()));

    final Map<String, ScoreEntry> topScorePerUser = {};

    for (final score in allScores) {
      if (!topScorePerUser.containsKey(score.uid)) {
        topScorePerUser[score.uid] = score;
      }
    }
    final result = topScorePerUser.values.toList();

    result.sort((a, b) => b.score.compareTo(a.score));

    return result;
  }

  @override
  Future<List<ScoreEntry>> fetchScoresForUser() async {
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      try {
        final snapshot = await _firestore.collection('scores').where('uid', isEqualTo: uid).limit(10).get();
        return snapshot.docs.map((doc) => ScoreEntry.fromJson(doc.data())).toList();
      } catch (e) {
        rethrow;
      }
    }
    return [];
  }
}
