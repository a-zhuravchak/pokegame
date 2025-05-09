import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../core/data/firebase/service/firebase_auth_service.dart';
import '../../core/data/firebase/service/firebase_score_service.dart';
import '../../core/domain/firebase/service/firebase_auth_service.dart';
import '../../core/domain/firebase/service/firebase_score_service.dart';

void setup(GetIt getIt) {
  _setupFirebaseAuth(getIt);
  _setupFirebaseStorage(getIt);
}

void _setupFirebaseAuth(GetIt getIt) {
  getIt.registerLazySingleton<ScoreFirebaseService>(
    () => ScoreFirebaseServiceImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ),
  );
}

void _setupFirebaseStorage(GetIt getIt) {
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthServiceImpl(
      auth: FirebaseAuth.instance,
    ),
  );
}
