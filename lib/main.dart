import 'package:flutter/material.dart';
import 'package:expense_tracker_2/widgets/expenses.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    );
  }
}