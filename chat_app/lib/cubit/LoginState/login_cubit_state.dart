
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}
class LoginCubitLoading extends LoginCubitState {}
class LoginCubitSuccess  extends LoginCubitState {}
class LoginCubitFailure extends LoginCubitState {
  LoginCubitFailure({required this.err_message});
final  String? err_message ;

}
