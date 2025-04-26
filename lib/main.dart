import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/screen/place_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorsScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  surface: const Color.fromARGB(255, 56, 49, 66),
);
final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorsScheme.surface,
  colorScheme: colorsScheme,
  // textTheme:
);

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const PlaceScreen());
  }
}
