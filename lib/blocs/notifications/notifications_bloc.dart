import 'package:bloc/bloc.dart';
import 'package:cats_warehouse_mentor/blocs/loginBloc/loginbloc_bloc.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';
import 'package:equatable/equatable.dart';
import '../../services/database/helpers/service.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationRepository notificationRepository;
  
  NotificationsBloc({required NotificationRepository notificationRepository})
      : notificationRepository = notificationRepository,
        super(NotificationsInitial());

  NotificationsState get initialState => NotificationsInitial();

  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is LoadNotification) {
      yield NotificationsInitial();
      try {
        print('entry block');
        Notifications notification =
            await notificationRepository.fetchNotificationsRepository();
        print('in bloc'+notification.data.toString());
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
