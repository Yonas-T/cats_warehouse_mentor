
import 'package:cats_warehouse_mentor/models/dispatch.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/services/dispatchApiProvider.dart';

class DispatchRepository {
  DispatchApiProvider authApiProvider = DispatchApiProvider();


  Future<Dispatch> dispatch(dispatch) =>
      authApiProvider.dispatch(dispatch);

  Future<Dispatch> fetchDispatch() =>
      authApiProvider.fetchDispatch();
  
  Future<Notifications> getNotification() =>
      authApiProvider.getNotification();
}

