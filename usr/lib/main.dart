import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/documents_screen.dart';
import 'screens/patients_screen.dart';

void main() {
  runApp(const SaudeInteligenteApp());
}

class SaudeInteligenteApp extends StatelessWidget {
  const SaudeInteligenteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde Inteligente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B), // Medical Teal
          primary: const Color(0xFF00796B),
          secondary: const Color(0xFF009688),
          surface: const Color(0xFFF5F7FA),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00796B),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF00796B),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/documents': (context) => const DocumentsScreen(),
        '/patients': (context) => const PatientsScreen(),
      },
    );
  }
}
