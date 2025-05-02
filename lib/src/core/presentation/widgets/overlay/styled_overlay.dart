import 'dart:async';

import 'package:flutter/material.dart';

import 'widgets/styled_overlay_builder.dart';
import 'widgets/styled_overlay_content.dart';
import 'widgets/styled_overlay_entry.dart';

enum OverlayType { notification, loader }

enum OverlayStatus { show, dismiss }

typedef OverlayStatusCallback = void Function(OverlayStatus status);

class StyledOverlay {
  StyledOverlay._internal();

  factory StyledOverlay() => _instance;
  static final StyledOverlay _instance = StyledOverlay._internal();

  static StyledOverlay get instance => _instance;

  static bool get isShowing => _instance.overlayWidget != null;

  final List<OverlayStatusCallback> _statusCallbacks = <OverlayStatusCallback>[];
  Widget? indicatorWidget;
  Widget? _overlayWidget;
  StyledOverlayEntry? overlayEntry;
  GlobalKey<StyledOverlayContentState>? _key;
  Timer? _timer;

  Widget? get overlayWidget => _overlayWidget;

  static TransitionBuilder init() {
    return (BuildContext context, Widget? child) {
      return StyledOverlayBuilder(child: child);
    };
  }

  static Future<void> showLoader() async {
    if (_instance.indicatorWidget == null) return;
    return _instance._show(
      content: _instance.indicatorWidget!,
      type: OverlayType.loader,
    );
  }

  static Future<void> showToast({
    required Widget toast,
    Duration duration = const Duration(seconds: 4),
  }) {
    return _instance._show(
      content: toast,
      duration: duration,
      type: OverlayType.notification,
    );
  }

  static Future<void> dismiss({bool forceDismiss = false}) {
    _instance._cancelTimer();
    return _instance._dismiss(forceDismiss: forceDismiss);
  }

  Future<void> _show({
    required Widget content,
    required OverlayType type,
    Duration? duration,
  }) async {
    if (_key != null) await dismiss();

    Completer<void> completer = Completer<void>();
    _key = GlobalKey<StyledOverlayContentState>();
    _overlayWidget = StyledOverlayContent(
      key: _key,
      content: content,
      completer: completer,
      type: type,
    );
    completer.future.whenComplete(() {
      _callback(OverlayStatus.show);
      if (duration != null) {
        _cancelTimer();
        _timer = Timer(duration, () async {
          await dismiss();
        });
      }
    });
    _markNeedsBuild();
    return completer.future;
  }

  Future<void> _dismiss({bool forceDismiss = false}) async {
    if (forceDismiss || _key != null && _key?.currentState == null) {
      _reset();
      return;
    }

    return _key?.currentState?.dismissContent().whenComplete(() {
      _reset();
    });
  }

  void _reset() {
    _overlayWidget = null;
    _key = null;
    _cancelTimer();
    _markNeedsBuild();
    _callback(OverlayStatus.dismiss);
  }

  void _callback(OverlayStatus status) {
    for (final OverlayStatusCallback callback in _statusCallbacks) {
      callback(status);
    }
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
