import 'package:bloc/bloc.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/models/storeNotification.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';
import 'package:meta/meta.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({required this.notificationRepository})
      : super(NotificationsInitial());

  final NotificationRepository notificationRepository;

  void fetchNotifications() {
    notificationRepository.fetchNotificationsRepository().then((notifications) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        emit(NotificationsLoaded(storeNotifications: notifications));
      });
    });
  }
}
