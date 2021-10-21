part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsFailed extends NotificationsState {
  String message;

  NotificationsFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {
  Notifications notifications;

  NotificationsSuccess({required this.notifications});

  @override
  List<Object> get props => [notifications];
}
