# bloc_task

Link for Repo [link](https://github.com/ShazaAllam2001/bloc_task)

Task for practicing Bloc concepts using Flutter package [flutter_bloc](https://pub.dev/packages/flutter_bloc)

## Description of App:
Counter App that incerements and decrements a value on the screen using Plus and Minus button. It has the ability to change the theme from light to dark and vice versa.

## Blocs Used:
- <u>**CounterBloc**</u>
It has **counter_bloc**, **counter_event** (Two events: Inecrement and Decrement) and **counter_state** 
- <u>**ThemeBloc**</u>
It has **theme_bloc**, **theme_event** (Two events: Light and Dark) and **ThemeMode** as theme_state

## Widgets Used:
- <u>**BlocBuilder**</u>
wrapped around the **MaterialApp** to toggle theme
- <u>**BlocListener**</u>
wrapped around the **home scaffold** to show snack bar when toggling theme
- <u>**BlocConsumer**</u>
wrapped around the **counter text** to show snack bar when reaching 10 or -10

## Output Screenshots and Video:
[Output Folder](https://github.com/ShazaAllam2001/bloc_task/tree/main/output)