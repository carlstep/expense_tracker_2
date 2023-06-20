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
const countryFlags = {
  Country.cambodia: '🇰🇭',
  Country.usa: '🇺🇸',
  Country.uk: '🇬🇧',
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.category,
    required this.transactionCurrencyAmount,
    required this.transactionCurrency,
    required this.altOneCurrencyAmount,
    required this.altOneCurrency,
    required this.transactionCountry,
    required this.transactionLocation,
    required this.altTwoCurrencyAmount,
    required this.altTwoCurrency,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final Category category;
  final double
      transactionCurrencyAmount; // value before converting to home currency
  final String transactionCurrency; // local or spend currency
  final double altOneCurrencyAmount; // value after converting
  final String altOneCurrency; // home currency
  final String transactionCountry; // country of the spend
  final String transactionLocation; // location of the spend
  final double altTwoCurrencyAmount; // value after converting
  final String altTwoCurrency;

  String get formattedDate {
    return formatter.format(date);
  }
}

// Other fields - alternativeCurrency