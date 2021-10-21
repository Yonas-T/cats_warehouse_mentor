import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cats_warehouse_mentor/models/userCred.dart';
import 'package:cats_warehouse_mentor/repositories/authRepositories.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthblocBloc extends Bloc<AuthblocEvent, AuthblocState> {
  AuthRepository? authRepository;
  AuthblocBloc({required AuthRepository? authRepository})
      : super(AuthblocInitial()) {
    this.authRepository = authRepository;
  }

  @override
  // TODO: implement initialState
  AuthblocState get initialState => AuthblocInitial();

  @override
  Stream<AuthblocState> mapEventToState(AuthblocEvent event) async* {
    if (event is AppStartedEvent) {
      yield AuthblocInitial();
      try {
        print('object');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(prefs);
        var token = prefs.getString('user')!;
        print(token);

        if (token.isNotEmpty) {
          yield AuthenticatedState(token: token);
        }

        // yield AuthenticatedState(user: user);
      } catch (e) {
        yield UnauthenticatedState(e.toString());
      }
    }
  }
}
