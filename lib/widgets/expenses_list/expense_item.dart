import 'package:flutter/material.dart';
import 'package:expenses_tracker_app/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category],color: Colors.white,),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      expense.formattedDate,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
