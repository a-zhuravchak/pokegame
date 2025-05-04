import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final BoxFit fit;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.handDrawnZoomEffectBackground.svg(
            fit: fit,
          ),
        ),
        child,
      ],
    );
  }
}
