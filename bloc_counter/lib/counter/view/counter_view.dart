import 'package:bloc_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit,int>(
          builder: (context, state){
            return Text('$state'  ,style: textTheme.displayMedium, );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment:  CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              key: const Key('counterView_increment_floatingButton'),
              child:const Icon(Icons.add),
              onPressed: () => context.read<CounterCubit>().increment()),
          FloatingActionButton(
              key: Key('counterView_decrement_floatingButton'),
              child: Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement()),
        ],
      ),
    );
  }
}
