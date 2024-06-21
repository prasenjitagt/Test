import 'package:expense_tracker_app/widget/expenses_list/expense_list.dart';
import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:expense_tracker_app/widget/new_expense.dart';
import 'package:flutter/material.dart';

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
      title: "Laptop",
      amount: 156452.65,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Phone",
      amount: 15000,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _showAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _showAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("Expense List"),
          Expanded(child: ExpenseList(expenseList: _registeredExpenses))
        ],
      ),
    );
  }
}
