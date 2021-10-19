part of 'loginbloc_bloc.dart';

abstract class LoginblocEvent extends Equatable {
  const LoginblocEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginblocEvent {

  final String email, password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}