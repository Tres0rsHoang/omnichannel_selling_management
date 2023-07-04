import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selling_management/blocs/login_blocs/login_states.dart';

import 'login_events.dart';

class LoginBlocs extends Bloc<LoginEvent, LoginState>{
  LoginBlocs(): super(InitLoginState()){
    on<ToggleLoading>((event, emit){
      emit(LoginState(loading: !state.loading));
    });
  }
}