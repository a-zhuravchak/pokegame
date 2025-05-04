import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class PokeballContainer extends StatelessWidget {
  const PokeballContainer({
    required this.child,
    this.padding = const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
    this.width = 400,
    this.height = 400,
    this.logo = false,
    super.key,
  });

  final EdgeInsetsGeometry padding;
  final Widget child;
  final double? width;
  final double? height;
  final bool logo;

  static BorderRadius borderRadius = BorderRadius.circular(25);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return logo ? buildLogo(theme) : buildContainer(theme);
  }

  Widget buildContainer(ThemeData theme) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: theme.colorScheme.onSecondary,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.13),
            offset: const Offset(0, 3),
            blurRadius: 14,
          ),
        ],
      ),
      child: ClipRRect(borderRadius: borderRadius, child: child),
    );
  }

  Widget buildLogo(ThemeData theme) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        buildContainer(theme),
        Positioned(
          top: -23,
          right: 45,
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Assets.images.pokeball.svg(
              width: 36,
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
