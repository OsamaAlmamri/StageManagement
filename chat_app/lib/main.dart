import 'package:chat_firebase/block/auth_bloc/auth_bloc.dart';
import 'package:chat_firebase/cubit/ChatState/chat_cubit.dart';
import 'package:chat_firebase/cubit/LoginState/login_cubit_cubit.dart';
import 'package:chat_firebase/cubit/RegisterState/register_cubit.dart';
import 'package:chat_firebase/pages/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_firebase/pages/login2_page.dart';
import 'package:chat_firebase/pages/resgister2_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AuthBloc()),
        BlocProvider(create:(context) => LoginCubitCubit()),
        BlocProvider(create:(context) => RegisterCubitCubit()),
        BlocProvider(create:(context) => ChatCubitCubit()),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
