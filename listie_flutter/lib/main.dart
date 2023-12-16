import 'package:flutter/material.dart';
import 'package:listie_flutter/core/singletons.dart';
import 'package:listie_flutter/utils/themes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listie',
      theme: ThemesManager.theme,
      home: const Scaffold(
        body: Center(
          child: Text('Home page.'),
        ),
      ),
    );
  }
}
