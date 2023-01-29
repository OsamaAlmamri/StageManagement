import 'package:chat_firebase/models/message.dart';

abstract class ChatCubitState {}

class ChatCubitInitial extends ChatCubitState {}

class ChatCubitSuccess extends ChatCubitState {
  ChatCubitSuccess({required this.messagesList});

  List<Message> messagesList;
}

class ChatCubitFailure extends ChatCubitState {
  ChatCubitFailure({required this.err_message});

  final String? err_message;
}
