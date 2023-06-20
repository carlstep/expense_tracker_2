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
      margin: const EdgeInsets.all(10),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: const Color.fromARGB(96, 169, 195, 139),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(expense.transactionCountry),
                const SizedBox(
                  width: 20,
                ),
                Text(expense.transactionLocation),
              ],
            ),
          ],
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expense.transactionCurrency),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                          expense.transactionCurrencyAmount.toStringAsFixed(2)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(categoryItems[expense.category]),
                      Text(
                        expense.formattedDate,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expense.altOneCurrency),
                      Text(expense.altOneCurrencyAmount.toStringAsFixed(2)),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expense.altTwoCurrency),
                      Text(expense.altTwoCurrencyAmount.toStringAsFixed(2)),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
