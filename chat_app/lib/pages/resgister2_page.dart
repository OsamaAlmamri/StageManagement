
import 'package:chat_firebase/block/auth_bloc/auth_bloc.dart';
import 'package:chat_firebase/block/auth_bloc/auth_event.dart';
import 'package:chat_firebase/block/auth_bloc/auth_state.dart';
import 'package:chat_firebase/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_firebase/constants.dart';
import 'package:chat_firebase/widgets/custom_button.dart';
import 'package:chat_firebase/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  String? email;
  static String id = 'RegisterPage';
  String? password;
  String? displayName;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
      return ModalProgressHUD(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      displayName = data;
                    },
                    hintText: 'displayName',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButon(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                            RegisterEvent(email: email!, password: password!));
                      } else {}
                    },
                    text: 'REGISTER',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '  Login',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        inAsyncCall: isLoading,
      );
    }, listener: (context, state) {
      if (state is RegisterCubitLoading)
        isLoading = true;
      else if (state is RegisterCubitSuccess)
        Navigator.pushNamed(context, ChatPage.id);
      else if (state is RegisterCubitFailure) {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.err_message!),
          ),
        );
      } else
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("state.err_message!"),
          ),
        );
    });
  }
}
