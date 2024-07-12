import 'package:first_app/expense_manager/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expensList = [
    Expense(
        title: 'Lunch',
        amount: 12.95,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Flutter Course',
        amount: 99.95,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Vacation',
        amount: 1000.00,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Dinner',
        amount: 30.99,
        date: DateTime.now(),
        category: Category.food)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Manager'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Column(
        children: [
          Text("Charts...."),
        ],
      ),
    );
  }
}
