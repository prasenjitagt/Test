import 'package:expense_tracker_app/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense_model.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList});

  final List<Expense> expenseList;
  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (ctx, index) =>
            ExpenseItem(singleExpenseItem: expenseList[index]));
  }
}
