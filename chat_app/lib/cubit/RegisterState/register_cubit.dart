import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit() : super(RegisterCubitInitial());

  Future<void> RegisterUser(
      {required String email, required String password}) async {
    emit(RegisterCubitLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

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
}
