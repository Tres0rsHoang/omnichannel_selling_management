import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selling_management/blocs/intro/intro_event.dart';
import 'package:selling_management/blocs/intro/intro_state.dart';

class IntroBloc extends Bloc<IntroEvents, IntroStates>{
  IntroBloc(): super(InitStates()){
    on<Increment>((event, emit){
      if (state.counter < 3) {
        emit(IntroStates(counter: state.counter + 1));
      } else if (state.counter == 3) {
        emit(IntroStates(counter: 0));
      }
    });
    on<Decrement>((event, emit){
      if (state.counter > 0) {
        emit(IntroStates(counter: state.counter - 1));
      } else if (state.counter == 0) {
        emit(IntroStates(counter: 2));
      }
    });
  }
}