import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'pages/intro_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2D1E18),
            surface: const Color(0xFFF5F2EB),
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F2EB),
        ),
        home: const IntroPage(),
      ), // MaterialApp
    ); // ChangeNotifierProvider
  }
}