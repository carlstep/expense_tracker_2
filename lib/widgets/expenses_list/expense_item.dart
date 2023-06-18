// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expense_tracker_2/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    Key? key,
    required this.expense,
  }) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expense.spendCurrency),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.spendCurrencyAmount.toStringAsFixed(2)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expense.homeCurrency),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.homeCurrencyAmount.toStringAsFixed(2)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(expense.spendCountry),
                const Spacer(),
                Icon(categoryItems[expense.category]),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  expense.formattedDate,
                ),
              ],
            ),
            Row(
              children: [
                Text(expense.spendLocation),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
