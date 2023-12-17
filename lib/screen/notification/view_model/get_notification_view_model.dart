import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/notification_models/notification_models.dart';
import 'package:reprohealth_app/services/notification_services/notification_services.dart';

class GetNotificationViewModel extends ChangeNotifier {

  final NotificationService _notificationServices = NotificationService();
  NotificationService? get notificationServices  => _notificationServices;

  NotificationModel? _notificationList;
  NotificationModel? get notificationList => _notificationList;
  
  Future<void> fetchNotification({
    required BuildContext context,
    required idPatients
    }) async {
    try {
      _notificationList = await _notificationServices.getNotification(context: context, idPatients: idPatients);
      notifyListeners();
    } catch (e) {
      (e);
    }
  }
  
}