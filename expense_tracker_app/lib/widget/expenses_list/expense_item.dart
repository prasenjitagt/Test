import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.singleExpenseItem});

  final Expense singleExpenseItem;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(singleExpenseItem.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${singleExpenseItem.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[singleExpenseItem.category]),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(singleExpenseItem.forMattedDate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
