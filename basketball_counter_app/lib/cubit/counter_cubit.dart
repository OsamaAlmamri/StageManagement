import 'package:flutter_bloc/flutter_bloc.dart';

import 'counterState.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrementState());

  int teamAPoints = 0;

  int teamBPoints = 0;

  void teamPIncrement({required String team, required int points}) {
    if (team == "A") {
      teamAPoints += points;
      emit(CounterAIncrementState());
    } else {
      teamBPoints += points;
      emit(CounterBIncrementState());
    }
  }
}
