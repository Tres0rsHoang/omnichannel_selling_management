import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/intro/intro_bloc.dart';
import '../../blocs/intro/intro_event.dart';
import '../../blocs/intro/intro_state.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*Center(
        child: BlocBuilder<IntroBloc, IntroStates>(
          builder: (context, state){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${BlocProvider.of<IntroBloc>(context).state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),*/ Image.asset('assets/images/full_logo.jpg'),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<IntroBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(FontAwesomeIcons.plus),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<IntroBloc>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(FontAwesomeIcons.minus),
          ),
        ],
      ),
    );
  }
}
