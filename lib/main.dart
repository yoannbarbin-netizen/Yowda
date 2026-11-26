import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_shell.dart';
import 'data/session_hive.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await sessionStorage.init();
  runApp(const AppliMuscu());
}

class AppliMuscu extends StatelessWidget {
  const AppliMuscu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(top: false, child: child!),
      title: 'Appli Muscu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark, // ou ThemeMode.system une fois les deux modes validés
      home: const AppShell(),
    );
  }
}
