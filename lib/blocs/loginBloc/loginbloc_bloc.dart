import 'package:bloc/bloc.dart';
import 'package:cats_warehouse_mentor/models/userCred.dart';
import 'package:cats_warehouse_mentor/repositories/authRepositories.dart';
import 'package:equatable/equatable.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  AuthRepository? authRepository;
  LoginblocBloc({required AuthRepository? authRepository})
      : super(LoginblocInitial()) {
    this.authRepository = authRepository;
  }

  LoginblocState get initialState => LoginblocInitial();

  Stream<LoginblocState> mapEventToState(LoginblocEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        print('intry block');
        var user = await authRepository!.login(event.email, event.password);
        print('USER: $user');
        yield LoginSuccessState(user);
      } catch (e) {
        print(e);
        yield LoginFailState(e.toString());
      }
    }
  }
}
