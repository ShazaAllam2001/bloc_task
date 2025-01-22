import 'package:bloc_task/bloc/counter/counter_bloc.dart';
import 'package:bloc_task/bloc/theme/theme.dart';
import 'package:bloc_task/bloc/theme/theme_bloc.dart';
import 'package:bloc_task/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc()
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            home: const MyHomePage(title: 'Flutter Home Page')
          );
        }
      )
    );
  }
}
