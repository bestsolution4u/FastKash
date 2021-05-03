import 'package:fastkash/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  static final applicationBloc = ApplicationBloc();
  static final authenticationBloc = AuthenticationBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(create: (context) => applicationBloc),
    BlocProvider<AuthenticationBloc>(create: (context) => authenticationBloc),
  ];

  static void dispose() {
    applicationBloc.close();
    authenticationBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}