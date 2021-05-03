import 'package:fastkash/bloc/app_bloc.dart';
import 'package:fastkash/bloc/bloc.dart';
import 'package:fastkash/config/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitialState());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartupEvent) {
      yield* _mapApplicationStartupEventToState();
    }
  }

  Stream<ApplicationState> _mapApplicationStartupEventToState() async* {
    /// Start Application Setup
    yield ApplicationLoadingState();

    /// Setup SharedPreferences
    Globals.preferences = await SharedPreferences.getInstance();

    AppBloc.authenticationBloc.add(AuthenticationStartEvent());

    /// Application Setup Completed
    yield ApplicationSetupState();
  }
}