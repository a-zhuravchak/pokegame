import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

enum InAppNotificationWidgetStyle { error, success, warning, info }

class InAppNotificationWidget extends StatelessWidget {
  const InAppNotificationWidget({
    required this.title,
    this.subtitle,
    this.style = InAppNotificationWidgetStyle.error,
    super.key,
  });

  final String title;
  final String? subtitle;
  final InAppNotificationWidgetStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      constraints: const BoxConstraints(minHeight: 70),
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 15, 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: theme.colorScheme.onSurfaceVariant,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 10,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: .25),
          ),
        ],
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: style.prefixColor(context),
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.onSecondary,
                width: 5,
              ),
            ),
            child: style.prefixIcon,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
                if (subtitle?.isNotEmpty ?? true)
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      subtitle ?? '',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension _Styles on InAppNotificationWidgetStyle {
  Widget get prefixIcon {
    return switch (this) {
      InAppNotificationWidgetStyle.error =>
        Assets.notification.iconNotificationError.svg(),
      InAppNotificationWidgetStyle.success =>
        Assets.notification.iconNotificationSuccess.svg(),
      InAppNotificationWidgetStyle.warning =>
        Assets.notification.iconNotificationWarning.svg(),
      InAppNotificationWidgetStyle.info =>
        Assets.notification.iconNotificationInfo.svg(),
    };
  }

  Color? prefixColor(BuildContext context) {
    final theme = Theme.of(context);
    return switch (this) {
      InAppNotificationWidgetStyle.error => theme.colorScheme.error,
      InAppNotificationWidgetStyle.success => theme.colorScheme.primary,
      InAppNotificationWidgetStyle.warning => theme.colorScheme.tertiary,
      InAppNotificationWidgetStyle.info => theme.colorScheme.tertiary,
    };
  }
}
