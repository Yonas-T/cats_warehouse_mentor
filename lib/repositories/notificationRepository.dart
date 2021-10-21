import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/models/storeNotification.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationApiProvider.dart';

class NotificationRepository{

  final NotificationApiProviderService notificationApiProvider;

  NotificationRepository({required this.notificationApiProvider});

  Future<Notifications> fetchNotificationsRepository() async{
    return notificationApiProvider.fetchNotificationsApiProvider();
    // return notificationsRaw!.map((e) => StoreNotification.fromJson(e)).toList();
  }

}