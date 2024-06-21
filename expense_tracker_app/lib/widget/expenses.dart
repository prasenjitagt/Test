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
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              addExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final indexToBeDeleted = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(indexToBeDeleted, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No Expenses. Add one!"));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenseList: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }
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
        children: [const Text("Expense List"), Expanded(child: mainContent)],
      ),
    );
  }
}
