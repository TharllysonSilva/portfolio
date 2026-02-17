import 'package:flutter/material.dart';
import 'package:portfolio/presentation/home/home_page.dart';
import '../theme/app_theme.dart';


class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarllysson Silva — Mobile Software Architect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}
