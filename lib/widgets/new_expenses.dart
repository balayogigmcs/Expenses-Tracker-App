import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<NewExpenses> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          maxLength: 50,
          decoration: InputDecoration(
            label: Text('Title'),
          ),
        ),
      ],
    );
  }
}
