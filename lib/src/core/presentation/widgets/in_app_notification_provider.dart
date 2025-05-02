import 'in_app_notification_widget.dart';
import 'overlay/styled_overlay.dart';

class InAppNotification {
  InAppNotification({required this.style, required this.title, required this.subtitle});

  final InAppNotificationWidgetStyle style;
  final String title;
  final String? subtitle;
}

class InAppNotificationProvider {
  static void show(InAppNotification notification) {
    final widget = InAppNotificationWidget(
      title: notification.title,
      subtitle: notification.subtitle,
      style: notification.style,
    );
    StyledOverlay.showToast(toast: widget);
  }

  static void showWarning({required String title, String? subtitle}) {
    return show(
      InAppNotification(
        title: title,
        subtitle: subtitle,
        style: InAppNotificationWidgetStyle.warning,
      ),
    );
  }

  static void showError({required String title, String? subtitle}) {
    return show(
      InAppNotification(
        title: title,
        subtitle: subtitle,
        style: InAppNotificationWidgetStyle.error,
      ),
    );
  }

  static void showSuccess({required String title, String? subtitle}) {
    return show(
      InAppNotification(
        title: title,
        subtitle: subtitle,
        style: InAppNotificationWidgetStyle.success,
      ),
    );
  }

  static void showInfo({required String title, String? subtitle}) {
    return show(
      InAppNotification(
        title: title,
        subtitle: subtitle,
        style: InAppNotificationWidgetStyle.info,
      ),
    );
  }
}
