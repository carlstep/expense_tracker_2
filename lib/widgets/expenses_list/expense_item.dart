// ignore_for_file: public_member_api_docs, sort_constructors_first
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
        childrenPadding: const EdgeInsets.all(20),
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
            Row(
              children: [
                Text(
                  expense.title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
                Text(expense.transactionCurrencyAmount.toStringAsFixed(2)),
                const Spacer(),
                Text(
                  expense.formattedDate,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(categoryItems[expense.category]),
                Spacer(),
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
    );
  }
}
