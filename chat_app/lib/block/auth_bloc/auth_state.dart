import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}


class LoginCubitInitial extends AuthState {}
class LoginCubitLoading extends AuthState {}
class LoginCubitSuccess  extends AuthState {}
class LoginCubitFailure extends AuthState {
  LoginCubitFailure({required this.err_message});

  final String? err_message;
}

class RegisterCubitInitial extends AuthState {}
class RegisterCubitLoading extends AuthState {}
class RegisterCubitSuccess  extends AuthState {}
class RegisterCubitFailure extends AuthState {
  RegisterCubitFailure({required this.err_message});
  final  String? err_message ;

}
