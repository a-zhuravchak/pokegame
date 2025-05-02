import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokegame/src/features/auth/auth.dart';

import '../../../../../app/di/di.dart';
import '../../../../../core/domain/routing/entity/app_route.dart';
import '../../../../../core/domain/startup/startup_service.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashInitial());

  late AppRoute _pendingAppRoute;
  final StartupService startupService = getIt();

  splashInit() async {
    await startupService.performStartup();
    _pendingAppRoute = AuthInitialRoute();

    Future.delayed(const Duration(seconds: 2)).then((_) => splashFinished());
  }

  splashFinished() async {
    emit(SplashGoRoute(route: _pendingAppRoute));
  }
}
