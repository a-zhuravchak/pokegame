import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StyledOverlayEntry extends OverlayEntry {
  StyledOverlayEntry({
    required super.builder,
  });

  @override
  void markNeedsBuild() {
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        super.markNeedsBuild();
      });
    } else {
      super.markNeedsBuild();
    }
  }
}
