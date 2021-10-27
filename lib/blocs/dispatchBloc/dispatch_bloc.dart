import 'package:bloc/bloc.dart';
import 'package:cats_warehouse_mentor/models/dispatch.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/models/receipt.dart';
import 'package:cats_warehouse_mentor/repositories/dispatchRepository.dart';
import 'package:equatable/equatable.dart';

part 'dispatch_event.dart';
part 'dispatch_state.dart';

class DispatchBloc extends Bloc<DispatchEvent, DispatchState> {
  DispatchRepository? dispatchRepository;

  DispatchBloc({required DispatchRepository? dispatchRepository})
      : super(DispatchInitialState()) {
    this.dispatchRepository = dispatchRepository;
  }

  @override
  DispatchState get initialState => DispatchInitialState();

  @override
  Stream<DispatchState> mapEventToState(DispatchEvent event) async* {
    if (event is DispatchFetchEvent) {
      yield DispatchInitialState();
      try {
        var ispatchFetched = await dispatchRepository!.fetchDispatch();
        print('in the bloc:' + ispatchFetched.dispatchData[0].driverName);
        yield DispatchLoadedState(dispatchLoaded: ispatchFetched);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }

    if (event is StartCount) {
      yield DispatchProceedState(dispatchData: event.notificationDataToCount);
    }

    if (event is CountIncrement) {
      try {
        var incrementedValue = event.currentValue++;
        yield DispatchIncrementedState(currentValue: incrementedValue);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }

    if (event is CountDecrement) {
      try {
        var decrementedValue = event.currentValue--;
        yield DispatchIncrementedState(currentValue: decrementedValue);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }

    if (event is DamagedCountIncrement) {
      try {
        var incrementedValue = event.currentValue++;
        yield DispatchDamagedIncrementedState(currentValue: incrementedValue);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }

    if (event is DamagedCountDecrement) {
      try {
        var decrementedValue = event.currentValue--;
        yield DispatchDamagedIncrementedState(currentValue: decrementedValue);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }

    if (event is FinishCount) {
      try {
        List<Reciept> dispatchToConfirm = event.dispatchToConfirm;

        dispatchToConfirm.forEach((element) async {
          await dispatchRepository!.dispatch(dispatchToConfirm);
        });

        yield DispatchSuccessState(dispatchConfirmed: dispatchToConfirm);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }

    if (event is WarehouseManagerConfirm) {
      try {
        // <Dispatch> dispatchConfirmed = event.dispatchConfirmed;
        // yield DispatchSuccessState(dispatchConfirmed: dispatchConfirmed);
      } catch (e) {
        yield DispatchFailedState(message: e.toString());
      }
    }
  }
}
