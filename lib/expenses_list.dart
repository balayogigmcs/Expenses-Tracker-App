import 'package:flutter/material.dart';
import 'package:expenses_tracker_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Text(expenses[index].title),
    );
  }
}