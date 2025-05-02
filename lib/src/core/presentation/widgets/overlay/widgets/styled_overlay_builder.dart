import 'package:flutter/material.dart';

import '../styled_overlay.dart';
import 'styled_overlay_entry.dart';

class StyledOverlayBuilder extends StatefulWidget {
  final Widget? child;

  const StyledOverlayBuilder({
    super.key,
    required this.child,
  }) : assert(child != null);

  @override
  StyledOverlayBuilderState createState() => StyledOverlayBuilderState();
}

class StyledOverlayBuilderState extends State<StyledOverlayBuilder> {
  late StyledOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = StyledOverlayEntry(
      builder: (BuildContext context) => StyledOverlay.instance.overlayWidget ?? Container(),
    );
    StyledOverlay.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MediaQuery.withNoTextScaling(
        child: Overlay(
          initialEntries: [
            StyledOverlayEntry(
              builder: (BuildContext context) {
                if (widget.child != null) {
                  return widget.child!;
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            _overlayEntry,
          ],
        ),
      ),
    );
  }
}
