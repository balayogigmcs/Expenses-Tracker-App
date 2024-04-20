import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<NewExpenses> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  
  final _titleController = TextEditingController();

  void dispose(){
    
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController ,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {
                print(_titleController.text);
              },
              child: const Text('Save Expense'),
            ),
          ],
        )
      ],
    );
  }
}
