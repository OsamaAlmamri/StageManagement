
abstract class ChatCubitState {}

class ChatCubitInitial extends ChatCubitState {}
class ChatCubitSuccess  extends ChatCubitState {}
class ChatCubitFailure extends ChatCubitState {
  ChatCubitFailure({required this.err_message});
final  String? err_message ;

}
