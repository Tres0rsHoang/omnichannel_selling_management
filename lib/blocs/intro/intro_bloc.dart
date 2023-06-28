import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selling_management/blocs/intro/intro_event.dart';
import 'package:selling_management/blocs/intro/intro_state.dart';

class IntroBloc extends Bloc<IntroEvents, IntroStates>{
  IntroBloc(): super(InitStates()){
    on<Increment>((event, emit){
      emit(IntroStates(counter: state.counter + 1));
    });
    on<Decrement>((event, emit){
      emit(IntroStates(counter: state.counter - 1));
    });
  }
}