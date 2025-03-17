import 'package:flutter/material.dart';
import 'package:despesaspontocom/home/home_drawer.dart';
import 'package:despesaspontocom/home/home_body.dart';
import 'package:despesaspontocom/home/home_bottom_button.dart';
import 'package:despesaspontocom/components/gradient_background.dart';
import 'package:despesaspontocom/commom/app_colors.dart';
import 'package:despesaspontocom/add_expense/add_expense_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> expenses = [];

  void _addExpense(Map<String, dynamic> newExpense) {
    setState(() {
      expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Despesas.com',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
      ),
      drawer: const HomeDrawer(),
      body: GradientBackground(
        child: HomeBody(expenses: expenses),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newExpense = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExpensePage(),
            ),
          );
          if (newExpense != null) {
            _addExpense(newExpense);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}