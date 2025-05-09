import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../../../app/di/di.dart';
import '../../../../../core/data/firebase/entities/score_entry.dart';
import '../../../../../core/domain/firebase/service/firebase_score_service.dart';
import '../../../../../core/domain/routing/entity/app_route.dart';
import '../../../game.dart';

part 'start_state.dart';

class StartCubit extends Cubit<StartState> {
  StartCubit() : super(StartInitial());

  final ScoreFirebaseService _scoreFirebaseService = getIt();

  fetchScores() async {
    try {
      final scores = await _scoreFirebaseService.fetchScoresForUser();
      scores.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      final leaderboard = await _scoreFirebaseService.fetchScores();
      emit(state.copyWith(
        scores: scores,
        usersScores: leaderboard,
        isLoading: false,
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  startGame() async {
    emit(StartGoRoute(route: GameProgressRoute()));
  }
}
