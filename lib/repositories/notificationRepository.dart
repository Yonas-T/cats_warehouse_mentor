import 'package:cats_warehouse_mentor/models/storeNotification.dart';
import 'package:cats_warehouse_mentor/services/notificationApiProvider.dart';

class NotificationRepository{

  final NotificationApiProvider notificationApiProvider;

  NotificationRepository({required this.notificationApiProvider});

  Future<List<StoreNotification>> fetchNotificationsRepository() async{
    final notificationsRaw = await notificationApiProvider.fetchNotificationsApi();
    return notificationsRaw!.map((e) => StoreNotification.fromJson(e)).toList();
  }

}