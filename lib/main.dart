import 'package:cats_warehouse_mentor/blocs/authBloc/authbloc_bloc.dart';
import 'package:cats_warehouse_mentor/blocs/loginBloc/loginbloc_bloc.dart';
import 'package:cats_warehouse_mentor/repositories/authRepositories.dart';
import 'package:cats_warehouse_mentor/screens/loginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CatsApp());
}

class CatsApp extends StatefulWidget {
  final AuthRepository authRepository = AuthRepository();

  @override
  _CatsAppState createState() => _CatsAppState();
}

class _CatsAppState extends State<CatsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) =>
              AuthblocBloc(authRepository: widget.authRepository)
                ..add(AppStartedEvent()),
          child: MyApp(authRepository: widget.authRepository)),
    );
  }
}

class MyApp extends StatefulWidget {
  AuthRepository authRepository;

  MyApp({required this.authRepository});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthblocBloc, AuthblocState>(
      builder: (context, state) {
        if (state is AuthblocInitial) {
          print('init');
          return Container();
        }
        if (state is UnauthenticatedState) {
          print('unauthentic');
          return LoginScreen(authRepository: widget.authRepository);
        }
        if (state is AuthenticatedState) {
          print('authentic');
          return Container();
        }
        return Container();
      },
    );
  }
}
