import 'package:chat_firebase/cubit/LoginState/login_cubit_cubit.dart';
import 'package:chat_firebase/cubit/LoginState/login_cubit_state.dart';
import 'package:chat_firebase/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_firebase/constants.dart';
import 'package:chat_firebase/widgets/custom_text_field.dart';
import 'package:chat_firebase/widgets/custom_button.dart';
import 'package:chat_firebase/pages/resgister_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  bool isLoading = false;
  static String id = 'login page';

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitLoading)
          isLoading = true;
        else if (state is LoginCubitSuccess)
          Navigator.pushNamed(context, ChatPage.id);
        else if (state is LoginCubitFailure) {
          isLoading = false;
          print(state.err_message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.err_message!),
            ),
          );
        }
        else
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("state.err_message!"),
            ),
          );
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
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
                        'LOGIN',
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
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obscureText: true,
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
                        BlocProvider.of<LoginCubitCubit>(context)
                            .loginUser(email: email!, password: password!);
                      } else {}
                    },
                    text: 'LOGIN',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: Text(
                          '  Register',
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
      ),
    );
  }

}
