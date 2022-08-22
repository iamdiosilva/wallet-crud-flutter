import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'login_page/login_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    initializeDateFormatting('en_US', null);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
