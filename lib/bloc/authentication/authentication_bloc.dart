import 'package:fastkash/bloc/authentication/bloc.dart';
import 'package:fastkash/config/pref_params.dart';
import 'package:fastkash/util/preference_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationStartEvent) {
      yield* _mapAuthStartEventToState();
    }
  }

  Stream<AuthenticationState> _mapAuthStartEventToState() async* {
    yield AuthenticationInitial();
    String email = PreferenceHelper.getString(PrefParams.EMAIL);
    String password = PreferenceHelper.getString(PrefParams.PASSWORD);
    if (email.isNotEmpty && password.isNotEmpty) {
      yield AuthenticationSuccess();
    } else {
      yield AuthenticationFailure();
    }
  }
}