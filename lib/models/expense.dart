// ignore_for_file: public_member_api_docs, sort_constructors_first
// data structure of an expence item
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

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
    required this.spendCurrencyAmount,
    required this.spendCurrency,
    required this.homeCurrencyAmount,
    required this.homeCurrency,
    required this.spendCountry,
    required this.spendLocation,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final Category category;
  final double spendCurrencyAmount; // value before converting to home currency
  final String spendCurrency; // local or spend currency
  final double homeCurrencyAmount; // value after converting
  final String homeCurrency; // home currency
  final String spendCountry; // country of the spend
  final String spendLocation; // location of the spend

  String get formattedDate {
    return formatter.format(date);
  }
}

// Other fields - alternativeCurrency