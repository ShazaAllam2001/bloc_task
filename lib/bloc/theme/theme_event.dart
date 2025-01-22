import 'package:flutter/material.dart';

@immutable
abstract class ThemeEvent {}

class ThemeLight extends ThemeEvent {}

class ThemeDark extends ThemeEvent {}