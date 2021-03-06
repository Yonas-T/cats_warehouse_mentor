import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/models/storeNotification.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationApiProvider.dart';

class NotificationRepository {
  NotificationApiProviderService notificationApiProvider =
      NotificationApiProviderService();

  Future<Notifications> fetchNotificationsRepository() async =>
      notificationApiProvider.fetchNotificationsApiProvider();
  // return notificationsRaw!.map((e) => StoreNotification.fromJson(e)).toList();

}
