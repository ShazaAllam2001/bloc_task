import 'package:bloc_task/bloc/counter/counter_bloc.dart';
import 'package:bloc_task/bloc/counter/counter_event.dart';
import 'package:bloc_task/bloc/counter/counter_state.dart';
import 'package:bloc_task/bloc/theme/theme_bloc.dart';
import 'package:bloc_task/bloc/theme/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    final themeBloc = context.read<ThemeBloc>();

    return BlocListener<ThemeBloc, ThemeMode>(
      listener: (context, state) {
        if (state == ThemeMode.light) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Changed theme to Light!"), duration: Duration(seconds: 2),)
          );
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Changed theme to Dark!"), duration: Duration(seconds: 2),)
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            Text("Light"),
            Switch(
              value: themeBloc.state == ThemeMode.dark, 
              onChanged: (value) {
                if (themeBloc.state == ThemeMode.dark) {
                  themeBloc.add(ThemeLight());
                }
                else {
                  themeBloc.add(ThemeDark());
                }  
              }
            ),
            Text("Dark"),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterBloc, CounterState>(
                listener: (context, state) {
                  if (state.count == 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Reached 10!"), duration: Duration(seconds: 2),)
                    );
                  }
                  else if (state.count == -10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Reached -10!"), duration: Duration(seconds: 2),)
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterIncrement());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterDecrement());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        )
      )
    );
  }
}