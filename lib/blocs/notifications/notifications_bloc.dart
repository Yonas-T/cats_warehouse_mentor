import 'package:bloc/bloc.dart';
import 'package:cats_warehouse_mentor/blocs/loginBloc/loginbloc_bloc.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';
import 'package:equatable/equatable.dart';
import '../../services/database/helpers/service.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationRepository? notificationRepository;
  NotificationsBloc({required NotificationRepository? notificationRepository})
      : super(NotificationsInitial()) {
    this.notificationRepository = notificationRepository;
  }

  NotificationsState get initialState => NotificationsInitial();

  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is LoadNotification) {
      yield NotificationsLoading();
      try {
        print('entry block');
        Notifications notification =
            await notificationRepository!.fetchNotificationsRepository();
        // notification.data.forEach((element) {

        // });
        // notification.data[0];NotificationDataService notificationForLocal=NotificationDataService() notificationForLocal.savenotification
        yield NotificationsSuccess(notifications: notification);
      } catch (e) {
        print(e);
        yield NotificationsFailed(message: e.toString());
      }
    }
  }
}
