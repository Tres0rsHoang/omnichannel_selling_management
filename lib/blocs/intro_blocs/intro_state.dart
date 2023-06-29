class IntroStates{
  int counter;
  IntroStates({required this.counter});
}
class InitStates extends IntroStates{
  InitStates(): super(counter:0);
}