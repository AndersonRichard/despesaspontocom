import 'package:flutter/material.dart';
import 'package:despesaspontocom/commom/app_colors.dart';
import 'package:despesaspontocom/commom/app_text_styles.dart';
import 'package:despesaspontocom/splash/splash_page.dart';
import 'package:despesaspontocom/login/login_page.dart';
import 'package:despesaspontocom/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.darkBlue,   
        colorScheme: ColorScheme.light(
          primary: AppColors.darkBlue, 
          secondary: AppColors.grayishBlue, 
        ),
        textTheme: TextTheme(
          headlineLarge: AppTextStyles.bigText, 
          bodyLarge: AppTextStyles.mediumText18, 
          bodyMedium: AppTextStyles.smallText, 
        ),
        scaffoldBackgroundColor: AppColors.whiteColor, 
      ),
      home: const SplashPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}