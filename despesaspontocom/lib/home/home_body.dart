import 'package:flutter/material.dart';
import 'package:despesaspontocom/commom/app_colors.dart';
import 'package:despesaspontocom/commom/app_text_styles.dart';

class HomeBody extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;

  const HomeBody({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Saldo da conta
          Center(
            child: Column(
              children: [
                Text(
                  'Saldo da Conta',
                  style: AppTextStyles.mediumText18.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ 5.000,00',
                  style: AppTextStyles.bigText.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Saldo total a pagar
          Center(
            child: Column(
              children: [
                Text(
                  'Total a Pagar',
                  style: AppTextStyles.mediumText18.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ ${expenses.fold(0.0, (sum, expense) => sum + expense['value']).toStringAsFixed(2)}',
                  style: AppTextStyles.bigText.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Próximas contas a pagar
          if (expenses.isNotEmpty)
            Text(
              'Próximas Contas a Pagar',
              style: AppTextStyles.mediumText18.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          const SizedBox(height: 8),
          if (expenses.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return Card(
                    color: AppColors.whiteColor.withOpacity(0.8),
                    child: ListTile(
                      title: Text(
                        expense['description'],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        'Vencimento: ${expense['dueDate']}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: Text(
                        'R\$ ${expense['value'].toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}