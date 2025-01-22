import 'package:bloc_task/bloc/counter/counter_event.dart';
import 'package:bloc_task/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrement>((event, emit) {
      emit(CounterState(state.count + 1));
    });

    on<CounterDecrement>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}