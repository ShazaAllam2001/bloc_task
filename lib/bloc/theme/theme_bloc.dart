import 'package:bloc_task/bloc/theme/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeLight>((event, emit) {
      emit(ThemeMode.light);
    });

    on<ThemeDark>((event, emit) {
      emit(ThemeMode.dark);
    });
  }
}