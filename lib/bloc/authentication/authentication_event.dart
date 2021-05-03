import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStartEvent extends AuthenticationEvent {}

class AuthenticationSuccessEvent extends AuthenticationEvent {}
