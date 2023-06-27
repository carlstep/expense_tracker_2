import 'package:flutter/material.dart';
import 'package:expense_tracker_2/widgets/expenses.dart';

import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(199, 147, 191, 98),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 8, 50, 9),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        ),
        expansionTileTheme: const ExpansionTileThemeData().copyWith(
          collapsedBackgroundColor: kDarkColorScheme.secondaryContainer,
          backgroundColor: kDarkColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        ),
        expansionTileTheme: const ExpansionTileThemeData().copyWith(
          collapsedBackgroundColor: kColorScheme.secondaryContainer,
          backgroundColor: kColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.poppins(
                fontSize: 16,
                color: kColorScheme.onPrimaryContainer,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
