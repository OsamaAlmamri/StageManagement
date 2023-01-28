
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit_state.dart';


class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginCubitLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginCubitSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('user not found'),
        //   ),
        // );

        emit(LoginCubitFailure(err_message: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginCubitFailure(err_message: 'wrong-password'));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('wrong password'),
        //   ),
        // );
      }
    } catch (ex) {
      print(ex);
      emit(LoginCubitFailure(err_message:"there was an error" ));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('there was an error'),
      //   ),
      // );
    }
  }
}
