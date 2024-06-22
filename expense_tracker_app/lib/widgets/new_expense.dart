import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;
  @override
  State<NewExpense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<NewExpense> {
  final _titleTextController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: today,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpense() {
    final amount = double.tryParse(_amountController.text);
    final invalidAmount = amount == null || amount <= 0;

    if (_titleTextController.text.trim().isEmpty ||
        invalidAmount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input!"),
          content: const Text(
              "Make sure You have entered correct amount, title and date"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }

    final expenseToBeAdded = Expense(
        title: _titleTextController.text,
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory);

    widget.addExpense(expenseToBeAdded);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(contex) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleTextController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 7,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text("\$ "),
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? "Select Date"
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month_outlined),
                  )
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((eachCategory) => DropdownMenuItem(
                          value: eachCategory,
                          child: Text(eachCategory.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _amountController.text = "";
                    _titleTextController.text = "";
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: _submitExpense,
                  child: const Text("Save Expense!")),
            ],
          )
        ],
      ),
    );
  }
}
