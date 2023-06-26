// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker_2/main.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker_2/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    Key? key,
    required this.expense,
  }) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        // backgroundColor: kColorScheme.primaryContainer,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  expense.transactionCurrency,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(expense.transactionAmount.toStringAsFixed(2)),
                const Spacer(),
                Text(
                  expense.formattedDate,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(categoryItems[expense.category]),
                const Spacer(),
                Text(
                  expense.transactionCountry,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  expense.transactionLocation,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          const Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(expense.altOneCurrency),
                  Text(expense.altOneAmount.toStringAsFixed(2)),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(expense.altTwoCurrency),
                  Text(expense.altTwoAmount.toStringAsFixed(2)),
                ],
              ),
              const Spacer(),
              IconButton(
                // TODO - show popup dialog to display full expense data, with option to share
                onPressed: () {},
                icon: const Icon(Icons.info_outline_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
