part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  late final Notifications storeNotifications;
  NotificationsLoaded({required this.storeNotifications});
}
