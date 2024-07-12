import 'package:first_app/expense_manager/expense_list/expense_item.dart';
import 'package:first_app/expense_manager/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => ExpenseItem(
        expense: expenseList[index],
      ),
    );
  }
}
