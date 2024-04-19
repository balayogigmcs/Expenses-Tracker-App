import 'package:flutter/material.dart';
import 'package:expenses_tracker_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'movie',
        amount: 15,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
      ),
    );
  }
}
