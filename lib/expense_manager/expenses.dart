// ignore_for_file: use_build_context_synchronously

import 'package:first_app/expense_manager/expense_list/expense_list.dart';
import 'package:first_app/expense_manager/models/expense.dart';
import 'package:first_app/expense_manager/widgets/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      _expensList.add(expense);
    });
  }

  Future<void> _openAddExpense() async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(
        addExpense: addExpense,
      ),
    );
  }

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
            onPressed: _openAddExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Charts...."),
          Expanded(
            child: ExpenseList(expenseList: _expensList),
          ),
        ],
      ),
    );
  }
}
