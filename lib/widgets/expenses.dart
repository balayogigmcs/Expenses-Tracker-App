import 'package:flutter/material.dart';
import 'package:expenses_tracker_app/models/expense.dart';
import 'package:expenses_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker_app/widgets/new_expenses.dart';

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

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: NewExpenses(onAddExpense: _addExpense),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Text("Expenses not found, Add some!");
    if (_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
                  expenses: _registeredExpenses,
                  onRemoveExpense: _removeExpense);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Expenses Tracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(
                Icons.add,
                size: 50,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text(' The Chart'),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
