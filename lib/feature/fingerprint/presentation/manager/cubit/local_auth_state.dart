part of 'local_auth_cubit.dart';

@immutable
sealed class LocalAuthState {}

final class LocalAuthInitial extends LocalAuthState {}

final class LocalAuthSucess extends LocalAuthState {}

final class LocalAuthError extends LocalAuthState {}
