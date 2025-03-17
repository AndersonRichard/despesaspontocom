import 'package:flutter/material.dart';
import 'package:despesaspontocom/commom/app_colors.dart';
import 'package:despesaspontocom/commom/app_text_styles.dart';
import 'package:despesaspontocom/components/gradient_background.dart';
import 'package:despesaspontocom/splash/splash_page_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SplashPageAnimation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = SplashPageAnimation(controller: _controller);

    _controller.forward();

    // Navegar para a tela principal após a animação
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: FadeTransition(
            opacity: _animation.fadeAnimation,
            child: ScaleTransition(
              scale: _animation.scaleAnimation,
              child: Text(
                'Despesas.com',
                style: AppTextStyles.bigText.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}