import 'package:expense_tracker_2/widgets/chart/chart.dart';
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
      transactionAmount: 225.00,
      transactionCurrency: 'USD',
      altOneAmount: 180.40,
      altOneCurrency: 'GBP',
      transactionCountry: 'United Kingdom',
      transactionLocation: 'London',
      altTwoCurrency: 'EUR',
      altTwoAmount: 00.1,
    ),
    Expense(
      title: 'mobile wifi',
      date: DateTime.now(),
      category: Category.work,
      transactionAmount: 8.00,
      transactionCurrency: 'USD',
      altOneAmount: 6.41,
      altOneCurrency: 'GBP',
      transactionCountry: 'Cambodia',
      transactionLocation: 'Siem Reap',
      altTwoCurrency: 'EUR',
      altTwoAmount: 00.1,
    ),
    Expense(
      title: 'breakfast',
      date: DateTime.now(),
      category: Category.food,
      transactionAmount: 24000,
      transactionCurrency: 'KHR',
      altOneAmount: 4.68,
      altOneCurrency: 'GBP',
      transactionCountry: 'Cambodia',
      transactionLocation: 'Siem Reap',
      altTwoCurrency: 'EUR',
      altTwoAmount: 00.1,
    ),
    Expense(
      title: 'hotel 2 nights',
      date: DateTime.now(),
      category: Category.accommodation,
      transactionAmount: 2585.00,
      transactionCurrency: 'THB',
      altOneAmount: 76,
      altOneCurrency: 'USD',
      transactionCountry: 'Thailand',
      transactionLocation: 'Bangkok',
      altTwoCurrency: 'EUR',
      altTwoAmount: 00.1,
    ),
    Expense(
      title: 'cambodia - annual work permit',
      date: DateTime.now(),
      category: Category.work,
      transactionAmount: 155.00,
      transactionCurrency: 'USD',
      altOneAmount: 620000,
      altOneCurrency: 'KHR',
      transactionCountry: 'Cambodia',
      transactionLocation: 'Siem Reap',
      altTwoCurrency: 'EUR',
      altTwoAmount: 00.1,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minWidth: 0,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(' Expense Transaction Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const SingleChildScrollView(
      child: Center(
        child: Text('No expenses found. Start adding some!'),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      body: width < 600
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
