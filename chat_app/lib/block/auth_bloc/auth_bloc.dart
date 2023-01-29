import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginCubitLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginCubitSuccess());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'user-not-found') {
            emit(LoginCubitFailure(err_message: 'user not found'));
          } else if (ex.code == 'wrong-password') {
            emit(LoginCubitFailure(err_message: 'wrong-password'));
          }
        } catch (ex) {
          print(ex);
          emit(LoginCubitFailure(err_message: "there was an error"));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterCubitLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(RegisterCubitSuccess());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'weak-password') {
            emit(RegisterCubitFailure(err_message: 'weak-password'));
          } else if (ex.code == 'email-already-in-use') {
            emit(RegisterCubitFailure(err_message: 'email-already-in-use'));
          }
        } catch (ex) {
          emit(RegisterCubitFailure(err_message: 'there was an error'));
        }
      }
    });
  }
}
