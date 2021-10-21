
import 'package:cats_warehouse_mentor/models/dispatch.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/models/userCred.dart';
import 'package:cats_warehouse_mentor/services/dispatchApiProvider.dart';

class DispatchRepository {
  DispatchApiProvider authApiProvider = DispatchApiProvider();


  Future<Dispatch> dispatch(dispatch) =>
      authApiProvider.dispatch(dispatch);
  
  Future<Notifications> getNotification() =>
      authApiProvider.getNotification();
}

