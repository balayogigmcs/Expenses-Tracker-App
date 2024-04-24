import 'package:expenses_tracker_app/widgets/chart/chart.dart';
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
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: const Text('Expense Deleted'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
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
    final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;

    Widget mainContent =
        const Center(child: Text("Expenses not found, Add some!"));
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 181, 81),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 90, 29),
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
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ),
      ),
    );
  }
}
