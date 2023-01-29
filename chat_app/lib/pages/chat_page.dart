import 'package:chat_firebase/cubit/ChatState/chat_cubit.dart';
import 'package:chat_firebase/cubit/ChatState/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:chat_firebase/constants.dart';
import 'package:chat_firebase/models/message.dart';
import 'package:chat_firebase/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    List<Message> messagesList=[];
    sendMessage() {
      BlocProvider.of<ChatCubitCubit>(context).sendMessage(message:  controller.text, email: email.toString());
      controller.clear();
      _controller.animateTo(0,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            Text('chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubitCubit, ChatCubitState>(
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    });
              },
              listener: (context, state) {
                if(state is ChatCubitSuccess)
                  messagesList=state.messagesList;

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                sendMessage();
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    sendMessage();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class SuccessBody extends StatelessWidget {
  const SuccessBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

