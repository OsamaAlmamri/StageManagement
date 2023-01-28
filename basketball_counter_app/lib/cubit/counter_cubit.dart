import 'package:flutter_bloc/flutter_bloc.dart';

import 'counterState.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrementState());


}