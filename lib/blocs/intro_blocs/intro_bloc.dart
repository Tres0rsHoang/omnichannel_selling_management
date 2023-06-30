import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selling_management/blocs/intro_blocs/intro_event.dart';
import 'package:selling_management/blocs/intro_blocs/intro_state.dart';

class IntroBloc extends Bloc<IntroEvents, IntroStates>{
  IntroBloc(): super(InitStates()){
    on<ChangePic>((event, emit){
      emit(IntroStates(counter: event.index));
    });
  }
}