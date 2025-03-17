import 'package:flutter/material.dart';
import 'package:despesaspontocom/add_expense/add_expense_page.dart';
import 'package:despesaspontocom/components/gradient_background.dart';
import 'package:despesaspontocom/home/home_body.dart';
import 'package:despesaspontocom/home/home_drawer.dart';
import 'package:despesaspontocom/commom/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> expenses = [];

  // Função para adicionar uma nova despesa
  void _addExpense(Map<String, dynamic> newExpense) {
    setState(() {
      expenses.add({...newExpense, 'isPaid': false}); // Adiciona o campo isPaid
    });
  }

  // Função para marcar uma despesa como paga
  void _markAsPaid(int index) {
    setState(() {
      expenses[index]['isPaid'] = true; // Marca a despesa como paga
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
      drawer: const HomeDrawer(), // Drawer da HomePage
      body: GradientBackground(
        child: HomeBody(
          expenses: expenses,
          onMarkAsPaid: _markAsPaid, // Passa a função para marcar como paga
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navega para a tela de adicionar despesa
          final newExpense = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExpensePage(),
            ),
          );
          // Se uma nova despesa foi adicionada, atualiza a lista
          if (newExpense != null) {
            _addExpense(newExpense);
          }
        },
        child: const Icon(Icons.add), // Ícone do botão de adicionar
      ),
    );
  }
}