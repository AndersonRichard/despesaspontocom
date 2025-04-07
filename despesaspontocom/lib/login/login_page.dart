import 'package:flutter/material.dart';
import 'package:despesaspontocom/commom/app_colors.dart';
import 'package:despesaspontocom/commom/app_text_styles.dart';
import 'package:despesaspontocom/components/gradient_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao Despesas.com',
                style: AppTextStyles.bigText.copyWith(color: AppColors.whiteColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                'Faça login para continuar',
                style: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continuar',
                  style: AppTextStyles.mediumText18.copyWith(color: AppColors.whiteColor),
                ),
              ),
              const SizedBox(height: 20),
              // Espaço reservado para o futuro botão do Google
            ],
          ),
        ),
      ),
    );
  }
}