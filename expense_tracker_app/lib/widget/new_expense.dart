import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<NewExpense> {
  @override
  Widget build(contex) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          )
        ],
      ),
    );
  }
}
