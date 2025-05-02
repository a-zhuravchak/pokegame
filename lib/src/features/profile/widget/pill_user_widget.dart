import 'package:flutter/material.dart';

class PillIUserWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  final double height;

  final double horizontalPadding;

  const PillIUserWidget({
    super.key,
    this.onPressed,
    this.height = 32,
    this.horizontalPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Material(
        color: cs.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(height / 2),
          onTap: onPressed,
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            alignment: Alignment.center,
            decoration: const ShapeDecoration(shape: StadiumBorder()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(
                Icons.person,
                size: height * 0.6,
                color: cs.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
