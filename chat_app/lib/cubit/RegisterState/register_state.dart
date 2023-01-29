
abstract class RegisterCubitState {}

class RegisterCubitInitial extends RegisterCubitState {}
class RegisterCubitLoading extends RegisterCubitState {}
class RegisterCubitSuccess  extends RegisterCubitState {}
class RegisterCubitFailure extends RegisterCubitState {
  RegisterCubitFailure({required this.err_message});
final  String? err_message ;

}
