import 'package:flutter/material.dart';

import '../widgets/in_app_notification_provider.dart';

extension InAppNotificationHelper on Exception {
  void display(BuildContext context) {
    showError(context, toString());
  }
}

void showWarning(BuildContext context, String message) {
  InAppNotificationProvider.showWarning(title: message);
}

void showError(BuildContext context, String message) {
  InAppNotificationProvider.showError(title: message);
}
