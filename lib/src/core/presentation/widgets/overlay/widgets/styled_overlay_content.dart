import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../styled_overlay.dart';

enum NotificationDirection {
  bottom,
  left,

  /// Use only this direction at this moment
  right,
}

class StyledOverlayContent extends StatefulWidget {
  const StyledOverlayContent({
    required this.content,
    required this.type,
    this.direction = NotificationDirection.right,
    this.completer,
    super.key,
  });

  final Widget content;
  final Completer<void>? completer;
  final OverlayType type;
  final NotificationDirection direction;

  @override
  State<StatefulWidget> createState() => StyledOverlayContentState();
}

class StyledOverlayContentState extends State<StyledOverlayContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool get isPersistentCallbacks =>
      SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks;

  /// 0 - start; 1 - end
  double dismissProgress = 0;

  double get animationProgress => 1 - dismissProgress;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 333),
    );

    showContent();
  }

  void _controllerListener(AnimationStatus status) {
    bool isCompleted = widget.completer?.isCompleted ?? false;
    if (status == AnimationStatus.completed && !isCompleted) {
      widget.completer?.complete();
    }
  }

  Future<void> showContent() {
    if (isPersistentCallbacks) {
      Completer<TickerFuture> completer = Completer<TickerFuture>();
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => completer.complete(_animationController.forward()),
      );
      return completer.future;
    } else {
      return _animationController.forward();
    }
  }

  Future<void> dismissContent() {
    if (isPersistentCallbacks) {
      Completer<TickerFuture> completer = Completer<TickerFuture>();
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => completer.complete(_animationController.reverse(from: animationProgress)),
      );
      return completer.future;
    } else {
      return _animationController.reverse(from: animationProgress);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      OverlayType.loader => buildLoader,
      OverlayType.notification => buildNotification,
    };
  }

  Widget get buildLoader {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black38,
      alignment: Alignment.center,
      child: SizedBox(
        width: 192,
        height: 192,
        child: widget.content,
      ),
    );
  }

  Widget get buildNotification {
    final animationOffset = tweenOffsetByDirection.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    )..addStatusListener(_controllerListener);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          alignment: alignmentByDirection,
          children: [
            Padding(
              padding: paddingByDirection,
              child: SlideTransition(
                position: animationOffset,
                child: Dismissible(
                  key: UniqueKey(),
                  direction: dismissByDirection,
                  onUpdate: (details) => dismissProgress = details.progress,
                  onDismissed: (direction) => StyledOverlay.dismiss(forceDismiss: true),
                  child: widget.content,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  DismissDirection get dismissByDirection {
    return switch (widget.direction) {
      NotificationDirection.bottom => DismissDirection.down,
      NotificationDirection.left => DismissDirection.endToStart,
      NotificationDirection.right => DismissDirection.startToEnd,
    };
  }

  Tween<Offset> get tweenOffsetByDirection {
    return switch (widget.direction) {
      NotificationDirection.bottom => Tween<Offset>(
          begin: const Offset(0.0, 1.5),
          end: Offset.zero,
        ),
      NotificationDirection.left => Tween<Offset>(
          begin: const Offset(-1.2, 0.0),
          end: Offset.zero,
        ),
      NotificationDirection.right => Tween<Offset>(
          begin: const Offset(1.2, 0.0),
          end: Offset.zero,
        ),
    };
  }

  EdgeInsets get paddingByDirection {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return switch (widget.direction) {
      NotificationDirection.bottom => EdgeInsets.only(bottom: viewPadding.bottom + 20),
      NotificationDirection.left ||
      NotificationDirection.right =>
        EdgeInsets.only(top: viewPadding.top + 70),
    };
  }

  Alignment get alignmentByDirection {
    return switch (widget.direction) {
      NotificationDirection.bottom => Alignment.bottomCenter,
      NotificationDirection.left || NotificationDirection.right => Alignment.topCenter,
    };
  }
}
