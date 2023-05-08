part of 'login_cubit_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}
class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}