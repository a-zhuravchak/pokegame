import 'dart:async';

import 'entities/startup_result.dart';

abstract class StartupService {
  Future<StartupResult?> get startupResult;

  Future<StartupResult> performStartup();

  Future<void> reset();
}

class StartupDefaultService implements StartupService {
  StartupDefaultService();

  StartupResult? _startupResult;

  @override
  Future<StartupResult?> get startupResult async {
    return _startupResult;
  }

  @override
  Future<StartupResult> performStartup() async {
    return await _markSuccess();
  }

  Future<StartupResult> _markSuccess() async {
    final result = StartupSucceed();
    _startupResult = result;
    return result;
  }

  @override
  Future<void> reset() async {
    _startupResult = null;
  }
}
