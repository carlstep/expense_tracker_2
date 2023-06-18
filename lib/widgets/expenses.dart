import 'package:expense_tracker_2/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_2/models/expense.dart';
import 'package:expense_tracker_2/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'visa application',
      date: DateTime.now(),
      category: Category.travel,
      spendCurrencyAmount: 225.00,
      spendCurrency: 'USD',
      homeCurrencyAmount: 180.40,
      homeCurrency: 'GBP',
      spendCountry: 'United Kingdom',
      spendLocation: 'London',
    ),
    Expense(
      title: 'mobile wifi',
      date: DateTime.now(),
      category: Category.work,
      spendCurrencyAmount: 8.00,
      spendCurrency: 'USD',
      homeCurrencyAmount: 6.41,
      homeCurrency: 'GBP',
      spendCountry: 'Cambodia',
      spendLocation: 'Siem Reap',
    ),
    Expense(
      title: 'breakfast',
      date: DateTime.now(),
      category: Category.food,
      spendCurrencyAmount: 24000,
      spendCurrency: 'KHR',
      homeCurrencyAmount: 4.68,
      homeCurrency: 'GBP',
      spendCountry: 'Cambodia',
      spendLocation: 'Siem Reap',
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The chart...'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
