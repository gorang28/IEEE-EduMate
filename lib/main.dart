import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

void main() {
  runApp(const IEEEApp());
}

class IEEEApp extends StatelessWidget {
  const IEEEApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color globalBackground = const Color(0xFF002855);
    final TextTheme baseTextTheme = ThemeData.light().textTheme;
    final TextTheme headlineFontTextTheme = baseTextTheme.copyWith(
      headlineLarge: GoogleFonts.zillaSlab(textStyle: baseTextTheme.headlineLarge),
      headlineMedium: GoogleFonts.zillaSlab(textStyle: baseTextTheme.headlineMedium),
      headlineSmall: GoogleFonts.zillaSlab(textStyle: baseTextTheme.headlineSmall),
      titleLarge: GoogleFonts.zillaSlab(textStyle: baseTextTheme.titleLarge),
      titleMedium: GoogleFonts.zillaSlab(textStyle: baseTextTheme.titleMedium),
      titleSmall: GoogleFonts.zillaSlab(textStyle: baseTextTheme.titleSmall),
    );

    return MaterialApp(
      title: 'IEEE EduMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: globalBackground,
        textTheme: headlineFontTextTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: globalBackground,
          titleTextStyle: GoogleFonts.zillaSlab(
            textStyle: baseTextTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: globalBackground,
        textTheme: headlineFontTextTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: globalBackground,
          titleTextStyle: GoogleFonts.zillaSlab(
            textStyle: baseTextTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}