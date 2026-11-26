import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_shell.dart';
import 'data/reglages.dart';
import 'data/session_hive.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await sessionStorage.init();
  await Reglages.init();
  runApp(const AppliMuscu());
}

class AppliMuscu extends StatelessWidget {
  const AppliMuscu({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: reglagesModeClair,
      builder: (context, modeClair, _) => MaterialApp(
        builder: (context, child) => SafeArea(top: false, child: child!),
        title: 'Appli Muscu',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: modeClair ? ThemeMode.light : ThemeMode.dark,
        home: const AppShell(),
      ),
    );
  }
}
