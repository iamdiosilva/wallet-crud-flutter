import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle homeLabel = const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300);
  static TextStyle homeTitles = const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300);
  static TextStyle homeLabelBold = const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle cardText = const TextStyle(color: Colors.white);
  static TextStyle balanceText = const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700);

  static TextStyle buttonLabel = TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500);

  static TextStyle listTileTitle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle listTileSubtitle = const TextStyle(fontSize: 16, color: Colors.white54);

  static TextStyle listTileTransactions = const TextStyle(color: Colors.white);
  static TextStyle listTileTransactionsData = const TextStyle(color: Colors.white, fontSize: 12);
  static TextStyle listTileTransactionsValueCredit = const TextStyle(color: Colors.green, fontSize: 16);
  static TextStyle listTileTransactionsValueDebit = const TextStyle(color: Colors.red, fontSize: 16);
}
