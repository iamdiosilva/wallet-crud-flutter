import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/balance_repository.dart';
import 'repositories/transactions_repository.dart';
import 'view/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionsRepository()),
        ChangeNotifierProvider(create: (context) => BalanceRepository()),
      ],
      child: const App(),
    ),
  );
}
