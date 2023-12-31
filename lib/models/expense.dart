// ignore_for_file: public_member_api_docs, sort_constructors_first
// data structure of an expence item
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMMMd();

const uuid = Uuid();

enum Category {
  leisure,
  travel,
  accommodation,
  work,
  food,
}

const categoryItems = {
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.accommodation: Icons.house,
  Category.work: Icons.work,
  Category.food: Icons.lunch_dining,
};

enum Country {
  cambodia,
  usa,
  uk,
}

// TODO - use a flag icon with the country name
const currencyCode = {
  Country.cambodia: 'KHR',
  Country.usa: 'USD',
  Country.uk: 'GBP',
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.category,
    required this.transactionAmount,
    required this.transactionCurrency,
    required this.altOneAmount,
    required this.altOneCurrency,
    required this.transactionCountry,
    required this.transactionLocation,
    required this.altTwoAmount,
    required this.altTwoCurrency,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final Category category;
  final double transactionAmount; // value before converting to home currency
  final String transactionCurrency; // local or spend currency
  final double altOneAmount; // value after converting
  final String altOneCurrency; // home currency
  final String transactionCountry; // country of the spend
  final String transactionLocation; // location of the spend
  final double altTwoAmount; // value after converting
  final String altTwoCurrency;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.transactionAmount;
    }

    return sum;
  }
}

// Other fields - alternativeCurrency