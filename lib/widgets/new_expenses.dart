import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<NewExpenses> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  var _enteredTitle = "";

  void _saveTitleInput(String inputValues) {
    _enteredTitle = inputValues;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: _saveTitleInput,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {
                print(_enteredTitle);
              },
              child: const Text('Save Expense'),
            ),
          ],
        )
      ],
    );
  }
}
