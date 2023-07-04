class LoginState{
  bool loading;
  LoginState({required this.loading});
}
class InitLoginState extends LoginState{
  InitLoginState(): super(loading:true);
}